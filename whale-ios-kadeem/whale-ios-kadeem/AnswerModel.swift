//
//  AnswerModel.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/5/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import SwiftyJSON

class AnswerModel {
    //MARK:- Declaration
    
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
    
    //MARK:- Initialization
    init?(data: JSON) {
        
        guard let videoURLAddress = data["video_url"].string else {
            return nil
        }
        guard let videoURL = URL(string:videoURLAddress) else {
            return nil
        }
        
        guard let thumbnailURLAddress = data["thumbnail_url"].string else {
            return nil
        }
        guard let thumbnailURL = URL(string: thumbnailURLAddress) else {
            return nil
        }
        
        
        
        guard let senderUsername = data["question"]["sender"]["username"].string else {
            return nil
        }
        guard let senderImageURLAddress = data["question"]["sender"]["image_url"].string else {
            return nil
        }
        guard let senderImageURL = URL(string: senderImageURLAddress) else {
            return nil
        }
        guard let senderFirstName = data["question"]["sender"]["first_name"].string else {
            return nil
        }
        guard let senderLastName = data["question"]["sender"]["last_name"].string else {
            return nil
        }
        guard let answerContent = data["question"]["content"].string else {
            return nil
        }
        //MARK:- Assignment
        self.videoURL = videoURL
        self.thumbnailURL = thumbnailURL
        self.senderUsername = senderUsername
        self.senderImageURL = senderImageURL
        self.senderFirstName = senderFirstName
        self.senderLastName = senderLastName
        self.answerContent = answerContent
        
    }
    
    
    
    
    
}
