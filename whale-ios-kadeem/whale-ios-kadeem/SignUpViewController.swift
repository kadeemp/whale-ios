//
//  SignUpViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/3/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        guard let username = usernameTextField.text else {
            return
        }
        guard let firstName = firstNameTextField.text else {
            return
        }
        guard let lastName = lastNameTextField.text else {
            return
        }
        APIClient.createUser(firstName: firstName, lastName: lastName, email: email, password: password, username: username)  { (JSON) in
            print(JSON)
            
    }
    }

//    self.username = username
//    self.firstName = firstName
//    self.lastName = lastName
//    self.imageURL = imageURL
//    self.email = email

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
