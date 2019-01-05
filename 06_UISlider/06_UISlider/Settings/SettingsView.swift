//
//  SignUpView.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 13/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    var submitAction: (() -> Void)?
    var cancelAction: (() -> Void)?
    
    let welcomeLabel: UILabel = {
        let label = UILabel(title: "Настройки")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.redBorderColor
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField(placeHolder: "Имя")
        return tf
    }()
    
    let nickTextField: UITextField = {
        let tf = UITextField(placeHolder: "Ник")
        return tf
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel(title: "Выберите пол")
        return label
    }()
    
    let picker: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        pv.layer.borderColor = UIColor.greenBorderColor.cgColor
        pv.layer.borderWidth = 1
        pv.layer.cornerRadius = 5
        return pv
    }()
    
    let backgroundColorSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.addTarget(self, action: #selector(handleSliderChange(_:)), for: .valueChanged)
        return slider
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(title: "Сохранить", borderColor: .greenBorderColor)
        button.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(title: "Отмена", borderColor: .redBorderColor)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        self.addSubview(welcomeLabel)
        welcomeLabel.setAnchor(top: self.safeTopAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width - 60, height: 0)
        
        let innerStackView = createHorizontalStackView(views: [genderLabel,
                                                               picker])
        innerStackView.setAnchor(width: 0, height: 200)
        picker.setAnchor(width: 150, height: 0)
        backgroundColorSlider.setAnchor(width: self.frame.width - 60, height: 10)
        
        let stackView = createVerticalStackView(views: [nameTextField,
                                                        nickTextField,
                                                        backgroundColorSlider,
                                                        innerStackView,
                                                        submitButton,
                                                        cancelButton])
        self.addSubview(stackView)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 300)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    @objc func handleSliderChange(_ sender: UISlider) {
        let colorValue = CGFloat(sender.value)
        let color = UIColor.init(hue: colorValue/255, saturation: 0.5, brightness: 1.0, alpha: 0.4)
        self.backgroundColor = color
    }
    
    @objc func handleSubmit() {
        submitAction?()
    }
    
    @objc func handleCancel() {
        cancelAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
