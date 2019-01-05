//
//  Car.swift
//  16_UIImageView
//
//  Created by Maksim Nosov on 11/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class Car: NSObject {
    
    var objectID: String!
    var name: String!
    var price: NSNumber?
    var salePrice: NSNumber?
    var carDescription: String?
    var image: UIImage!
    
    init(objectID: String!, name: String?, price: NSNumber?, salePrice: NSNumber?, carDescription: String?, image: UIImage!) {
        self.objectID = objectID
        self.name = name
        self.price = price
        self.salePrice = salePrice
        self.carDescription = carDescription
        self.image = image
    }
}
