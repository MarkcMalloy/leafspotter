//
//  FLPlugin.swift
//  Runner
//
//  Created by Mark Malloy on 08/02/2023.
//

import Flutter
import UIKit

class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar()) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger)
        registrar.register(factory, withId: "<platform-view-type>")
    }
}
