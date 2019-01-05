//
//  SecondViewController.swift
//  DelegationApp
//
//  Created by Maksim Nosov on 02/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func fillTheLabelWith(info: String)
}

class SecondViewController: UIViewController {
    
    var delegate: SecondViewController?

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendDataPressed(_ sender: UIButton) {
        let info = textField.text
        delegate.fill
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
