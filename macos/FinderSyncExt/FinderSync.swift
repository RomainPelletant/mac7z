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

    override init() {
        super.init()
        // Monitor the entire filesystem so context menu items appear everywhere.
        FIFinderSyncController.default().directoryURLs = [URL(fileURLWithPath: "/")]
    }

    // MARK: - Context menu

    override func menu(for menuKind: FIMenuKind) -> NSMenu? {
        guard menuKind == .contextualMenuForItems else { return nil }

        let items = FIFinderSyncController.default().selectedItemURLs() ?? []
        guard !items.isEmpty else { return nil }

        let menu = NSMenu(title: "")

        // Show "Extract" only when every selected item is a known archive.
        if items.allSatisfy({ isArchive($0) }) {
            let extractItem = NSMenuItem(
                title: "Extract with mac7z",
                action: #selector(extractSelected(_:)),
                keyEquivalent: ""
            )
            extractItem.target = self
            if #available(macOS 11.0, *) {
                extractItem.image = NSImage(systemSymbolName: "archivebox", accessibilityDescription: nil)
            }
            menu.addItem(extractItem)
        }

        // "Compress" is always available for any file or folder.
        let compressItem = NSMenuItem(
            title: "Compress with mac7z",
            action: #selector(compressSelected(_:)),
            keyEquivalent: ""
        )
        compressItem.target = self
        if #available(macOS 11.0, *) {
            compressItem.image = NSImage(systemSymbolName: "doc.zipper", accessibilityDescription: nil)
        }
        menu.addItem(compressItem)

        return menu
    }

    // MARK: - Actions

    @objc func extractSelected(_ sender: NSMenuItem) {
        let items = FIFinderSyncController.default().selectedItemURLs() ?? []
        guard let url = items.first else { return }
        openMainApp(command: "extract", paths: [url.path])
    }

    @objc func compressSelected(_ sender: NSMenuItem) {
        let items = FIFinderSyncController.default().selectedItemURLs() ?? []
        let paths = items.map { $0.path }
        openMainApp(command: "compress", paths: paths)
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

    /// Encode the paths into a mac7z:// URL and open the main app.
    private func openMainApp(command: String, paths: [String]) {
        let joined = paths.joined(separator: "\n")
        guard let data = joined.data(using: .utf8) else { return }
        let b64 = data.base64EncodedString()
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "mac7z://\(command)?b64=\(b64)") else { return }
        NSWorkspace.shared.open(url)
    }
}
