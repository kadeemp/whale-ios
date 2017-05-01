//
//  AnswerManager.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/9/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation
class GeneralQuestionManager {
    static let sharedInstance = GeneralQuestionManager()
    
    var Array = [QuestionModel]()
    
    
    var count:Int {
        get {
            return self.Array.count
        }
    }
    
    func add(item:QuestionModel) {
        
        Array.append(item)
        
    }
    func remove(index:Int) {
        Array.remove(at: index)
        save()
    }
    
    func save() {
        //saves pantryArray to NSUserdefaults
        UserDefaults.standard.set(Array, forKey: "QuestionArray")
    }
    func load() {
        //loads pantryArray from nsuserdefaults
        
        //how to apply if let here
        ///
        ///
        ////
        if let Array = UserDefaults.standard.object(forKey: "QuestionArray") as? [QuestionModel] {
            self.Array = Array
        }
        
        
    }
    func clear() {
        Array = []
        self.save()
    }
    
    init() {
    }
}
