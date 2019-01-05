//
//  DetailViewController.swift
//  16_UIImageView
//
//  Created by Maksim Nosov on 11/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var contentModePicker: UIPickerView!
    let contentModes = ["Aspect Fill", "Aspect Fit", "Scale to Fill", "Redraw", "Center", "Top", "Bottom", "Left", "Right", "Top Left", "Top Right", "Bottom Left", "Bottom Right"]    
    
    var selectedCar: Car!
    
    // MARK: view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCar.name
        imageView.image = selectedCar.image
        
        if let price = selectedCar.price {
            priceLabel.text = "Price: $ \(price)"
        } else {
            priceLabel.isHidden = true
        }
    }
    
    @IBAction func alphaComponentSlider(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        imageView.alpha = currentValue
    }
}

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contentModes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contentModes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let mode = UIViewContentMode(rawValue: row) {
            imageView.contentMode = mode
        }
    }
}
