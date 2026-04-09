import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  private func restoreMainWindow() {
    if let mainWindow = NSApp.windows.first(where: { $0 is MainFlutterWindow }) as? MainFlutterWindow {
      mainWindow.restoreAndActivate()
      return
    }

    for window in NSApp.windows {
      if window.isMiniaturized {
        window.deminiaturize(nil)
      }
      if !window.isVisible {
        window.setIsVisible(true)
      }
      window.makeKeyAndOrderFront(self)
      window.orderFrontRegardless()
    }

    NSApp.setActivationPolicy(.regular)
    NSApp.activate(ignoringOtherApps: true)
  }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }

  override func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    restoreMainWindow()
    return false
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
