//
//  ItemListModels.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

enum ItemListModels {
    
    struct SearchItem {
        
        struct Request: SearchItemRequest {
            var query: String
        }
        
        struct ResponseSuccess {
            var searchItemResult: SearchItemResult
        }
        
        struct ResponseError {
            var error: Error
        }
        
        struct ViewModel {
            
            struct ItemViewModel {
                var thumbnailUrl: URL?
                var title: String
                var price: String
            }
            
            struct Success {
                var query: String
                var items: [ItemViewModel]
            }
            
            struct Error {
                var description: String
            }
        }
    }
}
