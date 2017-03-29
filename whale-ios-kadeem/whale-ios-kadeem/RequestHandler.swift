import UIKit
import Alamofire
import Moya

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

class RequestHandler {
    
    static let sharedInstance = RequestHandler()
    
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
    
  func loginUser(){
        let url = "https://whale2-elixir.herokuapp.com/api/v1/sessions"
        
        Alamofire.request(url , method: .post, parameters: parameters , encoding: JSONEncoding.default ).responseJSON { response in
            
            print(response.request)  // original URL request
            print("-----------")
            print(response.response) // HTTP URL response
            print("-----------")
            print(response.data)     // server data
            print("-----------")
            print(response.result)   // result of response serialization
            print("-----------")
            
            if let value = (response.response) {
               print(value)
            }
        }
    }
}
