//
//  ViewController.swift
//  14_UITextView
//
//  Created by Maksim Nosov on 30/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "E-Reader"
        
        
        setupView()
        createTextView()
    }
    
    private func createTextView() {
        myTextView = UITextView(frame: CGRect(x: self.view.safeAreaInsets.top, y: self.view.safeAreaInsets.top, width: self.view.bounds.width, height: self.view.bounds.height ))
        myTextView.text = "Дорогу осилит идущий."
        myTextView.isEditable = false
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.backgroundColor = .white
        self.view.addSubview(myTextView)
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "share"), style: .plain, target: self, action: #selector(handleShare))
    }
    
    @objc func handleSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc func handleShare() {
        guard let textToShare = myTextView.text else { return }
        let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension MainViewController: SettingsViewDelegate {
    
    func isNightMode(yes: Bool) {
        if yes {
            myTextView.backgroundColor = .black
            myTextView.textColor = .white
            self.navigationController?.navigationBar.barStyle = .black
            self.view.backgroundColor = .black
            navigationItem.leftBarButtonItem?.tintColor = .white
            navigationItem.rightBarButtonItem?.tintColor = .white
        } else {
            myTextView.backgroundColor = .white
            myTextView.textColor = .black
            self.navigationController?.navigationBar.barStyle = .default
            self.view.backgroundColor = .white
            navigationItem.leftBarButtonItem?.tintColor = .black
            navigationItem.rightBarButtonItem?.tintColor = .black
        }
    }
    
    func fontChanged(font: String) {
        myTextView.font = UIFont(name: font, size: (myTextView.font?.pointSize)!)
    }
    
    func sizeChanged(size: Float) {
        guard let font = myTextView.font?.fontName else { return }
        myTextView.font = UIFont(name: font, size: CGFloat(size))
    }
    
    func makeUpperCase() {
        myTextView.text = myTextView.text.uppercased()
    }
    
    func makeLowerCase() {
        myTextView.text = myTextView.text.lowercased()
    }
}

