//
//  ViewController.swift
//  05_UIPicker
//
//  Created by Maksim Nosov on 11/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let formatter = DateFormatter()
    let todayDate = Date()
    var date: String!
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(dateSelectedFromDatePicker(_:)), for: .valueChanged)
        return picker
    }()
    
    let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(timeSelectedFromDatePicker(_:)), for: .valueChanged)
        return picker
    }()
    
    let dateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Выберите дату или время"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.title = "UIDatePicker"
        
        view.addSubview(datePicker)
        view.addSubview(dateAndTimeLabel)
        view.addSubview(timePicker)
        
        setupLayout()
    }
    
    @objc func dateSelectedFromDatePicker(_ : AnyObject) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-YYYY"
        date = formatter.string(from: datePicker.date)
        
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "YYYY"
        let year = yearFormatter.string(from: datePicker.date)
        
        if Int(year)! % 4 == 0 || Int(year)! % 400 == 0 {
            let leapYearVC = LeapYearController()
            self.navigationController?.pushViewController(leapYearVC, animated: true)
        } else {
            dateAndTimeLabel.text = date
        }
        
    }
    
    @objc func timeSelectedFromDatePicker(_ : AnyObject) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH-mm-ss"
        let time = formatter.string(from: timePicker.date)
        
        let alert = UIAlertController(title: "Время быстротечно", message: "На часах: \(time)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Бегу", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        dateAndTimeLabel.text = time
    }
    
    private func setupLayout() {
        datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        datePicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        dateAndTimeLabel.bottomAnchor.constraint(equalTo: timePicker.topAnchor, constant: -20).isActive = true
        dateAndTimeLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dateAndTimeLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        timePicker.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -1).isActive = true
        timePicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        timePicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

