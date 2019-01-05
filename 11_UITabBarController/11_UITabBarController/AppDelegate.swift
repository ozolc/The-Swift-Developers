//
//  AppDelegate.swift
//  11_UITabBarController
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let mainVC = MainViewController()
        let aboutVC = AboutViewController()
        
        let apostolesNavController = UINavigationController(rootViewController: mainVC)
        let aboutNavController = UINavigationController(rootViewController: aboutVC)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([apostolesNavController, aboutNavController], animated: true)
        tabBarController.tabBar.barStyle = .black
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.layer.borderWidth = 0.5
        tabBarController.tabBar.layer.borderColor = UIColor.white.cgColor
        mainVC.tabBarItem = UITabBarItem(title: "12 апостолов", image: #imageLiteral(resourceName: "people"), tag: 0)
        aboutVC.tabBarItem = UITabBarItem(title: "Справка", image: #imageLiteral(resourceName: "info"), tag: 1)
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .white
        
        return true
    }


}

