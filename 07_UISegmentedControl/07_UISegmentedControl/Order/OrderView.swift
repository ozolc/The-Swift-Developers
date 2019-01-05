//
//  OrderView.swift
//  07_UISegmentedControl
//
//  Created by Maksim Nosov on 15/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class OrderView: UIView {
    var backAction: (() -> Void)?
    
    let orderCreatedLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.text = "Спасибо за ваш заказ. \nМы свяжемся с вами в ближайшее время."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    let backButton: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Назад", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
        let orderStackView: UIStackView = {
            let innerStackView = UIStackView(arrangedSubviews: [orderCreatedLabel,
                                                                backButton])
            innerStackView.axis = .vertical
            innerStackView.distribution = .fillProportionally
            innerStackView.spacing = 10
            return innerStackView
        }()
        
        self.addSubview(orderStackView)
        orderStackView.setAnchor(width: self.frame.width - 100, height: 200)
        orderStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        orderStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    @objc private func handleBack() {
        backAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
