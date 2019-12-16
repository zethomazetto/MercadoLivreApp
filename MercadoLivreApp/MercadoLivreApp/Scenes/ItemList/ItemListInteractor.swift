//
//  ItemListInteractor.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol ItemListBusinessLogic {
    func searchItem(query: String)
}

protocol ItemListDataStore {
  var searchItemResult: SearchItemResult? { get }
}

class ItemListInteractor: ItemListBusinessLogic, ItemListDataStore {

    var presenter: ItemListPresentationLogic?
    let searchWorker = SearchWorker(searchStore: MercadoLivreAPI())
    var searchItemResult: SearchItemResult?
    
    func searchItem(query: String) {
        let request = ItemListModels.SearchItem.Request(query: query)
        searchWorker.searchItem(request: request, onSuccess: { searchItemResult in
            self.searchItemResult = searchItemResult
            let response = ItemListModels.SearchItem.ResponseSuccess(searchItemResult: searchItemResult)
            self.presenter?.presentSearchItemSuccess(response: response)
        }) { error in
            let response = ItemListModels.SearchItem.ResponseError(error: error)
            self.presenter?.presentSearchItemError(response: response)
        }
    }
}
