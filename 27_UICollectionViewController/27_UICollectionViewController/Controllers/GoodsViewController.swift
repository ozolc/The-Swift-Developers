//
//  ViewController.swift
//  27_UICollectionViewController
//
//  Created by Maksim Nosov on 19/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class GoodsViewController: UIViewController {
    
    @IBOutlet weak var goodsCollectionView: UICollectionView!
    
    var goodsArray: [Goods] = {
        var iphoneX = Goods()
        iphoneX.name = "iPhone X"
        iphoneX.description = "Смартфон Apple iPhone X"
        iphoneX.image = "iphone-x"
        iphoneX.price = 75000
        
        var iphone8 = Goods()
        iphone8.name = "iPhone 8"
        iphone8.description = "Смартфон Apple iPhone 8"
        iphone8.image = "iphone8"
        iphone8.price = 65000
        
        var iphone7 = Goods()
        iphone7.name = "iPhone 7"
        iphone7.description = "Смартфон Apple iPhone 7"
        iphone7.image = "iphone7"
        iphone7.price = 50000
        
        var iphoneSE = Goods()
        iphoneSE.name = "iPhone SE"
        iphoneSE.description = "Смартфон Apple iPhone SE"
        iphoneSE.image = "iphone-se"
        iphoneSE.price = 20000
        
        return [iphoneX, iphone8, iphone7, iphoneSE]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Товары"
        
        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let vc = segue.destination as? DetailViewController {
                if let good = sender as? Goods {
                    vc.good = good
                }
            }
        }
    }
}

extension GoodsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = goodsCollectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? GoodCollectionViewCell {
            
            cell.good = goodsArray[indexPath.row]
            
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let good = goodsArray[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: good)
    }
}
