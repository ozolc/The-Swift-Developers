//
//  AppDelegate.swift
//  09-10_UINavigationController
//
//  Created by Maksim Nosov on 19/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        
        application.statusBarStyle = .lightContent
        
        let statusBarBackgroundStyle = UIView()
        statusBarBackgroundStyle.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        
        window?.addSubview(statusBarBackgroundStyle)
        window?.addConstraintsWithFormat("H:|[v0]|", views: statusBarBackgroundStyle)
        window?.addConstraintsWithFormat("V:|[v0(20)]", views: statusBarBackgroundStyle)
        
        return true
    }
    
}

