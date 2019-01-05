//
//  AppDelegate.swift
//  26_UITableViewController
//
//  Created by Maksim Nosov on 18/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

// Изменить стиль StatusBar на светлый
class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .lightGreen
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let equipmentController = EquipmentsController()
        let navController = CustomNavigationController(rootViewController: equipmentController)
        window?.rootViewController = navController
        
        return true
    }


}

