//
//  ItemListView.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import MBProgressHUD

class ItemListView: UIView {
    
    let itemListCellName = "ItemListCell"
    @IBOutlet weak var itemListTableView: UITableView!{
        didSet {
            self.itemListTableView.register(UINib(nibName: itemListCellName, bundle: .main), forCellReuseIdentifier: itemListCellName)
        }
    }
    
    func getItemListCell(tableView: UITableView, indexPath: IndexPath) -> ItemListCell {
        return tableView.dequeueReusableCell(withIdentifier: itemListCellName, for: indexPath) as? ItemListCell ?? ItemListCell(style: .default, reuseIdentifier: itemListCellName)
    }
    
    func reloadItemList() {
        self.itemListTableView.reloadData()
    }
    
    func startLoadingView() {
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    func stopLoadingView() {
        MBProgressHUD.hide(for: self, animated: true)
    }

}
