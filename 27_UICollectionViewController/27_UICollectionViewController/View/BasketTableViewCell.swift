//
//  BasketTableViewCell.swift
//  27_UICollectionViewController
//
//  Created by Maksim Nosov on 21/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartNameLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var cartCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func getData(item: Cart) {
        cartNameLabel.text = item.name
        cartPriceLabel.text = String(item.price! * item.count!) + " ₽"
        cartCountLabel.text = String(item.count!) + " шт"
        cartImage.image = UIImage(named: item.image!)
        }
}
