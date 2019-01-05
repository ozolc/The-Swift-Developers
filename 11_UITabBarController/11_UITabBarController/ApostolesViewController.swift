//
//  ApostolesViewController.swift
//  11_UITabBarController
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ApostolesViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    var stepLabel = UILabel()
    var titleLabel = UILabel()
    var picture = UIImageView()
    var textView = UITextView()
    let prevButton = UIButton()
    let nextButton = UIButton()
    
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        index = 0
        
        setupNavBarButtons()
        setupView()
    }
    
    func setupView() {
        // Navigation bar
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Апостол \(index + 1) из \(Data.apostlesImages.count)"
        
        // Picture
        picture.image = Data.apostlesImages[index]
        picture.contentMode = .scaleAspectFit
        picture.clipsToBounds = true
        self.view.addSubview(picture)
        picture.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 300)
        
        prevButton.layer.cornerRadius = 5
        prevButton.layer.borderWidth = 2
        prevButton.layer.borderColor = UIColor(red: 142/255, green: 247/255, blue: 135/255, alpha: 1).cgColor
        prevButton.backgroundColor = UIColor(red: 248/255, green: 242/255, blue: 175/255, alpha: 1)
        prevButton.setTitle("Назад", for: .normal)
        prevButton.addTarget(self, action: #selector(prevButtonPressed(sender:)), for: .touchUpInside)
        prevButton.setTitleColor(UIColor.black, for: .normal)
        prevButton.isHidden = true
        self.view.addSubview(prevButton)
        prevButton.setAnchor(top: nil, left: view.leftAnchor, bottom: view.safeBottomAnchor, right: nil, paddingTop: 0, paddingLeft: 50, paddingBottom: -5, paddingRight: 0, width: 100, height: 0)
        
//        nextButton.frame = CGRect(x: 220, y: 645, width: 90, height: 25)
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 2
        nextButton.layer.borderColor = UIColor(red: 142/255, green: 247/255, blue: 135/255, alpha: 1).cgColor
        nextButton.backgroundColor = UIColor(red: 248/255, green: 242/255, blue: 175/255, alpha: 1)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.setTitle("Вперед", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(nextButton)
        nextButton.setAnchor(top: nil, left: nil, bottom: view.safeBottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -5, paddingRight: 50, width: 100, height: 0)
        
        // TextView
        textView.text = Data.apostlesArray[index]
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.backgroundColor = UIColor(red: 248/255, green: 242/255, blue: 175/255, alpha: 1)
        textView.contentOffset = CGPoint(x: 0, y: -200)
        self.view.addSubview(textView)
        textView.setAnchor(top: picture.bottomAnchor, left: view.leftAnchor, bottom: prevButton.topAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: -5, paddingRight: 0, width: self.view.frame.width, height: 0)
    }
    
    func setupNavBarButtons() {
        let churchImage = UIImage(named: "church")?.withRenderingMode(.alwaysOriginal)
        let churchBarButtonItem = UIBarButtonItem(image: churchImage, style: .plain, target: self, action: #selector(handleChurch))
        navigationItem.rightBarButtonItems = [churchBarButtonItem]
    }
    
        @objc func handleChurch() {
            var viewControllerArray = self.navigationController?.viewControllers
            viewControllerArray?.removeLast()
            
            if let newController = viewControllerArray {
                self.navigationController?.viewControllers = newController
            }
        }
    
    
    // Buttons methods
    @objc func prevButtonPressed(sender: UIButton) {
        index -= 1
        self.navigationItem.title = "Апостол \(index + 1) из \(Data.apostlesImages.count)"
//        stepLabel.text = "Апостол \(index + 1) из \(Data.apostlesImages.count)"
        titleLabel.text = Data.apostlesTitles[index]
        picture.image = Data.apostlesImages[index]
        textView.text = Data.apostlesArray[index]
        nextButton.isHidden = false
        prevButton.isHidden = (index == Data.apostlesImages.startIndex) ? true : false
    }
    
    @objc func nextButtonPressed(sender: UIButton) {
        index += 1
        self.navigationItem.title = "Апостол \(index + 1) из \(Data.apostlesImages.count)"
//        stepLabel.text = "Апостол \(index + 1) из \(Data.apostlesImages.count)"
        titleLabel.text = Data.apostlesTitles[index]
        picture.image = Data.apostlesImages[index]
        textView.text = Data.apostlesArray[index]
        prevButton.isHidden = false
        nextButton.isHidden = (index == Data.apostlesImages.endIndex - 1) ? true : false
    }
}
