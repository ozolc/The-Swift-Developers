//
//  ViewController.swift
//  19_UIProgressView
//
//  Created by Maksim Nosov on 15/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var percentageLabel: UILabel!
    private var myTimer = Timer()    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
        setupImageView(myImageView)
        
    }
    
    // MARK: - Setup ImageView
    private func setupImageView(_ imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        if let image = UserDefaults.standard.object(forKey: "image") {
            print("Image is set before")
            myImageView.image = UIImage(data: (image as? Data)!)
        } else {
            myImageView.image = UIImage(named: "rainbow")
        }
        myImageView.alpha = 0.5
    }
    
    // MARK: - Create Timer
    private func createTimer() {
        self.myTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                            target: self,
                                            selector: #selector(animateProgressView),
                                            userInfo: nil,
                                            repeats: true)
    }
    
    // MARK: - ProgressView
    @objc func animateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.03 / 1.0
            let progress = self.myProgressView.progress
            
            percentageLabel.text = "\(Int(progress * 100))%"
            self.myImageView.alpha = CGFloat(progress)
            
        } else if myProgressView.progress == 1.0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
            self.present(secondVC, animated: true, completion: nil)
            print("Done")
            self.myTimer.invalidate()
        }
    }
    
}
