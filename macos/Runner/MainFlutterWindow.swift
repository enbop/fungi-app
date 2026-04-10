import Cocoa
import FlutterMacOS
import ServiceManagement

class MainFlutterWindow: NSWindow {
  private let dockChannelName = "fungi_app/macos_dock_visibility"
  private let launchAtLoginChannelName = "fungi_app/launch_at_login"

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
    configureLaunchAtLoginChannel(with: flutterViewController)

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

  private func configureLaunchAtLoginChannel(with controller: FlutterViewController) {
    let launchAtLoginChannel = FlutterMethodChannel(
      name: launchAtLoginChannelName,
      binaryMessenger: controller.engine.binaryMessenger
    )

    launchAtLoginChannel.setMethodCallHandler { call, result in
      switch call.method {
      case "getStatus":
        result(self.makeLaunchAtLoginStatus())
      case "shouldLaunchToTrayOnStartup":
        result(self.shouldLaunchToTrayOnStartup())
      case "setEnabled":
        guard
          let arguments = call.arguments as? [String: Any],
          let enabled = arguments["enabled"] as? Bool
        else {
          result(
            FlutterError(
              code: "invalid_args",
              message: "Missing enabled flag.",
              details: nil
            )
          )
          return
        }

        self.setLaunchAtLoginEnabled(enabled, result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  private func makeLaunchAtLoginStatus() -> [String: Any] {
    if #available(macOS 13.0, *) {
      let status = SMAppService.mainApp.status
      return [
        "supported": true,
        "enabled": status == .enabled,
        "requiresApproval": status == .requiresApproval,
      ]
    }

    return [
      "supported": false,
      "enabled": false,
      "requiresApproval": false,
    ]
  }

  private func setLaunchAtLoginEnabled(
    _ enabled: Bool,
    result: @escaping FlutterResult
  ) {
    guard #available(macOS 13.0, *) else {
      result(makeLaunchAtLoginStatus())
      return
    }

    do {
      if enabled {
        try SMAppService.mainApp.register()
      } else {
        try SMAppService.mainApp.unregister()
      }

      result(makeLaunchAtLoginStatus())
    } catch {
      result(
        FlutterError(
          code: "launch_at_login_error",
          message: error.localizedDescription,
          details: nil
        )
      )
    }
  }

  private func shouldLaunchToTrayOnStartup() -> Bool {
    guard #available(macOS 13.0, *) else {
      return false
    }

    guard SMAppService.mainApp.status == .enabled || SMAppService.mainApp.status == .requiresApproval else {
      return false
    }

    guard let event = NSAppleEventManager.shared().currentAppleEvent else {
      return false
    }

    guard event.eventID == AEEventID(kAEOpenApplication) else {
      return false
    }

    return event.paramDescriptor(forKeyword: AEKeyword(keyAEPropData))?.enumCodeValue ==
      AEEventID(keyAELaunchedAsLogInItem)
  }
}
