//
//  TwoTariffViewController.swift
//  04_UISwitch
//
//  Created by Maksim Nosov on 08/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class TwoTariffViewController: UIViewController {
    
    let costT1 = 5.04
    let costT2 = 2.09
    
    let oneZoneLabel = UILabel()
    let twoZoneLabel = UILabel()
    
    let resultLabel = UILabel()
    
    let oneZoneTextField = UITextField()
    let twoZoneTextField = UITextField()
    
    let calculateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.title = "Двухтарифный учет"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        setup()
    }
    
    func setup() {
        
        oneZoneLabel.textAlignment = .center
        oneZoneLabel.text = "дневная зона Т1 (07.00-23.00)"
        
        resultLabel.textAlignment = .center
        resultLabel.text = "Итог: "
        
        oneZoneTextField.placeholder = "Введите значение..."
        oneZoneTextField.borderStyle = UITextBorderStyle.roundedRect
        oneZoneTextField.autocorrectionType = UITextAutocorrectionType.no
        oneZoneTextField.keyboardType = UIKeyboardType.numberPad
        oneZoneTextField.returnKeyType = UIReturnKeyType.done
        oneZoneTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        oneZoneTextField.widthAnchor.constraint(equalToConstant: 20)
        oneZoneTextField.heightAnchor.constraint(equalToConstant: 50)
        oneZoneTextField.delegate = self
        
        twoZoneLabel.textAlignment = .center
        twoZoneLabel.text = "ночная зона Т2 (23.00-07.00)"
        
        twoZoneTextField.placeholder = "Введите значение..."
        twoZoneTextField.borderStyle = UITextBorderStyle.roundedRect
        twoZoneTextField.autocorrectionType = UITextAutocorrectionType.no
        twoZoneTextField.keyboardType = UIKeyboardType.numberPad
        twoZoneTextField.returnKeyType = UIReturnKeyType.done
        twoZoneTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        twoZoneTextField.widthAnchor.constraint(equalToConstant: 20)
        twoZoneTextField.heightAnchor.constraint(equalToConstant: 50)
        twoZoneTextField.delegate = self
        
        let stackViewGroup = UIStackView(arrangedSubviews: [oneZoneLabel, oneZoneTextField, twoZoneLabel, twoZoneTextField, resultLabel])
        stackViewGroup.axis = .vertical
        stackViewGroup.distribution = .fill
        stackViewGroup.center = view.center
        stackViewGroup.alignment = .fill
        stackViewGroup.spacing = 5
        stackViewGroup.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewGroup)
        
        stackViewGroup.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewGroup.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        calculateButton.setTitle("Получить расчёт", for: .normal)
        calculateButton.setTitleColor(UIColor.white, for: .normal)
        calculateButton.backgroundColor = UIColor(red: 142.0/255, green: 68.0/255, blue: 173.0/255, alpha: 1.0)
        calculateButton.layer.cornerRadius = 25
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        
        view.addSubview(calculateButton)
        calculateButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func onButtonPressed(_ sender: UIButton!) {
        resultLabel.text = "Итог: \(String(getResult())) руб."
    }
    
    @objc func getResult() -> Double {
        
        if (oneZoneTextField.text?.isEmpty) ?? true || (twoZoneTextField.text?.isEmpty) ?? true {
            let alert = UIAlertController(title: "Значения Т1 и T2 не могут быть пустыми", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        guard let valueT1 = Double(self.oneZoneTextField.text!), let valueT2 = Double(self.twoZoneTextField.text!) else { return 0 }
        return (costT1 * valueT1) + (costT2 * valueT2)
    }
}
