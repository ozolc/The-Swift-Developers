//
//  LeapYearController.swift
//  05_UIPicker
//
//  Created by Maksim Nosov on 11/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class LeapYearController: UIViewController {
    
    let leapYearabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Вы выбрали високосный год"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.title = "Високосный год"
        
        view.addSubview(leapYearabel)
        
        setupLayout()
    }
    
    private func setupLayout() {
        leapYearabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        leapYearabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func backButton(_ :UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
