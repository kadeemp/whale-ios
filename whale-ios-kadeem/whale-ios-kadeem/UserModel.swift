//
//  UserModel.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 3/29/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import SwiftyJSON


class UserModel{
    
    //MARK:- Declaration
    
    var username:String
    var firstName:String
    var lastName:String
    var imageURL: URL
    var email:String
    
    //MARK:- Initialization
    
    init?(data: JSON) {
        guard let username = data["username"].string else {
            return nil
        }
        guard let firstName = data["first_name"].string else {
            return nil
        }
        guard let lastName = data["last_name"].string else {
            return nil
        }
        guard let email = data["email"].string else {
            return nil
        }
        
        // Accessing the profile picture
        guard let imageURLAddress = data["image_url"].string else {
            return nil
        }
        
        guard let imageURL = URL(string: imageURLAddress) else {
            return nil
        }
       
        
    //MARK:- Assignment
        
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.imageURL = imageURL
        self.email = email 
    }
    

    
    
}
