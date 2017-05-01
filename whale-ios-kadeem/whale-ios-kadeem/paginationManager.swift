//
//  paginationController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/10/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation
 class paginationController {
    
    static let sharedInstace = paginationController()
    
    var pageHolder:Int = 1
    
    func nextPage(pageHolder:Int) -> Int {
        
        let newPage = self.pageHolder + 1
        //save(pageHolder: newPage)
        //load()
        print(#function)
        print(newPage)
        return newPage
    }
  
    func lastPage(pageHolder:Int) -> Int {
        if self.pageHolder != 1 {
            
            let newPage = self.pageHolder - 1
            save(pageHolder: newPage)
            load()
            print(#function)
            print(newPage)
            return newPage
        }
        return pageHolder
        }

    
    func save(pageHolder:Int) {
        
        UserDefaults.standard.set(self.pageHolder,forKey:"pageNumber")

        print("I just saved \(self.pageHolder)")
    }
    
    func load() {
        self.pageHolder = UserDefaults.standard.object(forKey: "pageNumber") as! Int
   
        print("i just loaded \(self.pageHolder)")
    }
    
    func reset() {
        self.pageHolder = 1
        save(pageHolder: self.pageHolder)
    }
}
