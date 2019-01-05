//
//  ViewController.swift
//  05UIPicker_02
//
//  Created by Maksim Nosov on 12/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backgroundImage: UIImageView = {
       let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "Bitmap.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let clientButton: UIButton = {
        let button = UIButton(title: "Клиент", borderColor: UIColor.greenBorderColor)
        button.addTarget(self, action: #selector(handleClient), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let developerButton: UIButton = {
        let button = UIButton(title: "Разработчик", borderColor: UIColor.greenBorderColor)
        button.addTarget(self, action: #selector(handleDeveloper), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        
        view.addSubview(backgroundImage)
        view.addSubview(clientButton)
        view.addSubview(developerButton)
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        clientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clientButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        clientButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        developerButton.widthAnchor.constraint(equalTo: clientButton.widthAnchor).isActive = true
        developerButton.topAnchor.constraint(equalTo: clientButton.bottomAnchor, constant: 5).isActive = true
        developerButton.leftAnchor.constraint(equalTo: clientButton.leftAnchor).isActive = true
        developerButton.rightAnchor.constraint(equalTo: clientButton.rightAnchor).isActive = true
        
    }
    
    @objc private func handleClient() {
        let clientVC = ClientViewController()
        self.navigationController?.pushViewController(clientVC, animated: true)
    }
    
    @objc private func handleDeveloper() {
        let developerVC = DeveloperViewController()
        self.navigationController?.pushViewController(developerVC, animated: true)
    }
}

