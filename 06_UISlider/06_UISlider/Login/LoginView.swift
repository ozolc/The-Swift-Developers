//
//  LoginView.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 13/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    var settingsAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        let stackView = createVerticalStackView(views: [emailTextField,
                                                passwordTextField,
                                                loginButton])
       
        addSubview(stackView)        
        
        stackView.setAnchor(width: self.frame.width - 60, height: 150)
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    let emailTextField: UITextField = {
        let tf = UITextField(placeHolder: "Email")
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField(placeHolder: "Пароль")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(title: "Войти", borderColor: UIColor.greenBorderColor)
        button.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSettings() {
        settingsAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
