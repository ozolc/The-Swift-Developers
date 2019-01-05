//
//  ConfirmView.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 14/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ConfirmView: UIView {
    
    var cancelAction: (() -> Void)?
    
    let userCreatedLabel: UILabel = {
        let label = UILabel(title: "Игрок создан")
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(title: "Назад", borderColor: .redBorderColor)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        let stackView = createVerticalStackView(views: [userCreatedLabel,
                                                        cancelButton])
        self.addSubview(stackView)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 110)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    @objc func handleCancel() {
        cancelAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
