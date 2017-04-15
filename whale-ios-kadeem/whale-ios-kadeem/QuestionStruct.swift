//
//  QuestionStruct.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/14/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation
struct QuestionStruct {
    
    
    // let likeCount:Int? = nil
    //  let id :Int = 0
    //  let commentCount:Int? = 0
    
    var senderUsername:String
    var senderImageURL:URL
    var senderFirstName:String
    var senderLastName:String
    var questionContent:String
    
    init (senderUsername : String, senderImageURL : URL, senderFirstName : String,  senderLastName : String, questionContent : String){
        self.senderUsername = senderUsername
        self.senderImageURL = senderImageURL
        self.senderFirstName = senderFirstName
        self.senderLastName = senderLastName
        self.questionContent = questionContent
    }
}
