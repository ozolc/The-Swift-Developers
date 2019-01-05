//
//  SecondViewController.swift
//  19_UIProgressView
//
//  Created by admin on 15/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let userDef = UserDefaults.standard
    
    @IBOutlet weak var firstUIImageView: UIImageView!
    @IBOutlet weak var secondUIImageView: UIImageView!
    @IBOutlet weak var thirdUIImageView: UIImageView!
    @IBOutlet weak var forthUIImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageViewArray = [firstUIImageView, secondUIImageView, thirdUIImageView, forthUIImageView]
        self.myLabel.isHidden = true
        
        for imageView in imageViewArray {
            imageView?.addGestureRecognizer(createTapGesture())
        }
    }
    
    // MARK: - Implementing UITapGestureRecognizaer
        private func createTapGesture() -> UITapGestureRecognizer {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(sender:)))
            return tapGesture
        }
    
    @objc func tapAction(sender: UITapGestureRecognizer) {
        guard let saveImage = sender.view as? UIImageView else { return }
        let image: NSData = UIImagePNGRepresentation(saveImage.image!)! as NSData
            userDef.setValue(image, forKey: "image")
        self.myLabel.isHidden = false
    }
}
