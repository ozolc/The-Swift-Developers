//
//  SettingsViewController.swift
//  14_UITextView
//
//  Created by Maksim Nosov on 02/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate {
    func isNightMode(yes: Bool)
    func fontChanged(font: String)
    func sizeChanged(size: Float)
    func makeUpperCase()
    func makeLowerCase()
}

class SettingsViewController: UIViewController {
    
    var delegate: SettingsViewDelegate?
    let fontNames = ["Arial", "Avenir", "Times New Roman", "Symbol", "Verdana", "Courier"]
    var labelArray = [UILabel]()
    
    let fontLabel: UILabel = {
        let label = UILabel()
        label.text = "Font"
        return label
    }()
    
    let fontPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Size"
        return label
    }()
    
    let sizeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0
        slider.minimumValue = 16
        slider.maximumValue = 64
        slider.addTarget(self, action: #selector(sizeChanged), for: .valueChanged)
        return slider
    }()
    
    let nightModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Night mode"
        return label
    }()
    
    let nightModeSwitch: UISwitch = {
        let sw = UISwitch()
        sw.addTarget(self, action: #selector(isNightMode), for: .valueChanged)
        return sw
    }()
    
    let sizeSegmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Type of font"
        return label
    }()
    
    let sizeSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["a", "A"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(handleSegmentChanged), for: .valueChanged)
        return segment
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sample text"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "Settings"
        
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
        
        setupLayout()
    }
    
    func setupLayout() {
        labelArray = [fontLabel, sizeLabel, nightModeLabel, resultLabel, sizeSegmentLabel]
        
        let fontStackView = UIStackView(arrangedSubviews: [self.fontLabel, self.fontPickerView])
        fontStackView.axis = .horizontal
        fontStackView.distribution = .fill
        fontStackView.alignment = .fill
        fontStackView.spacing = 15
        
        self.view.addSubview(fontStackView)
        fontStackView.setAnchor(top: self.view.safeTopAnchor, left: self.view.safeLeftAnchor, bottom: nil, right: self.view.safeRightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40)
        
        let sizeStackView = UIStackView(arrangedSubviews: [self.sizeLabel, self.sizeSlider])
        sizeStackView.axis = .horizontal
        sizeStackView.distribution = .fill
        sizeStackView.alignment = .fill
        sizeStackView.spacing = 15
        
        self.view.addSubview(sizeStackView)
        sizeStackView.setAnchor(top: fontStackView.bottomAnchor, left: self.view.safeLeftAnchor, bottom: nil, right: self.view.safeRightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40)
        
        let nightModeStackView = UIStackView(arrangedSubviews: [self.nightModeLabel, self.nightModeSwitch])
        nightModeStackView.axis = .horizontal
        nightModeStackView.distribution = .fill
        nightModeStackView.alignment = .fill
        nightModeStackView.spacing = 15
        
        self.view.addSubview(nightModeStackView)
        nightModeStackView.setAnchor(top: sizeStackView.bottomAnchor, left: self.view.safeLeftAnchor, bottom: nil, right: self.view.safeRightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40)
        
        let typeOfFontStackView = UIStackView(arrangedSubviews: [self.sizeSegmentLabel, self.sizeSegment])
        typeOfFontStackView.axis = .horizontal
        typeOfFontStackView.distribution = .fill
        typeOfFontStackView.alignment = .fill
        typeOfFontStackView.spacing = 15
        
        self.view.addSubview(typeOfFontStackView)
        typeOfFontStackView.setAnchor(top: nightModeStackView.bottomAnchor, left: self.view.safeLeftAnchor, bottom: nil, right: self.view.safeRightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40)
        
        
        self.view.addSubview(resultLabel)
        resultLabel.setAnchor(top: nil, left: nil, bottom: self.view.safeBottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -40, paddingRight: 0, width: self.view.frame.width - 20, height: 64)
        resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    //MARK: - Methods
    func fontChanged(font: String) {
        resultLabel.font = UIFont(name: font, size: resultLabel.font.pointSize)
    }
    
    @objc func handleSegmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            self.resultLabel.text = self.resultLabel.text?.uppercased()
            delegate?.makeUpperCase()
        } else {
            self.resultLabel.text = self.resultLabel.text?.lowercased()
            delegate?.makeLowerCase()
        }
    }
    
    @objc func isNightMode(sender: UISwitch) {
        if sender.isOn {
            self.navigationController?.navigationBar.barStyle = .black
            self.view.backgroundColor = .black
            for label in labelArray {
                label.textColor = .white
            }
            delegate?.isNightMode(yes: true)
        } else {
            self.navigationController?.navigationBar.barStyle = .default
            self.view.backgroundColor = .white
            for label in labelArray {
                label.textColor = .black
            }
            delegate?.isNightMode(yes: false)
        }
        self.fontPickerView.reloadAllComponents()
    }
    
    @objc func sizeChanged(_ sender: UISlider) {
        let sizeValue = CGFloat(sender.value)
        resultLabel.font = UIFont(name: resultLabel.font.fontName, size: sizeValue)
        delegate?.sizeChanged(size: Float(sizeValue))
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontNames[row]
    }
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == fontPickerView {
            let selectedFont = fontNames[row]
            self.fontChanged(font: selectedFont)
            delegate?.fontChanged(font: selectedFont)
        }
    }    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let fontName = fontNames[row]
        let color = self.nightModeSwitch.isOn ? UIColor.white : UIColor.black
        let colorAttribute = [NSAttributedStringKey.foregroundColor : color]
        let title = NSAttributedString(string: fontName, attributes: colorAttribute)
        return title
    }
}
