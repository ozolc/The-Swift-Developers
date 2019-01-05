//
//  ViewController.swift
//  13_UITextField
//
//  Created by Maksim Nosov on 25/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let loginTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Ваш логин"
        tf.borderStyle = .roundedRect
        tf.layer.borderWidth = 0.5
        tf.tag = 1
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.layer.borderWidth = 0.5
        tf.tag = 2
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите e-mail"
        tf.borderStyle = .roundedRect
        tf.layer.borderWidth = 0.5
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none        
        tf.tag = 3
        return tf
    }()
    
    let enterButton: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 0.5
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleEnter), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        setupLeftImageForTextFields()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }
    
    func setupView() {
        let stackViewGroup = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, emailTextField])
        stackViewGroup.axis = .vertical
        stackViewGroup.distribution = .fillProportionally
        stackViewGroup.spacing = 10
        stackViewGroup.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewGroup)
        
        stackViewGroup.setAnchor(width: view.frame.width - 50, height: 150)
        stackViewGroup.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewGroup.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(enterButton)
        enterButton.setAnchor(top: stackViewGroup.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 50, height: 0)
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLeftImageForTextFields() {
        let loginImage = UIImage(named: "login")
        addLeftImageTo(txtField: loginTextField, addImage: loginImage!)
        
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: passwordTextField, addImage: passwordImage!)
        
        let emailImage = UIImage(named: "email")
        addLeftImageTo(txtField: emailTextField, addImage: emailImage!)
    }
    
    fileprivate func addLeftImageTo(txtField: UITextField, addImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    @objc fileprivate func handleEnter() {
        if (loginTextField.text?.isEmpty)! || (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            showAlert()
        } else {
            UserDefaults.standard.set(true, forKey: "LOGGED_IN")
            let secondVC = SecondViewController()
            present(secondVC, animated: true, completion: nil)
        }
    }
    
    fileprivate func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "Готово", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1: loginTextField.becomeFirstResponder()
        case 2: emailTextField.becomeFirstResponder()
        case 3: passwordTextField.becomeFirstResponder()
        default: break
        }
        return true
    }
}
