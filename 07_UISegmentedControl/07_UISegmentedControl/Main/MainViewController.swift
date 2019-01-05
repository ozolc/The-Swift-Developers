//
//  ViewController.swift
//  07_UISegmentedControl
//
//  Created by Maksim Nosov on 15/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView: MainView!

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
        let mainView = MainView(frame: self.view.frame)
        self.mainView = mainView
        self.view.addSubview(mainView)
        mainView.submitAction = submitPressed
        mainView.fillSuperView()
    }
    
    func submitPressed() {
//        presentAlertView(self, title: "Заказ оформлен", message: "С вами свяжутся в ближайшее время")
        let orderViewController = OrderViewController()
        present(orderViewController, animated: true, completion: nil)
    }
}

