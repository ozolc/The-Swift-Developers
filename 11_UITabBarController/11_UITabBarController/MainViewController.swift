//
//  ViewController.swift
//  11_UITabBarController
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let apostolImage = UIImageView()
    let goReadButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let titleLabel = UILabel()
        titleLabel.center = view.center
        titleLabel.text = "12 апостолов"
        titleLabel.textColor = UIColor.white        
        navigationItem.titleView = titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.sizeToFit()
        
        setupNavBar()
        setupView()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func setupView() {
        
        self.apostolImage.image = UIImage(named: "12_Apostles")
        apostolImage.contentMode = .scaleAspectFit
        apostolImage.clipsToBounds = true
        self.view.addSubview(apostolImage)
        
        self.apostolImage.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 0)
        self.apostolImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.apostolImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.goReadButton.backgroundColor = UIColor(red: 248/255, green: 242/255, blue: 175/255, alpha: 1)
        self.goReadButton.layer.cornerRadius = 5
        self.goReadButton.layer.borderColor = UIColor(red: 142/255, green: 247/255, blue: 135/255, alpha: 1).cgColor
        self.goReadButton.layer.borderWidth = 2
        self.goReadButton.addTarget(self, action: #selector(goRead), for: .touchUpInside)
        self.goReadButton.setTitleColor(UIColor.black, for: .normal)
        self.goReadButton.setTitle("Справочник", for: .normal)
        self.view.addSubview(goReadButton)
        
        self.goReadButton.setAnchor(top: nil, left: self.view.leftAnchor, bottom: view.safeBottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: -15, paddingRight: 50, width: 0, height: 35)
    }
    
    @objc private func goRead(_ sender: UIButton) {
        let apostolesVC = ApostolesViewController()
        self.navigationController?.pushViewController(apostolesVC, animated: true)
    }
}
