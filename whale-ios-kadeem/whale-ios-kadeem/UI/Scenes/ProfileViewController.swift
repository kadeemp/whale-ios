//
//  ProfileViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/3/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import KeychainSwift

class ProfileViewController: UIViewController {
    let keychain = KeychainSwift()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        keychain.clear()
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
