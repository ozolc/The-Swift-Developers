//
//  AppDelegate.swift
//  20_UIPageViewController
//
//  Created by Maksim Nosov on 16/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: MainPageViewController())
        
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor.mainPink
        pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        
        return true
    }}

