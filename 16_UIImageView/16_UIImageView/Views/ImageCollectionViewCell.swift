//
//  ImageCollectionViewCell.swift
//  16_UIImageView
//
//  Created by Maksim Nosov on 10/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
}
