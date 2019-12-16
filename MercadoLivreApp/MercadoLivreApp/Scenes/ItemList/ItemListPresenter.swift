//
//  ItemListPresenter.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol ItemListPresentationLogic {
    func presentSearchItemSuccess(response: ItemListModels.SearchItem.ResponseSuccess)
    func presentSearchItemError(response: ItemListModels.SearchItem.ResponseError)
}

class ItemListPresenter: ItemListPresentationLogic {
    
    weak var viewController: ItemListDisplayLogic?

    func presentSearchItemSuccess(response: ItemListModels.SearchItem.ResponseSuccess) {
        
        let query = response.searchItemResult.query ?? ""
        
        var items: [ItemListModels.SearchItem.ViewModel.ItemViewModel] = []
        response.searchItemResult.results?.forEach({ item in
            
            let thumbnailUrl = URL(string: item.thumbnail ?? "")
            let title = item.title ?? ""
            let price = NumberFormatter.BRLCurrencyFormatter.string(for: item.price) ?? ""
            let item = ItemListModels.SearchItem.ViewModel.ItemViewModel(thumbnailUrl: thumbnailUrl, title: title, price: price)
            items.append(item)
        })
        
        let viewModel = ItemListModels.SearchItem.ViewModel.Success(query: query, items: items)
        self.viewController?.displaySearchItemSuccess(viewModel: viewModel)
    }
    
    func presentSearchItemError(response: ItemListModels.SearchItem.ResponseError) {
        let description = response.error.localizedDescription
        let viewModel = ItemListModels.SearchItem.ViewModel.Error(description: description)
        viewController?.displaySearchItemError(viewModel: viewModel)
    }
}
