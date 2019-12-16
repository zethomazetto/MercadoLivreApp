//
//  ItemDetailRouter.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

@objc protocol ItemDetailRoutingLogic {
}

protocol ItemDetailDataPassing {
  var dataStore: ItemDetailDataStore? { get }
}

class ItemDetailRouter: NSObject, ItemDetailRoutingLogic, ItemDetailDataPassing {
    
    weak var viewController: ItemDetailViewController?
    var dataStore: ItemDetailDataStore?
}
