//
//  MercadoLivreAPI+ItemStoreProtocol.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 16/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

extension MercadoLivreAPI: ItemStoreProtocol {
    
    func getItem(request: GetItemRequest, onSuccess: @escaping (Item) -> (), onError: @escaping (Error) -> ()) {
        let requestPath: String = "\(baseUrl)/items/\(request.itemId)"
        
        self.getMethod(requestPath: requestPath, onSuccess: { searchItemResult in
            onSuccess(searchItemResult)
        }) { error in
            onError(error)
        }
    }
}
