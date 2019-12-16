//
//  ItemDetailViewController.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol ItemDetailDisplayLogic: class {
    func displayItemSuccess(viewModel: ItemDetailModels.GetItem.ViewModel.Success)
    func displayItemError(viewModel: ItemDetailModels.GetItem.ViewModel.Error)
}

class ItemDetailViewController: UIViewController, ItemDetailDisplayLogic {

    weak var itemDetailView: ItemDetailView! {
        return self.view as? ItemDetailView
    }
    var interactor: ItemDetailBusinessLogic?
    var viewModel = ItemDetailModels.GetItem.ViewModel.Success(item: ItemDetailModels.GetItem.ViewModel.ItemViewModel(itemImageUrl: URL(string: ""), conditionAndQuantitySold: "", title: "", price: "")) {
         didSet {
             self.itemDetailView.reloadItemDetail()
         }
     }
    var router: (NSObjectProtocol & ItemDetailRoutingLogic & ItemDetailDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItem()
    }
    
    private func setup() {
      let viewController = self
      let interactor = ItemDetailInteractor()
      let presenter = ItemDetailPresenter()
      let router = ItemDetailRouter()
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.viewController = viewController
      router.dataStore = interactor
    }
    
    func getItem() {
        self.itemDetailView.startLoadingView()
        interactor?.getItem()
    }

    func displayItemSuccess(viewModel: ItemDetailModels.GetItem.ViewModel.Success) {
//        itemDetailView.configureDetail(itemViewModel: viewModel.item)
        self.viewModel = viewModel
        self.itemDetailView.stopLoadingView()
    }

    func displayItemError(viewModel: ItemDetailModels.GetItem.ViewModel.Error) {
        showErrorAlert(description: viewModel.description)
        self.itemDetailView.stopLoadingView()
    }
    
    // MARK: - Error Controller
    
    func showErrorAlert(description: String) {
        let errorActionAlert = UIAlertController(title: "Erro", message: description, preferredStyle: .alert)
        errorActionAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(errorActionAlert, animated: true, completion: nil)
    }
}
