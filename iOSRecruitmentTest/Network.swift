//
//  Network.swift
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


// Networking

enum Network {
    case GetItems(offset: Int)

    //MARK:- Private
    private var method: HTTPMethod{
        
        switch self {
        case .GetItems:
            return HTTPMethod.get

        }
    }
    
    var url: String {
        return Constants.kServerURL + self.urlEnd
        
    }
    
    private var headers: HTTPHeaders{
        return [
            "Accept": "application/json"
        ]
    }
    
    private var urlEnd: String {
        switch self {
        case .GetItems: return "items"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .GetItems(let offset):
            return [
                "limit" : 10,
                "offset" : offset
            ]
        }
    }
    
    //MARK:- public
    
    public func request(successCompletion: @escaping ([String: AnyObject]) -> Void, errorCompletion: ((String) -> Void)?) {
  //      "***START***\nRequest for JSON: \nurl:\(self.url)\nmethod:\(self.method)\nparameters:\(self.parameters)\n***END***".log()
        
        Alamofire
            .request(
                self.url,
                method: self.method,
                parameters: self.parameters,
                headers: self.headers)
            .validate()
            .responseJSON {
                (response) in
                print(response.debugDescription)
                switch response.result {
                case .success:
                    successCompletion(response.result.value as? [String: AnyObject] ?? [:])
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    guard let function = errorCompletion
                        else{
                            return
                    }
                    function(ErrorHandler.handleError(code: (error as? AFError)?.responseCode ?? 0))
                }
        }
    }
    
    func responseModel<T:Mappable>(successCompletion: @escaping (T) -> Void, errorCompletion: ((String) -> Void)?) {
  //      "***START***\nRequest for Model: \nurl:\(self.url)\nmethod:\(self.method)\nparameters:\(self.parameters)\n***END***".log()
        Alamofire
            .request(
                self.url,
                method: self.method,
                parameters: self.parameters,
                headers: self.headers)
            .validate()
            .responseObject {
                (response: DataResponse<T>) in
                switch response.result {
                case .success:
                    
                    guard let model = response.result.value else{
                        guard let function = errorCompletion
                            else{
                                return
                        }
                        function(ErrorHandler.handleError(code: 900))
                        return
                    }
                    
                    successCompletion(model)
                    
                case .failure(let error):
                    guard let function = errorCompletion
                        else{
                            return
                    }
                    function(ErrorHandler.handleError(code: (error as? AFError)?.responseCode ?? 0))
                }
        }
    }
    
    func responseModelArray<T:Mappable>(successCompletion: @escaping ([T]) -> Void, errorCompletion: ((String) -> Void)?) {
        
  //      "***START***\nRequest for Model Array: \nurl:\(self.url)\nmethod:\(self.method)\nparameters:\(self.parameters)\n***END***".log()
        
        Alamofire
            .request(
                self.url,
                method: self.method,
                parameters: self.parameters,
                headers: self.headers)
            .validate()
            .responseArray {
                (response: DataResponse<[T]>) in
                switch response.result {
                case .success:
                    
                    guard let model = response.result.value else{
                        guard let function = errorCompletion
                            else{
                                return
                        }
                        function(ErrorHandler.handleError(code: 900))
                        return
                    }
                    
                    successCompletion(model)
                    
                case .failure(let error):
                    guard let function = errorCompletion
                        else{
                            return
                    }
                    function(ErrorHandler.handleError(code: (error as? AFError)?.responseCode ?? 0))
                }
        }
    }
}
