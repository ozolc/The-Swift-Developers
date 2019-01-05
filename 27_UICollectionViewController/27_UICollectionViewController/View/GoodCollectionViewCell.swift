//
//  GoodCollectionViewCell.swift
//  27_UICollectionViewController
//
//  Created by Maksim Nosov on 19/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class GoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var goodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var good: Goods? {
        didSet {
            if let image = good?.image {
                goodImageView.image = UIImage(named: image)
            }
            if let name = good?.name {
                nameLabel.text = name
            }
            if let description = good?.description {
                descriptionLabel.text = description
            }
            if let price = good?.price {
                priceLabel.text = String(price) + " ₽"
            }
        }
    }
    
}
