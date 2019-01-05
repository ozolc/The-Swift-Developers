//
//  SignUpController.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 13/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    var settingsView: SettingsView!
    
    let genderArray = ["мужчина", "женщина", "unknown"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black        
        setupViews()
    }
    
    func setupViews() {
        let settingsView = SettingsView(frame: self.view.frame)
        self.settingsView = settingsView
        self.settingsView.submitAction = submitPressed
        self.settingsView.cancelAction = cancelPressed
        self.settingsView.picker.delegate = self
        self.settingsView.picker.dataSource = self
        view.addSubview(settingsView)
    }
    
    func submitPressed() {
        let confirmController = ConfirmController()
        present(confirmController, animated: true, completion: nil)
    }
    
    func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
}

extension SettingsController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension SettingsController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return genderArray[row]
    }
}
