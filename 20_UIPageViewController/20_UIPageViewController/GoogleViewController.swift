//
//  GoogleViewController.swift
//  20_UIPageViewController
//
//  Created by Maksim Nosov on 16/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class GoogleViewController: UIViewController {
    
    // MARK: - UIControls
    let googleImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "gmail"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let googleImageViewPhone: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "gmail_phone"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Gmail", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 22)])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSAttributedString(string: "Email by Google.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.gray])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    // MARK: - Init
    init(googleWith: GoogleHelper) {
        super.init(nibName: nil, bundle: nil)
        
        setupLayout()
        
        googleImageView.image = googleWith.image
        googleImageViewPhone.image = googleWith.imagePhone
        productTextView.text = googleWith.product
        descriptionTextView.text = googleWith.description
        
    }
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        view.addSubview(productTextView)
        view.addSubview(descriptionTextView)
        
        // enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
        topImageContainerView.addSubview(googleImageView)
        topImageContainerView.addSubview(googleImageViewPhone)
        
        googleImageViewPhone.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        googleImageViewPhone.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: -10).isActive = true
        googleImageViewPhone.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        googleImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        googleImageView.bottomAnchor.constraint(equalTo: googleImageViewPhone.topAnchor, constant: -5).isActive = true
        googleImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.25).isActive = true
        
        productTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 5).isActive = true
        productTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        productTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: productTextView.bottomAnchor, constant: 0).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
