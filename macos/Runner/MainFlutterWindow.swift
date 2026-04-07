import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private let dockChannelName = "fungi_app/macos_dock_visibility"

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    configureDockChannel(with: flutterViewController)

    super.awakeFromNib()
  }

  private func configureDockChannel(with controller: FlutterViewController) {
    let dockChannel = FlutterMethodChannel(
      name: dockChannelName,
      binaryMessenger: controller.engine.binaryMessenger
    )

    dockChannel.setMethodCallHandler { call, result in
      switch call.method {
      case "showDockIcon":
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)
        result(nil)
      case "hideDockIcon":
        NSApp.setActivationPolicy(.accessory)
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }
}
