//
//  ViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 3/20/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestHandler.sharedInstance.loginUser()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

