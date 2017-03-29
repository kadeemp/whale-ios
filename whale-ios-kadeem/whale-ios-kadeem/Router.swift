//
//  Router.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 3/29/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import Alamofire

class Router: URLRequestConvertible {
    
    //Base URL of the API
    
    var baseURL:Strng = "https://whale2-elixir.herokuapp.com/api/v1"
    
//    static func loginUser(email:String, password:String ){
//        let url = "https://whale2-elixir.herokuapp.com/api/v1/sessions"
//        
//        Alamofire.request(url , method: .post, parameters: parameters , encoding: JSONEncoding.default ).responseJSON { response in
//            
//            
//            
//            print(response.request)  // original URL request
//            print("-----------")
//            print(response.response) // HTTP URL response
//            print("-----------")
//            print(response.data)     // server data
//            print("-----------")
//            print(response.result)   // result of response serialization
//            print("-----------")
//            
//            if let value = (response.response) {
//                
//                let json = JSON(data:value )
//                print(json)
//            }
//        }
//    }

    
}
