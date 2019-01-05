//
//  LoginViewController.swift
//  04_UISwitch
//
//  Created by Maksim Nosov on 07/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class OneTariffViewController: UIViewController {
    
    let costT1 = 5.04
    
    let oneZoneLabel = UILabel()
    let resultLabel = UILabel()
    let calculateButton = UIButton()
    let oneZoneTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.title = "Однотарифный учет"
        
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
        oneZoneTextField.delegate = self
        
        let stackViewLabel = UIStackView(arrangedSubviews: [oneZoneLabel])
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .fill
        stackViewLabel.alignment = .fill
        stackViewLabel.spacing = 15
        stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewTextField = UIStackView(arrangedSubviews: [oneZoneTextField])
        stackViewTextField.axis = .vertical
        stackViewTextField.distribution = .fill
        stackViewTextField.alignment = .center
        stackViewTextField.spacing = 5
        stackViewTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewGroup = UIStackView(arrangedSubviews: [stackViewLabel, stackViewTextField, resultLabel])
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
        
        if (oneZoneTextField.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Значение Т1 не может быть пустым", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        guard let valueT1 = Double(self.oneZoneTextField.text!) else { return 0 }
        return costT1 * Double(valueT1)
    }
}
