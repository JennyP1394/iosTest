//
//  APIManager.swift
//  MovieDBApp
//
//  Created by Janki on 09/11/22.
//

import Foundation
import Alamofire
import UIKit

class APIManager {
    // MARK: - Vars & Lets
    private let sessionManager: Session
    
    // MARK: - Vars & Lets
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())
        return apiManager
    }()
    
    // MARK: - Accessors
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?) -> Void) where T: Codable {
        AF.request(type.url,
                   method: type.httpMethod,
                   parameters: params,
                   encoding: type.encoding,
                   headers: type.headers).validate().response { data in
            
            if let respData = data.data {
                let response = String(data: respData, encoding: .utf8)
            #if DEBUG
                debugPrint("Response : \(response ?? "No response data")")
            #endif
            }
            
            switch data.result {
                
            case .success(_):
                
                let decoder = JSONDecoder()
                if let jsonData = data.data {
                    do {
                        let result = try decoder.decode(T.self, from: jsonData)
                        handler(result, nil)
                        
                    } catch let error {
                        print(error)
                        handler(nil, AlertMessage(title: error.localizedDescription))
                    }
                }
            case .failure(_):
                handler(nil, self.parseApiError(data: data.data))
            }
        }.cURLDescription { description in
            #if DEBUG
            debugPrint(description)
            #endif
        }
    }

    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(ErrorObject.self, from: jsonData) {
            let errorAlert = AlertMessage()
            errorAlert.title = error.key ?? "Error"
            errorAlert.body = error.message
            return errorAlert
        }
        return AlertMessage()
    }
}
// MARK: - AlertMessage Class
class AlertMessage {
    var title: String
    var body: String
    init(title: String = "API Failed", body: String = "Something went wrong") {
        self.title = title
        self.body = body
    }
}

