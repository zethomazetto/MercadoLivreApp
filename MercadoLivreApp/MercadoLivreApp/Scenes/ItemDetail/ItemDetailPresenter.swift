//
//  ItemDetailPresenter.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol ItemDetailPresentationLogic {
    func presentItemSuccess(response: ItemDetailModels.GetItem.ResponseSuccess)
    func presentItemItemError(response: ItemDetailModels.GetItem.ResponseError)
}

class ItemDetailPresenter: ItemDetailPresentationLogic {

    weak var viewController: ItemDetailDisplayLogic?
    
    func presentItemSuccess(response: ItemDetailModels.GetItem.ResponseSuccess) {

        let itemImageUrl = URL(string: response.item.pictures?.first?.url ?? "")
        var conditionAndQuantitySold = ""
        let condition = response.item.attributes?.filter({ attribute -> Bool in
            return attribute.id == "ITEM_CONDITION"
            }).first?.value_name
        
        var quantity: String?
        if let sold_quantity = response.item.sold_quantity {
            quantity = "\(sold_quantity) \(sold_quantity == 1 ? "vendido" : "vendidos")"
        }
        
        if let condition = condition, let quantity = quantity {
            conditionAndQuantitySold = "\(condition) - \(quantity)"
        }
        else if let quantity = quantity {
            conditionAndQuantitySold = "\(quantity)"
        }
        
        let title = response.item.title ?? ""
        let price = NumberFormatter.BRLCurrencyFormatter.string(for: response.item.price) ?? ""
        
        let item = ItemDetailModels.GetItem.ViewModel.ItemViewModel(itemImageUrl: itemImageUrl, conditionAndQuantitySold: conditionAndQuantitySold, title: title, price: price)
        let viewModel = ItemDetailModels.GetItem.ViewModel.Success(item: item)
        self.viewController?.displayItemSuccess(viewModel: viewModel)
    }
    
    func presentItemItemError(response: ItemDetailModels.GetItem.ResponseError) {
        let description = response.error.localizedDescription
        let viewModel = ItemDetailModels.GetItem.ViewModel.Error(description: description)
        viewController?.displayItemError(viewModel: viewModel)
    }
}
