//
//  Router.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 3/29/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    
    //MARK:- Base URL
    
   static let baseURL: String = "https://whale2-elixir.herokuapp.com/api/v1"
    
    //MARK:- Router Case Delcaration
    case getUsers
    case getAnswers
    case getAnswerComments(String)
    case getAnswerLikes(String)
    case getMyQuestions
    
    case createUser(firstName:String,lastName:String, email:String,password:String, username:String)
    case postQuestions
    case postAnswer(String)
    
    case loginUser(email:String, password:String)
    
    //MARK:- HTTP Method Cases
    var method: HTTPMethod {
        switch self {
            case .getUsers,
                 .getAnswers,
                 .getAnswerComments,
                 .getAnswerLikes,
                 .getMyQuestions:
            return .get
            
            case .createUser,
                 .loginUser,
                 .postAnswer,
                 .postQuestions:
            return .post

        }
    }
    
    //MARK:- URL Path Cases
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .createUser:
            return "/users"
        case .getAnswers:
            return "/answers"
        case .loginUser:
            return "/sessions"
        case .getAnswerComments(let answer_id):
            return "/answers/\(answer_id)/comments"
        case .getAnswerLikes(let question_id):
            return "/answers/\(question_id)/likes"
        case .postAnswer(let question_id):
            return "questions/\(question_id)/answers"
        case .getMyQuestions:
            return "/questions"
        case .postQuestions:
            return "/questions"
            
        }
    }
    
    //MARK:- URL Request
    
    
    func asURLRequest() throws -> URLRequest {
    //URL Parameters
        let parameters : [String:Any] = {
            switch self {
            case    .getUsers,
                    .getAnswers,
                    .getAnswerComments,
                    .getAnswerLikes,
                    .getMyQuestions:
                return [:]
                
            //TODO: add cases for .createUser, .postAnswer, .postQuestion, .Answers
            case .loginUser(let email, let password):
                return ["email": email,
                        "password":password];
            case .createUser(let firstName,let lastName, let email,let password, let username):
                return ["firstName": firstName,"lastName":lastName, "email": email,
                        "password":password,"username":username];
            case .getAnswers():
                return ["per_page": 10,
            "IntPage": 0]
             

            default:
                return[:]
            }
            
        }()   // <- () Ask why this is here
        
        
        //Add cases when headers become necessary
        let headers: [String:String] = {
            switch self {
            default:
                return [:]
            }
        }()
        
//TODO:- Rewrite comments
    let url = try Router.baseURL.asURL()

    // Creating a request
        
    var request = URLRequest(url: url.appendingPathComponent(path))
        
    // Mutates the request to change the HTTPRequest method
        
    request.httpMethod = method.rawValue
    
    // Adds the headers to the request
        
    headers.forEach { (key, value) in
        request.setValue(value, forHTTPHeaderField: key)
    }
    
    // Sends the request
    switch self {
    case .createUser:
        return try JSONEncoding.default.encode(request, with: parameters)
    default:
        return try URLEncoding.default.encode(request, with: parameters)
    }
        

    
    }
    
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
