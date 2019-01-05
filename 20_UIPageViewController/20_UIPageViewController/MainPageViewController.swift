//
//  MainPageViewController.swift
//  20_UIPageViewController
//
//  Created by Maksim Nosov on 17/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    //MARK: - Properties
    var googleItems = [GoogleHelper]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Google products"
        
        // init
        let gmailItem = GoogleHelper(product: "Gmail",
                                     description: "Email by Google.",
                                     image: #imageLiteral(resourceName: "gmail"),
                                     imagePhone: #imageLiteral(resourceName: "gmail_phone"))
        
        let alloItem = GoogleHelper(product: "Google Allo",
                                    description: "A smart messaging app that helps you say more and do more.",
                                    image: #imageLiteral(resourceName: "allo"),
                                    imagePhone: #imageLiteral(resourceName: "allo_phone"))
        
        let duoItem = GoogleHelper(product: "Google Duo",
                                   description: "A simple video calling app that lets you be together in the moment.",
                                   image: #imageLiteral(resourceName: "duo"),
                                   imagePhone: #imageLiteral(resourceName: "duo_phone"))
        
        let plusItem = GoogleHelper(product: "Google+",
                                    description: "Discover more of what you love and the people who love it, too.",
                                    image: #imageLiteral(resourceName: "plus"),
                                    imagePhone: #imageLiteral(resourceName: "plus_phone"))
        
        googleItems.append(gmailItem)
        googleItems.append(alloItem)
        googleItems.append(duoItem)
        googleItems.append(plusItem)
    }
    
    //MARK: - Create VC
    lazy var arrayGoogleVC: [GoogleViewController] = {
        var googleVC = [GoogleViewController]()
        for item in googleItems {
            googleVC.append(GoogleViewController(googleWith: item))
        }
        return googleVC
    }()
    
    //MARK: - init UIPageVC
    override init(transitionStyle style: UIPageViewControllerTransitionStyle,
                  navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        view.backgroundColor = .white
        
        self.dataSource = self
        self.delegate = self
        
        setViewControllers([arrayGoogleVC[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - Extension
extension MainPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewVC = viewController as? GoogleViewController else { return nil }
        if let index = arrayGoogleVC.index(of: viewVC) {
            
            if index > 0 {
                return arrayGoogleVC[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewVC = viewController as? GoogleViewController else { return nil }
        if let index = arrayGoogleVC.index(of: viewVC) {
            
            if index < googleItems.count - 1 {
                return arrayGoogleVC[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return googleItems.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
