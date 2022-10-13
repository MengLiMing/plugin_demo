//
//  SimplePlugin.swift
//  Runner
//
//  Created by 孟利明 on 2022/10/13.
//

import Foundation
import Flutter

open class SimplePlugin: NSObject, FlutterPlugin {
    public static let shared = SimplePlugin()
    
    private var channel: FlutterMethodChannel?
        
    private override init() {}
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_simple_channel", binaryMessenger: registrar.messenger())
        shared.channel = channel
        registrar.addMethodCallDelegate(shared, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "method":
            result(method())
        case "methodWithAruguments":
            result(method(with: call.arguments))
        case "closureMethod":
            closureMethod { result($0) }
        default:
            print("other")
        }
    }
    
    
    /// method
    private func method() -> String {
        return "method result"
    }
    
    /// methodWithAruguments
    private func method(with arguments: Any) -> String {
        channel?.invokeMethod("print", arguments: arguments, result: { result in
            print(result)
        })
        return "method with arguments result"
    }
    
    /// closureMethod
    private func closureMethod(_ callback: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            callback("closure method result")
        }
    }
}
