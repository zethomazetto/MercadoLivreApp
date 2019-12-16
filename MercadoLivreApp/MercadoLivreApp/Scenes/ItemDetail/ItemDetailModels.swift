//
//  ItemDetailModels.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

enum ItemDetailModels {
    
    struct GetItem {

        struct Request: GetItemRequest {
            var itemId: String
        }
        
        struct ResponseSuccess {
            var item: Item
        }
        
        struct ResponseError {
            var error: Error
        }
        
        struct ViewModel {
            
            struct ItemViewModel {
                var itemImageUrl: URL?
                var conditionAndQuantitySold: String
                var title: String
                var price: String
            }
            
            struct Success {
                var item: ItemViewModel
            }
            
            struct Error {
                var description: String
            }
        }
    }
}
