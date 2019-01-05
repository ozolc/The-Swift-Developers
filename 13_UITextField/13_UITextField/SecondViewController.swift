//
//  SecondViewController.swift
//  13_UITextField
//
//  Created by Maksim Nosov on 25/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let greetingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Спасибо за регистрацию"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        return button
    }()
    
    let clearUserDefaultsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.setTitle("Сбросить настройки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(clearContents), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(greetingsLabel)
        greetingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greetingsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(backButton)
        backButton.setAnchor(top: greetingsLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 60, paddingBottom: 0, paddingRight: 60)
        
        view.addSubview(clearUserDefaultsButton)
        clearUserDefaultsButton.setAnchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 60, paddingBottom: 0, paddingRight: 60)
    }
    
    @objc private func backButton(_ :UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func clearContents() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "LOGGED_IN")
        print("LOGGED_IN очищен")
        defaults.synchronize()
        showAlert()
        let keyValue = defaults.string(forKey: "LOGGED_IN")
        print("Value is \(String(describing: keyValue ?? nil))")
        
    }
    
    fileprivate func showAlert() {
        let alert = UIAlertController(title: "Настройки сброшены", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Готово", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
