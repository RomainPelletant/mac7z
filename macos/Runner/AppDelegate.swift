import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {

  /// Pasteboard name shared with the FinderSync extension (mirrors FinderSync.swift).
  private static let actionPasteboardName = NSPasteboard.Name("com.mac7z.action")
  private static let actionPasteboardType = NSPasteboard.PasteboardType("com.mac7z.action")

  // Stores a file path received before Flutter is ready
  private var pendingFilePath: String?
  private var pendingCompressPaths: [String]?
  private var flutterIsReady = false
  private var fileOpenChannelRef: FlutterMethodChannel?
  private var fileOpenChannelHandlerInstalled = false

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  // MARK: - Lifecycle

  override func applicationWillFinishLaunching(_ notification: Notification) {
    // Register Apple Event handler early so cold-start URL events are not missed.
    NSAppleEventManager.shared().setEventHandler(
      self,
      andSelector: #selector(handleURLEvent(_:withReplyEvent:)),
      forEventClass: AEEventClass(kInternetEventClass),
      andEventID: AEEventID(kAEGetURL)
    )
    NSLog("[mac7z] applicationWillFinishLaunching: Apple Event handler registered")
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    super.applicationDidFinishLaunching(notification)

    NSApp.servicesProvider = self
    NSUpdateDynamicServices()

    if !ensureFileOpenChannelInstalled() {
      NSLog("[mac7z] applicationDidFinishLaunching: fileOpenChannel() is nil, will retry")
    }

    // Also check the pasteboard on launch (cold start from extension).
    consumePendingPasteboardAction()
  }

  override func applicationDidBecomeActive(_ notification: Notification) {
    // Called every time the app comes to the foreground — including when the Finder
    // Sync Extension activates us after writing to the named pasteboard.
    NSLog("[mac7z] applicationDidBecomeActive")
    _ = ensureFileOpenChannelInstalled()
    consumePendingPasteboardAction()
  }

  // MARK: - Named pasteboard IPC (primary mechanism from sandboxed FinderSync extension)

  private func consumePendingPasteboardAction() {
    let pb = NSPasteboard(name: Self.actionPasteboardName)

    guard
      let payload = pb.propertyList(forType: Self.actionPasteboardType) as? [String: Any],
      let command = payload["command"] as? String,
      let paths   = payload["paths"] as? [String],
      !paths.isEmpty
    else { return }

    // Clear the pasteboard so we don't process the same action twice.
    pb.clearContents()

    NSLog("[mac7z] consumePendingPasteboardAction: command=%@, paths=%@", command, paths)
    NSApp.activate(ignoringOtherApps: true)

    if command == "extract", let path = paths.first {
      pendingFilePath = path
      pendingCompressPaths = nil
    } else if command == "compress" {
      pendingCompressPaths = paths
      pendingFilePath = nil
    }

    scheduleFlush()
  }

  // MARK: - File / URL open delegates (double-click in Finder, drag onto dock, etc.)

  override func application(_ sender: NSApplication, openFile filename: String) -> Bool {
    NSLog("[mac7z] openFile (legacy): %@", filename)
    storePendingFile(filename)
    scheduleFlush()
    return true
  }

  override func application(_ application: NSApplication, open urls: [URL]) {
    NSLog("[mac7z] application:open:urls count=%d", urls.count)
    for url in urls {
      if url.isFileURL {
        NSLog("[mac7z] application:open: file URL: %@", url.path)
        storePendingFile(url.path)
        scheduleFlush()
      } else if url.scheme == "mac7z" {
        NSLog("[mac7z] application:open: mac7z URL: %@", url.absoluteString)
        handleMac7zURL(url)
      }
    }
  }

  // MARK: - Apple Event handler (URL scheme fallback for non-sandboxed / Release builds)

  @objc func handleURLEvent(
    _ event: NSAppleEventDescriptor,
    withReplyEvent: NSAppleEventDescriptor
  ) {
    guard
      let urlString = event.paramDescriptor(forKeyword: keyDirectObject)?.stringValue
    else { NSLog("[mac7z] handleURLEvent: no urlString"); return }

    NSLog("[mac7z] handleURLEvent: %@", urlString)

    guard
      let url = URL(string: urlString),
      url.scheme == "mac7z"
    else { NSLog("[mac7z] handleURLEvent: invalid URL or scheme"); return }

    handleMac7zURL(url)
  }

  // MARK: - Shared mac7z:// URL parser

  private func handleMac7zURL(_ url: URL) {
    let command = url.host ?? ""
    NSLog("[mac7z] handleMac7zURL: command=%@", command)

    guard
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
      let b64        = components.queryItems?.first(where: { $0.name == "b64" })?.value
    else { NSLog("[mac7z] handleMac7zURL: missing b64 param"); return }

    guard
      let data   = Data(base64Encoded: b64),
      let joined = String(data: data, encoding: .utf8)
    else { NSLog("[mac7z] handleMac7zURL: base64 decode failed"); return }

    let paths = joined.components(separatedBy: "\n").filter { !$0.isEmpty }
    guard !paths.isEmpty else { return }

    NSLog("[mac7z] handleMac7zURL: paths=%@", paths)
    NSApp.activate(ignoringOtherApps: true)

    if command == "extract", let path = paths.first {
      pendingFilePath = path
      pendingCompressPaths = nil
    } else if command == "compress" {
      pendingCompressPaths = paths
      pendingFilePath = nil
    }

    scheduleFlush()
  }

  // MARK: - NSServices (Services submenu)

  @objc func extractWithMac7z(
    _ pboard: NSPasteboard,
    userData: String,
    error: AutoreleasingUnsafeMutablePointer<NSString?>?
  ) {
    let paths = filePaths(from: pboard)
    guard let path = paths.first else { return }
    NSLog("[mac7z] extractWithMac7z (service): %@", path)
    NSApp.activate(ignoringOtherApps: true)
    storePendingFile(path)
    scheduleFlush()
  }

  @objc func compressWithMac7z(
    _ pboard: NSPasteboard,
    userData: String,
    error: AutoreleasingUnsafeMutablePointer<NSString?>?
  ) {
    let paths = filePaths(from: pboard)
    guard !paths.isEmpty else { return }
    NSLog("[mac7z] compressWithMac7z (service): count=%d", paths.count)
    NSApp.activate(ignoringOtherApps: true)
    pendingCompressPaths = paths
    pendingFilePath = nil
    scheduleFlush()
  }

  // MARK: - Pending delivery

  private func storePendingFile(_ path: String) {
    pendingFilePath = path
    pendingCompressPaths = nil
  }

  private func scheduleFlush() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
      _ = self?.ensureFileOpenChannelInstalled()
      self?.flushPendingToFlutter()
    }
  }

  private func flushPendingToFlutter() {
    guard flutterIsReady else {
      NSLog("[mac7z] flushPendingToFlutter: not ready yet (flutterIsReady=%d)", flutterIsReady ? 1 : 0)
      return
    }
    guard let channel = fileOpenChannel() else {
      NSLog("[mac7z] flushPendingToFlutter: channel unavailable, will retry")
      scheduleFlush()
      return
    }
    if let path = pendingFilePath {
      NSLog("[mac7z] flushPendingToFlutter: invoking openFile path=%@", path)
      pendingFilePath = nil
      channel.invokeMethod("openFile", arguments: path)
    } else if let paths = pendingCompressPaths {
      NSLog("[mac7z] flushPendingToFlutter: invoking compressFiles count=%d", paths.count)
      pendingCompressPaths = nil
      channel.invokeMethod("compressFiles", arguments: paths)
    } else {
      NSLog("[mac7z] flushPendingToFlutter: nothing pending")
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
    if let channel = fileOpenChannelRef {
      return channel
    }
    guard
      let controller = mainFlutterWindow?.contentViewController as? FlutterViewController
    else { return nil }
    let channel = FlutterMethodChannel(
      name: "com.mac7z/file_open",
      binaryMessenger: controller.engine.binaryMessenger
    )
    fileOpenChannelRef = channel
    return channel
  }

  @discardableResult
  private func ensureFileOpenChannelInstalled() -> Bool {
    guard let channel = fileOpenChannel() else { return false }
    guard !fileOpenChannelHandlerInstalled else { return true }

    NSLog("[mac7z] ensureFileOpenChannelInstalled: registering handler")
    channel.setMethodCallHandler { [weak self] call, result in
      if call.method == "flutterReady" {
        NSLog("[mac7z] flutterReady received, pending=%@", self?.pendingFilePath ?? "nil")
        self?.flutterIsReady = true
        result(true)
        self?.flushPendingToFlutter()
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    fileOpenChannelHandlerInstalled = true
    return true
  }
}
