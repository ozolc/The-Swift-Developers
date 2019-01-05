//
//  CreateEquipmentController.swift
//  26_UITableViewController
//
//  Created by Maksim Nosov on 18/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

// Custom Delegation

protocol CreateEquipmentControllerDelegate {
    func didAddEquipment(equipment: Equipment)
}

class CreateEquipmentController: UIViewController {
    
    var delegate: CreateEquipmentControllerDelegate?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Оборудование"
        // Активировать Autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        setupUI()
        
        navigationItem.title = "Добавить"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(handleSave))
        
        nameTextField.becomeFirstResponder()
    }
    
    @objc private func handleSave() {
        dismiss(animated: true) {
            guard let name = self.nameTextField.text else { return }
            let equipment = Equipment(name: name.capitalized)
            self.delegate?.didAddEquipment(equipment: equipment)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    private func setupUI() {
        let lightBlueBackgroundView = UIView()
        lightBlueBackgroundView.backgroundColor = UIColor.lightBlue
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
