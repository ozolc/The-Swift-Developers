//
//  AppDelegate.swift
//  05UIPicker_02
//
//  Created by Maksim Nosov on 12/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let vc = ViewController()
            navigationController = UINavigationController(rootViewController: vc)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }
}

