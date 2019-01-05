//
//  ClientViewController.swift
//  05UIPicker_02
//
//  Created by Maksim Nosov on 12/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "Bitmap.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField(placeHolder: "Имя")
        tf.textAlignment = .left
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let secondNameTextField: UITextField = {
        let tf = UITextField(placeHolder: "Фамилия")
        tf.textAlignment = .left
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField(placeHolder: "Пароль")
        tf.textAlignment = .left
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let bankCardTextField: UITextField = {
        let tf = UITextField(placeHolder: "Последние 4 цифры карты")
        tf.textAlignment = .left
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailextField: UITextField = {
        let tf = UITextField(placeHolder: "E-mail")
        tf.textAlignment = .left
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(title: "Сохранить", borderColor: UIColor.redBorderColor)
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Регистрация клиента"
        
        view.addSubview(backgroundImage)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(bankCardTextField)
        view.addSubview(emailextField)
        view.addSubview(saveButton)
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        firstNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        firstNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        secondNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 30).isActive = true
        secondNameTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        secondNameTextField.rightAnchor.constraint(equalTo: firstNameTextField.rightAnchor).isActive = true
        secondNameTextField.heightAnchor.constraint(equalTo: firstNameTextField.heightAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 30).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: firstNameTextField.rightAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: firstNameTextField.heightAnchor).isActive = true
        
        bankCardTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        bankCardTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        bankCardTextField.rightAnchor.constraint(equalTo: firstNameTextField.rightAnchor).isActive = true
        bankCardTextField.heightAnchor.constraint(equalTo: firstNameTextField.heightAnchor).isActive = true
        
        emailextField.topAnchor.constraint(equalTo: bankCardTextField.bottomAnchor, constant: 30).isActive = true
        emailextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        emailextField.rightAnchor.constraint(equalTo: firstNameTextField.rightAnchor).isActive = true
        emailextField.heightAnchor.constraint(equalTo: firstNameTextField.heightAnchor).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: emailextField.bottomAnchor, constant: 40).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc private func handleSave(_sender: AnyObject) {
        
        if (bankCardTextField.text?.count) != 4 {
            presentAlertView(self, title: "Error", message: "Введите последние 4 цифры карты.")
        }
        
        if firstNameTextField.text != "" && secondNameTextField.text != "" && passwordTextField.text != "" && bankCardTextField.text != "" && emailextField.text != "" {
            presentAlertView(self, title: "Ok", message: "Данные сохранены.")
        } else {
            presentAlertView(self, title: "Error", message: "Заполните все поля.")
        }
    }
    
    private func backButton(_ :UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
