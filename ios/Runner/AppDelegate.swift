import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

      let methodChannel = FlutterMethodChannel(name: "com.nativeActivity/iosChannel", binaryMessenger:controller.binaryMessenger)

      methodChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
              
        if call.method == "StartNativeIOS" {
          let mainVC = RoomCaptureViewController() // Your viewController
          let navigationController = UINavigationController(rootViewController: mainVC)
          self.window.rootViewController = navigationController
          self.window.makeKeyAndVisible()
        } else {
          result(FlutterMethodNotImplemented)
          return
        }
      })
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
