//
//  ViewController.swift
//  17_UIScrollView
//
//  Created by Maksim Nosov on 13/08/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logoArray = ["appleLogo", "intelLogo", "microsoftLogo"]
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var logoScrollView: UIScrollView! 
    
    @IBAction func chooseFromLibrary(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func chooseFromCamera(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UI setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadLogo()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(param:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(param:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func loadLogo() {
        
        logoScrollView.contentSize = logoScrollView.frame.size
        var imageViewRect = logoScrollView.bounds
        logoScrollView.contentSize.width = logoScrollView.frame.width * CGFloat(logoArray.count)
        logoScrollView.isPagingEnabled = true
        
        // create new Image
        let firstImage = UIImage(named: logoArray[0])
        let secondImage = UIImage(named: logoArray[1])
        let thirdImage = UIImage(named: logoArray[2])
        
        let firstImageView = newImageView(image: firstImage!, position: imageViewRect)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let secondImageView = newImageView(image: secondImage!, position: imageViewRect)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let thirdImageView = newImageView(image: thirdImage!, position: imageViewRect)
        
        logoScrollView.addSubview(firstImageView)
        logoScrollView.addSubview(secondImageView)
        logoScrollView.addSubview(thirdImageView)
    }
    
    fileprivate func newImageView(image: UIImage,position: CGRect) -> UIImageView {
        let newImageView = UIImageView(image: image)
        newImageView.frame = position
        newImageView.contentMode = .scaleAspectFit
        return newImageView
    }
    
    fileprivate func setupUI() {
        // Delegate
        self.firstNameTextField.delegate = self
        self.secondNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.ageTextField.delegate = self
        self.phoneTextField.delegate = self
        self.emailTextField.delegate = self
        
        self.imagePicker.delegate = self
        self.galleryButton.addTarget(self, action: #selector(chooseFromLibrary(_:)), for: .touchUpInside)
        self.cameraButton.addTarget(self, action: #selector(chooseFromCamera(_:)), for: .touchUpInside)
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
        self.view.endEditing(true)
    }
    
    @objc func hideKeyboard() {
        self.firstNameTextField.resignFirstResponder()
        self.secondNameTextField.resignFirstResponder()
        self.lastNameTextField.resignFirstResponder()
        self.ageTextField.resignFirstResponder()
        self.phoneTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(param: Notification) {
        let userInfo = param.userInfo
        let getKeyboardRect = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.myScrollView.contentOffset = CGPoint(x: 0, y: getKeyboardRect.height)
    }
    
    @objc func keyboardWillHide(param: Notification) {
        self.myScrollView.contentOffset = CGPoint.zero
    }
    
}

public extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.firstNameTextField:
            self.secondNameTextField.becomeFirstResponder()
        case self.secondNameTextField:
            self.lastNameTextField.becomeFirstResponder()
        case self.lastNameTextField:
            self.ageTextField.becomeFirstResponder()
        case self.ageTextField:
            self.phoneTextField.becomeFirstResponder()
        case self.phoneTextField:
            self.emailTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
