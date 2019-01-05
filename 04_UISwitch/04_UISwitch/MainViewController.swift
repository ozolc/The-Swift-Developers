//
//  MainViewController.swift
//  04_UISwitch
//
//  Created by Maksim Nosov on 07/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var tagSwitch = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setup()
    }
    
    func setup() {
        
        self.title = "Учет электроэнергии"
        
        let oneTariffSwitch = UISwitch()
        let twoTariffSwitch = UISwitch()
        let threeTariffSwitch = UISwitch()
        
        oneTariffSwitch.tintColor = UIColor.red
        oneTariffSwitch.thumbTintColor = UIColor(red: 142.0/255, green: 68.0/255, blue: 173.0/255, alpha: 1.0)
        oneTariffSwitch.addAction(for: .valueChanged) { [] in
            if oneTariffSwitch.isOn {
                self.tagSwitch = 1
                twoTariffSwitch.isOn = false
                threeTariffSwitch.isOn = false
            }
        }
        
        twoTariffSwitch.tintColor = UIColor.red
        twoTariffSwitch.thumbTintColor = UIColor(red: 142.0/255, green: 68.0/255, blue: 173.0/255, alpha: 1.0)
        twoTariffSwitch.addAction(for: .valueChanged) { [] in
            if twoTariffSwitch.isOn {
                self.tagSwitch = 2
                oneTariffSwitch.isOn = false
                threeTariffSwitch.isOn = false
            }
        }
        
        threeTariffSwitch.tintColor = UIColor.red
        threeTariffSwitch.thumbTintColor = UIColor(red: 142.0/255, green: 68.0/255, blue: 173.0/255, alpha: 1.0)
        threeTariffSwitch.addAction(for: .valueChanged) { [] in
            if threeTariffSwitch.isOn {
                self.tagSwitch = 3
                oneTariffSwitch.isOn = false
                twoTariffSwitch.isOn = false
            }
        }
        
        let oneTariffLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Однотарифный счётчик"
            return label
        }()
        
        let twoTariffLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Двухтарифный счётчик"
            return label
        }()
        
        let threeTariffLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Трехтарифный счётчик"
            return label
        }()
        
        let stackViewLabel = UIStackView(arrangedSubviews: [oneTariffLabel, twoTariffLabel, threeTariffLabel])
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .fill
        stackViewLabel.alignment = .fill
        stackViewLabel.spacing = 15
        stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewSwitch = UIStackView(arrangedSubviews: [oneTariffSwitch, twoTariffSwitch, threeTariffSwitch])
        stackViewSwitch.axis = .vertical
        stackViewSwitch.distribution = .fill
        stackViewSwitch.alignment = .fill
        stackViewSwitch.spacing = 5
        stackViewSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewGroup = UIStackView(arrangedSubviews: [stackViewLabel, stackViewSwitch])
        stackViewGroup.axis = .horizontal
        stackViewGroup.distribution = .fill
        stackViewGroup.center = view.center
        stackViewGroup.alignment = .center
        stackViewGroup.spacing = 5
        stackViewGroup.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewGroup)
        
        stackViewGroup.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewGroup.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let calculateButton: UIButton = {
            let button = UIButton()
            button.setTitle("Получить расчёт", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor(red: 142.0/255, green: 68.0/255, blue: 173.0/255, alpha: 1.0)
            button.layer.cornerRadius = 25
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
            return button
        }()
        
        view.addSubview(calculateButton)
        calculateButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func onButtonPressed (_ sender: UIButton) {
        if tagSwitch == 1 {
            print(tagSwitch)
            let oneTariffVC = OneTariffViewController()
            self.navigationController?.pushViewController(oneTariffVC, animated: true)
        } else if tagSwitch == 2 {
            print(tagSwitch)
            let twoTariffVC = TwoTariffViewController()
            self.navigationController?.pushViewController(twoTariffVC, animated: true)
        } else if tagSwitch == 3 {
            print(tagSwitch)
            let threeTariffVC = ThreeTariffViewController()
            self.navigationController?.pushViewController(threeTariffVC, animated: true)
        }
    }
}
