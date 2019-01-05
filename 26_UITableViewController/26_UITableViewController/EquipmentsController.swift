//
//  EquipmentsController.swift
//  26_UITableViewController
//
//  Created by Maksim Nosov on 18/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class EquipmentsController: UITableViewController {
    
    var equpments = [
        Equipment(name: "Моноблок"),
        Equipment(name: "МФУ"),
        Equipment(name: "Монитор")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Склад"
        
        // Задний фон таблицы
        tableView.backgroundColor = .lightGray
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView() // Пустой UIView
        
//        tableView.separatorStyle = .none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        // Кнопка для добавления типа оборудования
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddEquipment))
    }
    
    @objc func handleAddEquipment() {
        
        let createEquipmentController = CreateEquipmentController()
        let navController = CustomNavigationController(rootViewController: createEquipmentController)
        createEquipmentController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // Создание ячейки в таблице
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        // Цвет ячейки
        cell.backgroundColor = .tealColor
        // Цвет выделенной ячейки
        let backgroundView = UIView()
        backgroundView.backgroundColor = .tealColor
        cell.selectedBackgroundView = backgroundView
        
        let equipment = equpments[indexPath.row]
        
        cell.textLabel?.text = equipment.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    // Количество строк в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equpments.count
    }
    
    // Функционал удаления ячеек
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            equpments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

extension EquipmentsController: CreateEquipmentControllerDelegate {
    func didAddEquipment(equipment: Equipment) {
        // 1 - Добавить в массив
        equpments.append(equipment)
        
        // 2 - Добавить новый index path в tableView
        let newIndexPath = IndexPath(row: equpments.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
