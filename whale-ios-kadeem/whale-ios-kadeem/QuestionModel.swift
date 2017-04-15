//
//  AnswerModel.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/5/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import SwiftyJSON

class QuestionModel {
    //MARK:- Declaration
    


    

    
    var senderUsername:String
    var senderImageURL:URL
    var senderFirstName:String
    var senderLastName:String
    var questionContent:String
    
    //MARK:- Initialization
    init?(data:JSON) {
    
        
        guard let senderUsername = data["sender"]["username"].string else {
            fatalError()
        }
        guard let senderImageURLAddress = data["sender"]["image_url"].string else {
            fatalError()
        }
        guard let senderImageURL = URL(string: senderImageURLAddress) else {
            fatalError()
        }
        guard let senderFirstName = data["sender"]["first_name"].string else {
            fatalError()
        }
        guard let senderLastName = data["sender"]["last_name"].string else {
            fatalError()
        }
        guard let questionContent = data["content"].string else {
            fatalError()
        }
        //MARK:- Assignment


        self.senderUsername = senderUsername
        self.senderImageURL = senderImageURL
        self.senderFirstName = senderFirstName
        self.senderLastName = senderLastName
        self.questionContent = questionContent
        
    }
    
    
    
    
    
}
