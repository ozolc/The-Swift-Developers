//
//  Extension.swift
//  04_UISwitch
//
//  Created by Maksim Nosov on 11/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                } else {
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            } else {
                return false
            }
        }
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}

class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}


extension UIControl {
    public func addAction(for controlEvents: UIControlEvents, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
