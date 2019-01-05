//
//  AppDelegate.swift
//  27_UICollectionViewController
//
//  Created by Maksim Nosov on 19/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

var cartArray = [Cart]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
                
        return true
    }
}

