//
//  UIColor+Extension.swift
//  FireApp
//
//  Created by Maksim Nosov on 12/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

extension UITextField {
    
    public convenience init(placeHolder: String) {
        self.init()
        self.borderStyle = .none
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.2)
        self.textColor = UIColor(white: 0.9, alpha: 0.8)
        self.font = UIFont.systemFont(ofSize: 17)
        self.autocorrectionType = .no
        // placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSMutableAttributedString(string: placeHolder, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        self.attributedPlaceholder = placeholder        
    }
}
