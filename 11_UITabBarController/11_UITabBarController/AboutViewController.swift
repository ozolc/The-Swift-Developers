//
//  AboutViewController.swift
//  11_UITabBarController
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupNavBar()
        setupView()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Справка"
    }
    
    func setupView() {
        textView.text = Data.aboutDescription
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.backgroundColor = UIColor(red: 248/255, green: 242/255, blue: 175/255, alpha: 1)
        textView.contentOffset = CGPoint(x: 0, y: -200)
        self.view.addSubview(textView)
        textView.fillSuperView()
    }
}
