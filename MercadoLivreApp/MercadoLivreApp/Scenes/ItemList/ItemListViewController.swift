//
//  ItemListViewController.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

protocol ItemListDisplayLogic: class {
    func displaySearchItemSuccess(viewModel: ItemListModels.SearchItem.ViewModel.Success)
    func displaySearchItemError(viewModel: ItemListModels.SearchItem.ViewModel.Error)
}

class ItemListViewController: UIViewController, ItemListDisplayLogic, UISearchBarDelegate {

    weak var itemListView: ItemListView! {
        return self.view as? ItemListView
    }
    var interactor: ItemListBusinessLogic?
    var router: (NSObjectProtocol & ItemListRoutingLogic & ItemListDataPassing)?
    var viewModel = ItemListModels.SearchItem.ViewModel.Success(query: "", items: []) {
        didSet {
            self.itemListView.reloadItemList()
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    var selectedIndex: Int?
    
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
        configureSearchController(placeholder: "Buscar produtos")
        startSearch(query: "iPhone")
    }
    
    private func setup() {
      let viewController = self
      let interactor = ItemListInteractor()
      let presenter = ItemListPresenter()
      let router = ItemListRouter()
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.viewController = viewController
      router.dataStore = interactor
    }
    
    func startSearch(query: String) {
        self.itemListView.startLoadingView()
        interactor?.searchItem(query: query)
    }
    
    func displaySearchItemSuccess(viewModel: ItemListModels.SearchItem.ViewModel.Success) {
        self.viewModel = viewModel
        self.itemListView.stopLoadingView()
    }
    
    func displaySearchItemError(viewModel: ItemListModels.SearchItem.ViewModel.Error) {
        showErrorAlert(description: viewModel.description)
        self.itemListView.stopLoadingView()
    }
    
    // MARK: - Error Controller
    
    func showErrorAlert(description: String) {
        let errorActionAlert = UIAlertController(title: "Erro", message: description, preferredStyle: .alert)
        errorActionAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(errorActionAlert, animated: true, completion: nil)
    }
    
    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
      if let scene = segue.identifier {
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
        if let router = router, router.responds(to: selector) {
          router.perform(selector, with: segue)
        }
      }
    }
    
    // MARK: - Search Controller
    
    func configureSearchController(placeholder: String?) {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = placeholder
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func filterContentForSearchText(_ searchText: String?) {
        if let query = searchText {
            startSearch(query: query)
        }
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterContentForSearchText(searchBar.text)
    }
}
