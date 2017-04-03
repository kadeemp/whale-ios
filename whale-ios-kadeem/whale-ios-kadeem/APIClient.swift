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
                print (header)
                let headerHolder = String(describing: header)
                keychain.set(headerHolder, forKey: "token")
                completion?(user)

                
            case .failure:
                return
            }
        }
    }
    //MARK:- Variable Declaration
    var parameters: [String:Any]? = [
        "email":"fake@email.com",
        "password":"password"
    ]
//    var apiClient: APIClient
//    
//    init(client: APIClient) {
//        self.apiClient = client
//    }
//    
    //MARK:- LOGIN
    
    }
