//
//  CustomPluginRegistrant.swift
//  Runner
//
//  Created by 孟利明 on 2022/10/13.
//

import Foundation
import Flutter

class CustomPluginRegistrant {
    static func register(with registry: FlutterPluginRegistry) {
        SimplePlugin.register(with: registry.registrar(forPlugin: "SimplePlugin")!)
    }
}
