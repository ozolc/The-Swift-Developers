//
//  ViewController.swift
//  15_UIButton
//
//  Created by Maksim Nosov on 10/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(titleColor: UIColor.red, shadowColor: UIColor.black, borderColor: .red)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(handleStart(_:)), for: .touchUpInside)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(titleColor: UIColor.red, shadowColor: UIColor.black, borderColor: .red)
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(handleReset(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UIButton"
        view.backgroundColor = .white
        
        setupView()
    }
    
    private func setupView() {
        timerLabel.text = String(counter)
        
        self.resetButton.isEnabled = false
        
        let stackView = UIStackView(arrangedSubviews: [startButton, resetButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.setAnchor(width: view.bounds.width - 30, height: 40)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(timerLabel)
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.setAnchor(top: nil, left: nil, bottom: stackView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -30, paddingRight: 0)
    }
    
    @objc func handleStart(_ sender: UIButton) {
        if (self.isPlaying) {
            self.timer.invalidate()
            self.isPlaying = false
            self.startButton.setTitle("Start", for: .normal)
            self.resetButton.isEnabled = true
            return
        } else {
            self.startButton.setTitle("Pause", for: .normal)
            self.resetButton.isEnabled = true
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.isPlaying = true
        }
    }
    
    @objc func handleReset(_ sender: UIButton) {
        self.startButton.isEnabled = true
        self.timer.invalidate()
        self.isPlaying = false
        self.counter = 0.0
        self.timerLabel.text = String(counter)
        self.startButton.setTitle("Start", for: .normal)
    }
    
    @objc func updateTimer() {
        self.counter = self.counter + 0.1
        self.timerLabel.text = String(format: "%.1f", self.counter)
    }
}

