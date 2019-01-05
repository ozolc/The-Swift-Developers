//
//  SecondViewController.swift
//  09-10_UINavigationController
//
//  Created by Maksim Nosov on 20/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var navigationBar: UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Go back"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        setupNavBar()
        setupNavBarButtons()
    }
    
    func setupNavBar() {
        navigationBar = navigationController?.navigationBar
        navigationController?.hidesBarsOnSwipe = false
        navigationBar?.barTintColor = UIColor.rgb(red: 130, green: 132, blue: 150)
        navigationBar?.isTranslucent = true
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    }
    
    func setupNavBarButtons() {
        navigationController?.hidesBarsOnSwipe = true
        let likeImage = UIImage(named: "like")?.withRenderingMode(.alwaysOriginal)
        let likeBarButtonItem = UIBarButtonItem(image: likeImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = likeBarButtonItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationBar?.setBackgroundImage(nil, for: UIBarMetrics.default)
        navigationBar?.isTranslucent = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack(){
 
        var viewControllerArray = self.navigationController?.viewControllers
        viewControllerArray?.removeLast()
       
        if let newController = viewControllerArray {
            self.navigationController?.viewControllers = newController
        }
        
        
    }
}
