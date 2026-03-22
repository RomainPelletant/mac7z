import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {

  // Stores a file path received before Flutter is ready
  private var pendingFilePath: String?
  // Stores paths received via "Compress with mac7z" before Flutter is ready
  private var pendingCompressPaths: [String]?

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  // Called when the user double-clicks an archive in Finder
  override func application(_ sender: NSApplication, openFile filename: String) -> Bool {
    if let channel = fileOpenChannel() {
      channel.invokeMethod("openFile", arguments: filename)
    } else {
      pendingFilePath = filename
    }
    return true
  }

  // Also handles multiple files / macOS 10.15+ open URLs (file:// only)
  override func application(_ application: NSApplication, open urls: [URL]) {
    guard let url = urls.first, url.isFileURL else { return }
    let path = url.path
    if let channel = fileOpenChannel() {
      channel.invokeMethod("openFile", arguments: path)
    } else {
      pendingFilePath = path
    }
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    super.applicationDidFinishLaunching(notification)

    // Register for the mac7z:// URL scheme dispatched by the Finder Sync Extension.
    // Apple Events is the reliable cross-process mechanism for custom URL schemes in Cocoa.
    NSAppleEventManager.shared().setEventHandler(
      self,
      andSelector: #selector(handleURLEvent(_:withReplyEvent:)),
      forEventClass: AEEventClass(kInternetEventClass),
      andEventID: AEEventID(kAEGetURL)
    )

    // Register NSServices provider (for Services submenu fallback)
    NSApp.servicesProvider = self
    NSUpdateDynamicServices()

    // Flush any paths that arrived before Flutter was ready
    if let path = pendingFilePath, let channel = fileOpenChannel() {
      channel.invokeMethod("openFile", arguments: path)
      pendingFilePath = nil
    }
    if let paths = pendingCompressPaths, let channel = fileOpenChannel() {
      channel.invokeMethod("compressFiles", arguments: paths)
      pendingCompressPaths = nil
    }
  }

  // MARK: - mac7z:// URL scheme (from Finder Sync Extension)

  /// Handles mac7z://extract?b64=<base64> and mac7z://compress?b64=<base64>
  @objc func handleURLEvent(
    _ event: NSAppleEventDescriptor,
    withReplyEvent: NSAppleEventDescriptor
  ) {
    guard
      let urlString = event.paramDescriptor(forKeyword: keyDirectObject)?.stringValue,
      let url       = URL(string: urlString),
      url.scheme    == "mac7z"
    else { return }

    let command = url.host ?? ""  // "extract" or "compress"

    // Decode base64 paths
    guard
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
      let b64        = components.queryItems?.first(where: { $0.name == "b64" })?.value,
      let data       = Data(base64Encoded: b64),
      let joined     = String(data: data, encoding: .utf8)
    else { return }

    let paths = joined.components(separatedBy: "\n").filter { !$0.isEmpty }
    guard !paths.isEmpty else { return }

    NSApp.activate(ignoringOtherApps: true)

    if command == "extract", let path = paths.first {
      if let channel = fileOpenChannel() {
        channel.invokeMethod("openFile", arguments: path)
      } else {
        pendingFilePath = path
      }
    } else if command == "compress" {
      if let channel = fileOpenChannel() {
        channel.invokeMethod("compressFiles", arguments: paths)
      } else {
        pendingCompressPaths = paths
      }
    }
  }

  // MARK: - NSServices (Services submenu fallback)

  @objc func extractWithMac7z(
    _ pboard: NSPasteboard,
    userData: String,
    error: AutoreleasingUnsafeMutablePointer<NSString?>?
  ) {
    let paths = filePaths(from: pboard)
    guard let path = paths.first else { return }
    NSApp.activate(ignoringOtherApps: true)
    if let channel = fileOpenChannel() {
      channel.invokeMethod("openFile", arguments: path)
    } else {
      pendingFilePath = path
    }
  }

  @objc func compressWithMac7z(
    _ pboard: NSPasteboard,
    userData: String,
    error: AutoreleasingUnsafeMutablePointer<NSString?>?
  ) {
    let paths = filePaths(from: pboard)
    guard !paths.isEmpty else { return }
    NSApp.activate(ignoringOtherApps: true)
    if let channel = fileOpenChannel() {
      channel.invokeMethod("compressFiles", arguments: paths)
    } else {
      pendingCompressPaths = paths
    }
  }

  // MARK: - Helpers

  private func filePaths(from pboard: NSPasteboard) -> [String] {
    if let urls = pboard.readObjects(
      forClasses: [NSURL.self],
      options: [.urlReadingFileURLsOnly: true]
    ) as? [URL] {
      return urls.map { $0.path }
    }
    return (pboard.propertyList(
      forType: NSPasteboard.PasteboardType("NSFilenamesPboardType")
    ) as? [String]) ?? []
  }

  private func fileOpenChannel() -> FlutterMethodChannel? {
    guard
      let controller = mainFlutterWindow?.contentViewController as? FlutterViewController
    else { return nil }
    return FlutterMethodChannel(
      name: "com.mac7z/file_open",
      binaryMessenger: controller.engine.binaryMessenger
    )
  }
}
