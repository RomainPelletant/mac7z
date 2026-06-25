import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // Set up method channel for window control
    let windowChannel = FlutterMethodChannel(
      name: "com.mac7z/window",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )
    windowChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
      case "closeWindow":
        self?.performClose(nil)
        result(nil)
      case "minimizeWindow":
        self?.miniaturize(nil)
        result(nil)
      case "toggleFullscreen":
        self?.toggleFullScreen(nil)
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    RegisterGeneratedPlugins(registry: flutterViewController)

    self.styleMask = [.titled, .closable, .miniaturizable, .resizable]
    self.collectionBehavior.insert(.fullScreenPrimary)
    self.appearance = nil

    // Légère transparence — 96 % opaque, fiable, sans manipulation de vues
    self.alphaValue = 0.96

    super.awakeFromNib()
  }
}
