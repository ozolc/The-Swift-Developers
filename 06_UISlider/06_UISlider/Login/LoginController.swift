//
//  ViewController.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 13/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        let mainView = LoginView(frame: self.view.frame)
        self.loginView = mainView
        self.loginView.settingsAction = settingsPressed
        self.view.addSubview(loginView)
        loginView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func settingsPressed() {
        let settingsController = SettingsController()
        present(settingsController, animated: true, completion: nil)
    }
    
}

