//
//  ViewController.swift
//  09-10_UINavigationController
//
//  Created by Maksim Nosov on 19/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    var navigationBarHome: UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "UINavigationController"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ImageCell.self, forCellWithReuseIdentifier: "cellId")
        
        setupNavBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationBarHome = navigationController?.navigationBar
        navigationBarHome?.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 50)
        navigationBarHome?.isTranslucent = false
        navigationBarHome?.setBackgroundImage(UIImage(), for: .default)
        navigationBarHome?.shadowImage = UIImage()
    }
    
    func setupNavBarButtons() {
        navigationController?.hidesBarsOnSwipe = true
        let fingerImage = UIImage(named: "finger")?.withRenderingMode(.alwaysOriginal)
        let fingerBarButtonItem = UIBarButtonItem(image: fingerImage, style: .plain, target: self, action: #selector(handleFinger))
        navigationItem.rightBarButtonItems = [fingerBarButtonItem]
    }
    
    @objc func handleFinger() {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)        
        return cell
    }
}

class ImageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "city01")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, separatorView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
