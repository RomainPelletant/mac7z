//
//  FinderSync.swift
//  FinderSyncExt
//
//  Created by Romain PELLETANT on 11/03/2026.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {

    private let archiveExtensions: Set<String> = [
        "7z", "zip", "tar", "gz", "bz2", "xz", "rar", "zst",
        "tgz", "tbz", "tbz2", "txz", "wim", "iso", "dmg"
    ]

    /// Pasteboard name shared with the main app (no entitlement needed).
    private static let actionPasteboardName = NSPasteboard.Name("com.mac7z.action")
    private static let actionPasteboardType = NSPasteboard.PasteboardType("com.mac7z.action")

    override init() {
        super.init()
        FIFinderSyncController.default().directoryURLs = [URL(fileURLWithPath: "/")]
    }

    // MARK: - Context menu

    override func menu(for menuKind: FIMenuKind) -> NSMenu? {
        guard menuKind == .contextualMenuForItems else { return nil }

        let items = FIFinderSyncController.default().selectedItemURLs() ?? []
        guard !items.isEmpty else { return nil }

        let menu = NSMenu(title: "")

        if items.allSatisfy({ isArchive($0) }) {
            let extractItem = NSMenuItem(
                title: loc("Extract with mac7z", fr: "Extraire avec mac7z"),
                action: #selector(extractSelected(_:)),
                keyEquivalent: ""
            )
            extractItem.target = self
            extractItem.image = adaptiveSymbol("archivebox")
            menu.addItem(extractItem)
        }

        let compressItem = NSMenuItem(
            title: loc("Compress with mac7z", fr: "Compresser avec mac7z"),
            action: #selector(compressSelected(_:)),
            keyEquivalent: ""
        )
        compressItem.target = self
        compressItem.image = adaptiveSymbol("doc.zipper")
        menu.addItem(compressItem)

        return menu
    }

    // MARK: - Actions

    @objc func extractSelected(_ sender: NSMenuItem) {
        let items = FIFinderSyncController.default().selectedItemURLs() ?? []
        guard let archiveURL = items.first else { return }
        NSLog("[mac7z-ext] extractSelected: %@", archiveURL.path)
        sendAction(command: "extract", paths: [archiveURL.path])
    }

    @objc func compressSelected(_ sender: NSMenuItem) {
        let items = FIFinderSyncController.default().selectedItemURLs() ?? []
        let paths = items.map { $0.path }
        NSLog("[mac7z-ext] compressSelected: %d items", paths.count)
        sendAction(command: "compress", paths: paths)
    }

    // MARK: - IPC via named NSPasteboard

    /// Write the command to a named pasteboard, then bring the main app to the foreground.
    ///
    /// Named pasteboards are accessible between any processes on macOS —
    /// no App Group entitlement is required, and the sandbox does not restrict them.
    private func sendAction(command: String, paths: [String]) {
        // 1. Write payload to named pasteboard.
        let pb = NSPasteboard(name: Self.actionPasteboardName)
        pb.clearContents()
        let payload: NSDictionary = [
            "command": command,
            "paths": paths as NSArray
        ]
        let ok = pb.setPropertyList(payload, forType: Self.actionPasteboardType)
        NSLog("[mac7z-ext] sendAction: pasteboard write ok=%d, command=%@, paths=%@", ok ? 1 : 0, command, paths)

        // 2. Bring the main app to the foreground (launches it if needed).
        guard let appURL = containingAppURL() else {
            NSLog("[mac7z-ext] sendAction: could not resolve containing app URL")
            return
        }

        if #available(macOS 10.15, *) {
            let config = NSWorkspace.OpenConfiguration()
            config.activates = true
            NSWorkspace.shared.openApplication(at: appURL, configuration: config) { _, error in
                if let error = error {
                    NSLog("[mac7z-ext] openApplication error: %@", error.localizedDescription)
                } else {
                    NSLog("[mac7z-ext] openApplication success")
                }
            }
        } else {
            NSWorkspace.shared.open(appURL)
        }
    }

    // MARK: - Helpers

    private func isArchive(_ url: URL) -> Bool {
        let ext = url.pathExtension.lowercased()
        if archiveExtensions.contains(ext) { return true }
        let path = url.path.lowercased()
        return path.hasSuffix(".tar.gz")
            || path.hasSuffix(".tar.bz2")
            || path.hasSuffix(".tar.xz")
            || path.hasSuffix(".tar.zst")
    }

    private func adaptiveSymbol(_ name: String) -> NSImage? {
        guard #available(macOS 11.0, *) else { return nil }
        if #available(macOS 12.0, *) {
            let config = NSImage.SymbolConfiguration(hierarchicalColor: .labelColor)
            return NSImage(systemSymbolName: name, accessibilityDescription: nil)?
                .withSymbolConfiguration(config)
        } else {
            let img = NSImage(systemSymbolName: name, accessibilityDescription: nil)
            img?.isTemplate = true
            return img
        }
    }

    private func loc(_ en: String, fr: String) -> String {
        let lang = Locale.preferredLanguages.first ?? "en"
        return lang.hasPrefix("fr") ? fr : en
    }

    /// Extension bundle: mac7z.app/Contents/PlugIns/FinderSyncExt.appex
    /// → go up 3 levels to get mac7z.app
    private func containingAppURL() -> URL? {
        let appURL = Bundle.main.bundleURL
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        guard appURL.pathExtension == "app" else {
            NSLog("[mac7z-ext] containingAppURL: unexpected path %@", appURL.path)
            return nil
        }
        return appURL
    }
}
