//
//  MainView.swift
//  07_UISegmentedControl
//
//  Created by Maksim Nosov on 15/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var submitAction: (() -> Void)?
    var uslugiSegmentControl = UISegmentedControl()
    var uslugiImageView = UIImageView()
    
    var menuArray = ["Электрика", "Мебель", "Ремонт", "Сантехника"]
    let imageArray = [UIImage(named: "elektrika.png"),
                      UIImage(named: "mebel.png"),
                      UIImage(named: "remont.png"),
                      UIImage(named: "santehnika.png")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
        let logoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "logo")
            imageView.clipsToBounds = true
            return imageView
        }()
        addSubview(logoImageView)
        logoImageView.setAnchor(top: superview?.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: 0)
        
        uslugiImageView.image = self.imageArray[0]
        addSubview(uslugiImageView)
        uslugiImageView.setAnchor(width: 125, height: 128)
        uslugiImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        uslugiImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        uslugiSegmentControl = UISegmentedControl(items: self.menuArray)
        uslugiSegmentControl.addTarget(self, action: #selector(handleChangingSegmentItems), for: .valueChanged)
        
        addSubview(uslugiSegmentControl)
        uslugiSegmentControl.setAnchor(top: uslugiImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        let submitButton: UIButton = {
            let button = UIButton()
            let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Сделать заказ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black]))
            button.setAttributedTitle(attributedString, for: .normal)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 2
            button.addTarget(self, action: #selector(hadleSubmit), for: .touchUpInside)
            return button
        }()
        addSubview(submitButton)
        submitButton.setAnchor(top: uslugiSegmentControl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 50)
    }
    
    @objc private func handleChangingSegmentItems(target: UISegmentedControl) {
        if target == self.uslugiSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            self.uslugiImageView.image = imageArray[segmentIndex]
        }
    }
    
    @objc private func hadleSubmit() {
        submitAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
