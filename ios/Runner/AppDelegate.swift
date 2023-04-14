import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self);
      let controller : FlutterBinaryMessenger = window?.rootViewController as! FlutterBinaryMessenger;
      let pipChannel = FlutterMethodChannel.init(name: "overlay", binaryMessenger: controller);
      pipChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          if("OpenPip" == call.method){
              
          }
          })
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
