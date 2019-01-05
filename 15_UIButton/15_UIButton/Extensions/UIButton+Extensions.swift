//
//  UIButoon+Extensions.swift
//  15_UIButton
//
//  Created by Maksim Nosov on 10/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

extension UIButton {
//    // Shadow and Radius for Circle Button
    public convenience init(titleColor: UIColor, shadowColor: UIColor, borderColor: UIColor) {
        self.init()
        self.setTitleColor(titleColor, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = self.frame.height / 50
        self.layer.borderWidth = 1
    }
}
