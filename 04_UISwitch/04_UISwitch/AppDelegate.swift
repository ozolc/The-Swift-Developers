//
//  AppDelegate.swift
//  04_UISwitch
//
//  Created by Maksim Nosov on 07/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let mainVC = MainViewController()
            navigationController = UINavigationController(rootViewController: mainVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }


}
