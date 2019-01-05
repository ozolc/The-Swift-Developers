//
//  UIColor+Extension.swift
//  FireApp
//
//  Created by Maksim Nosov on 12/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var greenBorderColor: UIColor = {
        return UIColor(r: 80, g: 227, b: 194)
    }()
    
    static var redBorderColor: UIColor = {
       return UIColor(r: 255, g: 151, b: 164)
    }()
        
}
