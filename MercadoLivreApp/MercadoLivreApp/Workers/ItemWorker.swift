//
//  ItemWorker.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 16/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol GetItemRequest {
    var itemId: String { get }
}

protocol ItemStoreProtocol {

    func getItem(request: GetItemRequest, onSuccess: @escaping (_ result: Item) -> (), onError: @escaping (_ error: Error) -> ())
}

class ItemWorker: ItemStoreProtocol {

    var itemStore: ItemStoreProtocol
    
    init(itemStore: ItemStoreProtocol) {
        
        self.itemStore = itemStore
    }
    
    func getItem(request: GetItemRequest, onSuccess: @escaping (Item) -> (), onError: @escaping (Error) -> ()) {
        itemStore.getItem(request: request, onSuccess: { item in
            onSuccess(item)
        }) { error in
            onError(error)
        }
    }
}
