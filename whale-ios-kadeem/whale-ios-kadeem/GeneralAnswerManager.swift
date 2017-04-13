//
//  AnswerManager.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/9/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation
class GeneralAnswerManager {
    static let sharedInstance = GeneralAnswerManager()
    
    var Array = [AnswerStruct]()
    
    
    var count:Int {
        get {
            return Array.count
        }
    }
    
    func add(item:AnswerStruct) {
        
        Array.append(item)
        
    }
    func remove(index:Int) {
        Array.remove(at: index)
        save()
    }
    
    func save() {
        //saves pantryArray to NSUserdefaults
        UserDefaults.standard.set(Array, forKey: "answerArray")
    }
    func load() {
        //loads pantryArray from nsuserdefaults
        
        //how to apply if let here
        ///
        ///
        ////
        if let Array = UserDefaults.standard.object(forKey: "answerArray") as? [AnswerStruct] {
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
