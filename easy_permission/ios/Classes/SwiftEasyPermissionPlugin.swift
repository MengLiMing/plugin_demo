import Flutter
import UIKit
import EasyKits

public class SwiftEasyPermissionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "easy_permission", binaryMessenger: registrar.messenger())
    let instance = SwiftEasyPermissionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "cameraStatus":
          Permission.camera.status { status in
              result(status.value)
          }
      case "requestCamera":
          Permission.camera.request { status in
              result(status.value)
          }
      case "accessCamera":
          Permission.camera.access { status in
              result(status.value)
          }
      default:
          result(PermissionStatus.notSupported.value)
      }
  }
}

extension PermissionStatus {
    var value: String {
        return "\(self)"
    }
}
