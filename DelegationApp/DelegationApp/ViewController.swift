//
//  ViewController.swift
//  DelegationApp
//
//  Created by Maksim Nosov on 02/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.delegate = self
    }
    }
    
    func fillTheLabelWith(info: String) {
        myLabel.text = info
    }
    
    @IBAction func goTo2VC(_ sender: UIButton) {
    }
    
}

