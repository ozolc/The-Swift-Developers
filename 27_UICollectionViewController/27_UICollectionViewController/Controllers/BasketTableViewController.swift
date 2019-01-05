//
//  BasketTableViewController.swift
//  27_UICollectionViewController
//
//  Created by Maksim Nosov on 21/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class BasketTableViewController: UITableViewController {    
    
    var dictionary = ["Total": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cartArray.count)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Корзина"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? BasketTableViewCell {
            
            cell.getData(item: cartArray[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cartArray[indexPath.row])
        tableView.isEditing = !tableView.isEditing
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Order.sharedInstance.sum -= cartArray[indexPath.row].count! * cartArray[indexPath.row].price!
            cartArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            
            dictionary["Total"] = Order.sharedInstance.sum
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationFromTableViewAboutTotalCoast"), object: nil, userInfo: dictionary)
        }
    }
}

