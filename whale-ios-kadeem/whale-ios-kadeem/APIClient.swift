import UIKit
import Alamofire
import Moya
import SwiftyJSON

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
            switch response.result {
            case .success:
                
                let data = JSON(data: response.data!)
                guard let user = UserModel(data: data) else {
                    fatalError("User data does not exist")
                }
                
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
