//
//  AnswerStruct.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/12/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation
struct AnswerStruct {
    var videoURL:URL
    var thumbnailURL:URL
    
    // let likeCount:Int? = nil
    //  let id :Int = 0
    //  let commentCount:Int? = 0
    
    var senderUsername:String
    var senderImageURL:URL
    var senderFirstName:String
    var senderLastName:String
    var answerContent:String
    init (videoURL : URL, thumbnailURL : URL, senderUsername : String, senderImageURL : URL, senderFirstName : String,  senderLastName : String, answerContent : String){
    
    self.videoURL = videoURL
    self.thumbnailURL = thumbnailURL
    self.senderUsername = senderUsername
    self.senderImageURL = senderImageURL
    self.senderFirstName = senderFirstName
    self.senderLastName = senderLastName
    self.answerContent = answerContent
    }
}
