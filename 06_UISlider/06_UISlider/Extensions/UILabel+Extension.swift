//
//  UILabel+Extension.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 14/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

extension UILabel {
    
    public convenience init(title: String) {
        self.init()
        self.layer.cornerRadius = 5
        self.textColor = UIColor(white: 0.9, alpha: 0.8)
        self.font = UIFont.systemFont(ofSize: 17)
        self.textAlignment = .center
        self.text = title
        self.setAnchor(width: 0, height: 40)
    }
    
}
