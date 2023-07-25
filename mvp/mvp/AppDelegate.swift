//
//  AppDelegate.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        let vc = ModuleBuilder.createMain(factory: true)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

