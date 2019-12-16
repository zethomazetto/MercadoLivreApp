//
//  MercadoLivreAPI+SearchStoreProtocol.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

extension MercadoLivreAPI: SearchStoreProtocol {
    
    func searchItem(request: SearchItemRequest, onSuccess: @escaping (SearchItemResult) -> (), onError: @escaping (Error) -> ()) {
        let requestPath: String = "\(baseUrl)/sites/MLB/search?q=\(request.query)"
        
        guard let encodedURL = requestPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            onError(NSError(domain: "services.mercadolivreapi.searchitem.invalidencodedURL", code: -1, userInfo: nil))
            return
        }
        
        self.getMethod(requestPath: encodedURL, onSuccess: { searchItemResult in
            onSuccess(searchItemResult)
        }) { error in
            onError(error)
        }
    }
}
