import UIKit
import Alamofire

import SwiftyJSON
import KeychainSwift

//protocol TargetType {
//    var parameters: Parameters {get set}
//    var path: String {get set}
//}
//
//enum APIClient {
//    case login(email: String, password: String)
//}
//
//extension APIClient: TargetType {
//    internal var path: String {
//        get {
//            <#code#>
//        }
//        set {
//            <#code#>
//        }
//    }
//
//    internal var parameters: Parameters {
//        get {
//            <#code#>
//        }
//        set {
//            <#code#>
//        }
//    }
//
//    var parameters: Parameters {
//        switch self {
//        case let .login(email, password):
//            return [
//                "email": email,
//                "password": password
//            ]
//        }
//    }
//
//}

class APIClient {
    
    //TODO:- Create User
    //TODO:- Request Answers by page
    //TODO:- Req Answer comments
    //TODO:- Req Answer Likes
    
    static func getAnswers(per_page:Int, page:Int) {
        let urlRequestConvertible = Router.getAnswers(per_page:per_page, page:page)
        
        Alamofire.request(urlRequestConvertible).responseJSON { (response) in
            print(response)
            print("---------------")
            print("---------------")
            print("---------------")
            switch response.result {
            case .success:
                let keychain = KeychainSwift()
                let data = JSON(data: response.data!)
                print(data)
                
                
                
            case .failure:
                print("error occurred")
                return
            }
        }
        
    }
    
    
    static func loginUser(email: String, password: String, completion: ((UserModel) -> Void)?) {
        
        let urlRequestConvertible = Router.loginUser(email: email,
                                                     password: password)
        
        Alamofire.request(urlRequestConvertible).responseJSON { (response) in
            print(response)
            print("---------------")
            print("---------------")
            print("---------------")
            switch response.result {
            case .success:
                let keychain = KeychainSwift()
                let data = JSON(data: response.data!)
                
                
                guard let user = UserModel(data: data) else {
                    fatalError("User data does not exist")
                }
                
                let header = response.response!.allHeaderFields["Authorization"]!
                
                let headerHolder = String(describing: header)
                keychain.set(headerHolder, forKey: "token")
                completion?(user)
                let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "TabVC")
                
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                appDelegate?.window?.rootViewController = vc
                
                
            case .failure:
                print("error occurred")
                return
            }
        }
    }
    static func createUser(firstName:String,lastName:String, email:String,password:String, username:String, completion: ((UserModel) -> Void)?) {
        
        let urlRequestConvertible = Router.createUser(firstName:firstName,lastName:lastName, email:email,password:password, username:username)
        
        Alamofire.request(urlRequestConvertible).responseJSON { (response) in
            print(response)
            print("---------------")
            print("---------------")
            print("---------------")
            switch response.result {
            case .success:
                let keychain = KeychainSwift()
                let data = JSON(data: response.data!)
                print(data)
                
                
                guard let user = UserModel(data: data) else {
                    fatalError("User data does not exist")
                }
                
                let header = response.response!.allHeaderFields["Authorization"]!
                
                let headerHolder = String(describing: header)
                
                keychain.set(headerHolder, forKey: "token")
                
                completion?(user)
                let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "TabVC")
                
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                appDelegate?.window?.rootViewController = vc
                
                
            case .failure:
                print("error occurred")
                return
            }
        }
    }

    static func checkForToken() -> String {
        let keychain = KeychainSwift()
        if let token = keychain.get("token"){
            return token
        } else {
            print("No token set")
            
        }
      return ""
    }
}

//MARK:- Variable Declaration

//    var apiClient: APIClient
//
//    init(client: APIClient) {
//        self.apiClient = client
//    }
//
//MARK:- LOGIN


