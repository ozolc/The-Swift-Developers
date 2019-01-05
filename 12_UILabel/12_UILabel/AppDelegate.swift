//
//  AppDelegate.swift
//  12_UILabel
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = FirstViewController()
        
        let firstNavController = UINavigationController(rootViewController: firstVC)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstNavController], animated: true)
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

