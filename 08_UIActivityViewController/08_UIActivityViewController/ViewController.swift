//
//  ViewController.swift
//  08_UIActivityViewController
//
//  Created by Maksim Nosov on 17/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(red: 20/255, green: 255/255, blue: 255/255, alpha: 0.2)
        iv.clipsToBounds = true
        return iv
    }()
    
    let chooseButton: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Выбрать изображение", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1).cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(handleChoosePhoto), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    func setupView() {
        view.addSubview(imageView)
        imageView.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 300)
        
        view.addSubview(chooseButton)
        chooseButton.setAnchor(top: nil, left: view.leftAnchor, bottom: view.safeBottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: -20, paddingRight: 50, width: 0, height: 50)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Поделиться", style: .plain, target: self, action: #selector(handleShare))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if imageView.image == nil {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @objc func handleShare () {
        
        guard let image = imageView.image else { return }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func handleChoosePhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Источник изображения", message: "Выбрать источник", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Камера", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion:  nil)
            } else {
                let alert = UIAlertController(title: nil, message: "Камера недоступна", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Готово", style: .destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Фото библиотека", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion:  nil)
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
