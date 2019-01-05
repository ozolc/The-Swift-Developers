//
//  ViewController.swift
//  12_UILabel
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var currentFontSize: Float = 14
    var minFontSize: Float = 6
    var maxFontSize: Float = 32
    
    let colorArray = [UIColor.red, UIColor.blue, UIColor.brown, UIColor.green]
    let linesArray = [0, 1, 2, 3, 4, 5]
    
    let labelSlider = UISlider()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Это ваш текст"
        label.numberOfLines = 0
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 2, height: 1)
        return label
    }()
    
    let colorPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let linesPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Game with Label"
        self.view.backgroundColor = UIColor.lightGray
        
        let tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        self.tabBarItem = tabBarItem
        
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        linesPicker.delegate = self
        linesPicker.dataSource = self
        
        setupView()
        setupNavItems()
    }
    
    func setupView() {
        let stackViewPicker = UIStackView(arrangedSubviews: [self.colorPicker, self.linesPicker])
        stackViewPicker.axis = .horizontal
        stackViewPicker.distribution = .fillProportionally
        stackViewPicker.alignment = .fill
        stackViewPicker.spacing = 15
        
        labelSlider.value = currentFontSize
        labelSlider.minimumValue = minFontSize
        labelSlider.maximumValue = maxFontSize
        labelSlider.addTarget(self, action: #selector(valueChangeForSlider(_:)), for: .valueChanged)
        
        view.addSubview(mainLabel)
        mainLabel.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        view.addSubview(labelSlider)
        labelSlider.setAnchor(width: view.bounds.width - 30, height: 5)
        labelSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(stackViewPicker)
        stackViewPicker.setAnchor(top: labelSlider.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        
    }
    
    func setupNavItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
    }
    
    @objc func valueChangeForSlider(_ sender: UISlider) {
        currentFontSize = sender.value
        let labelFont = mainLabel.font.withSize(CGFloat(currentFontSize))
        mainLabel.font = labelFont
    }
    
    @objc func handleAdd() {
        putValueToLabel(title: "Введите текст") { (value) in
            self.mainLabel.text = value
        }
    }
}

extension FirstViewController {
    
    func putValueToLabel(title: String, completion: @escaping (String) -> ()) {
        
        // Создаем Alert с заголовком и сообщением
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        // Добавить TextField в UIAlert
        alert.addTextField { (textField) in
            textField.placeholder = "Введите ваш текст"
        }
        
        // Назначаем action с кнопкой и в нем вызываем closure completion для передачи ответа в label
        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { action in
            if let answer = alert.textFields?.first?.text {
                completion(answer)
            }
        }))
        // отображение настроенного и созданного Alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension FirstViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == colorPicker {
            let selectedColor = colorArray[row]
            mainLabel.textColor = selectedColor
        } else if pickerView == linesPicker {
            let selectedLines = linesArray[row]
            mainLabel.numberOfLines = selectedLines
        }
    }
}

extension FirstViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView == colorPicker {
            let titleData = colorArray[row]
            let myTitle = NSAttributedString(string: "цвет", attributes: [NSAttributedStringKey.foregroundColor: titleData])
            return myTitle
        } else if pickerView == linesPicker {
            let titleData = linesArray[row]
            let myTitle = NSAttributedString(string: String(titleData), attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
            return myTitle
        } else {
            return nil
        }
    }
}
