//
//  AppDelegate.swift
//  13_UITextField
//
//  Created by Maksim Nosov on 25/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        if UserDefaults.standard.value(forKey: "LOGGED_IN") != nil {
            window?.rootViewController = UINavigationController(rootViewController: secondVC)
        } else {
            window?.rootViewController = UINavigationController(rootViewController: firstVC)
        }
        
        let prefs = UserDefaults.standard
        let keyValue = prefs.string(forKey: "LOGGED_IN")
        print("Value is for ket LOGGED_IN is \(String(describing: keyValue))")
        return true
    }
}

