//
//  SearchWorker.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol SearchItemRequest {
    var query: String { get }
}

protocol SearchStoreProtocol {
    func searchItem(request: SearchItemRequest, onSuccess: @escaping (_ result: SearchItemResult) -> (), onError: @escaping (_ error: Error) -> ())
}

class SearchWorker: SearchStoreProtocol {

    var searchStore: SearchStoreProtocol
    
    init(searchStore: SearchStoreProtocol) {
        
        self.searchStore = searchStore
    }
    
    func searchItem(request: SearchItemRequest, onSuccess: @escaping (SearchItemResult) -> (), onError: @escaping (Error) -> ()) {
        searchStore.searchItem(request: request, onSuccess: { searchItemResult in
            onSuccess(searchItemResult)
        }) { error in
            onError(error)
        }
    }
}
