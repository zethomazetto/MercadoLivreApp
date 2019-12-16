//
//  ItemListRouter.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

@objc protocol ItemListRoutingLogic {
  func routeToItemDetail(segue: UIStoryboardSegue?)
}

protocol ItemListDataPassing {
  var dataStore: ItemListDataStore? { get }
}

class ItemListRouter: NSObject, ItemListRoutingLogic, ItemListDataPassing {

    weak var viewController: ItemListViewController?
    var dataStore: ItemListDataStore?
    
    func routeToItemDetail(segue: UIStoryboardSegue?) {
        
        if let segue = segue {
          let destinationVC = segue.destination as! ItemDetailViewController
          var destinationDS = destinationVC.router!.dataStore!
          passDataToItemDetail(source: dataStore!, destination: &destinationDS)
        } else {
          let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
          var destinationDS = destinationVC.router!.dataStore!
          passDataToItemDetail(source: dataStore!, destination: &destinationDS)
          navigateToItemDetail(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToItemDetail(source: ItemListViewController, destination: ItemDetailViewController) {
      source.show(destination, sender: nil)
    }
    
    // MARK: Passing data

    func passDataToItemDetail(source: ItemListDataStore, destination: inout ItemDetailDataStore)
    {
        if let selectedIndex = viewController?.selectedIndex {
            destination.itemID = source.searchItemResult?.results?[selectedIndex].id
        }
    }
}
