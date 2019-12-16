//
//  ItemDetailInteractor.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol ItemDetailBusinessLogic {
    func getItem()
}

protocol ItemDetailDataStore {
    var itemID: String? { get set }
}

class ItemDetailInteractor: ItemDetailBusinessLogic, ItemDetailDataStore {
    
    var itemID: String?
    var presenter: ItemDetailPresentationLogic?
    var itemWorker = ItemWorker(itemStore: MercadoLivreAPI())
    
    func getItem() {
        
        if let itemID = itemID {
            let request = ItemDetailModels.GetItem.Request(itemId: itemID)
            
            itemWorker.getItem(request: request, onSuccess: { item in
                let response = ItemDetailModels.GetItem.ResponseSuccess(item: item)
                self.presenter?.presentItemSuccess(response: response)
            }) { error in
                let response = ItemDetailModels.GetItem.ResponseError(error: error)
                self.presenter?.presentItemItemError(response: response)
            }
        }
        else {
            let error = NSError(domain: "interactor.getitem.nodata", code: -1, userInfo: nil)
            let response = ItemDetailModels.GetItem.ResponseError(error: error)
            self.presenter?.presentItemItemError(response: response)
        }
    }
}
