//
//  MercadoLivreAPI.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import Alamofire

class MercadoLivreAPI: NSObject {
    
    let sessionManager: SessionManager = Alamofire.SessionManager.default
    let baseUrl = "https://api.mercadolibre.com"
    
    func getMethod<T: Decodable>(requestPath: String, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil, onSuccess: @escaping (T) -> (), onError: @escaping (Error) -> ()) {
        
        self.sessionManager
            .request(requestPath, method: .get, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseJSON {
                response in
                
                guard response.result.error == nil else {
                    onError(response.result.error!)
                    return
                }
                
                guard let data = response.data else {
                    onError(response.error!)
                    return
                }
                
                do{
                    let object = try JSONDecoder().decode(T.self, from: data)
                    onSuccess(object)
                }
                catch{
                    onError(error)
                }
        }
    }
}
