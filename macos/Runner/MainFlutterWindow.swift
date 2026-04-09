import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private let dockChannelName = "fungi_app/macos_dock_visibility"

  func restoreAndActivate() {
    let showWindow = {
      NSApp.setActivationPolicy(.regular)

      if self.isMiniaturized {
        self.deminiaturize(nil)
      }

      if !self.isVisible {
        self.setIsVisible(true)
      }

      self.makeKeyAndOrderFront(nil)
      self.orderFrontRegardless()
      NSApp.activate(ignoringOtherApps: true)
    }

    if Thread.isMainThread {
      showWindow()
    } else {
      DispatchQueue.main.async(execute: showWindow)
    }
  }

  func hideToTray() {
    let hideWindow = {
      self.orderOut(nil)
      NSApp.setActivationPolicy(.accessory)
    }

    if Thread.isMainThread {
      hideWindow()
    } else {
      DispatchQueue.main.async(execute: hideWindow)
    }
  }

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
      case "showDockIcon", "showMainWindow":
        self.restoreAndActivate()
        result(nil)
      case "hideDockIcon", "hideMainWindow":
        self.hideToTray()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }
}
