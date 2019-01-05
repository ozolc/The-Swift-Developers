//
//  OrderViewController.swift
//  07_UISegmentedControl
//
//  Created by Maksim Nosov on 15/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    var orderView: OrderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        let orderView = OrderView(frame: self.view.frame)
        self.orderView = orderView
        self.orderView.backAction = backPressed
        self.view.addSubview(orderView)
        orderView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func backPressed() {
        dismiss(animated: true, completion: nil)
    }
}

