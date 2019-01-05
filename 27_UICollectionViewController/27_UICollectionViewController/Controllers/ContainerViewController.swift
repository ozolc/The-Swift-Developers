//
//  ContainerViewController.swift
//  27_UICollectionViewController
//
//  Created by Maksim Nosov on 20/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//


import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var orderLabel: UIButton!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Корзина"
        
        orderLabel.layer.cornerRadius = 5
        orderLabel.setTitleColor(UIColor.white, for: .normal)
        orderLabel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        
        var total: Int = 0
        for item in cartArray {
            total += item.count! * item.price!
        }
        sumLabel.text = "\(total) ₽"
        
        NotificationCenter.default.addObserver(self, selector: #selector(gotNotification(notification:)), name: NSNotification.Name(rawValue: "notificationFromTableViewAboutTotalCoast"), object: nil)
    }


    @IBAction func orderButton(_ sender: Any) {
        let orderedMessageController = UIAlertController(title: nil, message: "Заказ оформлен. Мы свяжемся с Вами в ближайшее время.", preferredStyle: .alert)
        let alertButtton = UIAlertAction(title: "Закрыть", style: .cancel) { (x) in
            Order.sharedInstance.sum = 0
            self.navigationController?.popToRootViewController(animated: true)
        }
        orderedMessageController.addAction(alertButtton)
        self.present(orderedMessageController, animated: true, completion: nil)
    }
    
    @objc func gotNotification(notification: Notification) {
        guard let  userInfo = notification.userInfo, let total = userInfo["Total"] as? Int else {return}
        sumLabel.text = "\(total) ₽"
    }
    
}
