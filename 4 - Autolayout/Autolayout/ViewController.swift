//
//  ViewController.swift
//  Autolayout
//
//  Created by Steeve Pommier on 04/11/15.
//  Copyright © 2015 CostardRouge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    var secure = false { didSet { updateUI() } }
    
    func updateUI() {
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secure Password" : "Password"
    }
    
    @IBAction func toggleSecurity() {
        secure = !secure
    }
    
    @IBAction func login() {
        
    }
}

