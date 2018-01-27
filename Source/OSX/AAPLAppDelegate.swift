import Cocoa

@NSApplicationMain
@objc(AAPLAppDelegate)

class AAPLAppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { return true }
}
