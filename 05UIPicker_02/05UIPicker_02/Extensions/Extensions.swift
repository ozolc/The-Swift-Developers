//
//  Extensions.swift
//  05UIPicker_02
//
//  Created by Maksim Nosov on 13/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

public func presentAlertView(_ vc: UIViewController, title: String, message: String?) {
    var alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
    if message != nil {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
