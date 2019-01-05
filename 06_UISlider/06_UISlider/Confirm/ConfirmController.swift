//
//  ConfirmController.swift
//  06_UISlider
//
//  Created by Maksim Nosov on 14/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ConfirmController: UIViewController {

    var confirmView: ConfirmView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        let confirmView = ConfirmView(frame: self.view.frame)
        self.confirmView = confirmView
        self.confirmView.cancelAction = cancelPressed
        self.view.addSubview(confirmView)
        confirmView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func cancelPressed() {
    dismiss(animated: true, completion: nil)
    }
}
