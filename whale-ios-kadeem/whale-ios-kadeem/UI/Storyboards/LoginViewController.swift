//
//  ViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 3/20/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }



    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        APIClient.loginUser(email:email, password:password) { (JSON) in
            print(JSON)
            
        }
        
    }
}

