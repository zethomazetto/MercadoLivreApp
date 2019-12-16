//
//  ItemDetailView.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import MBProgressHUD

class ItemDetailView: UIView {

    let itemDetailCellName = "ItemDetailCell"
    @IBOutlet weak var itemDetailTableView: UITableView! {
        didSet {
            self.itemDetailTableView.register(UINib(nibName: itemDetailCellName, bundle: .main), forCellReuseIdentifier: itemDetailCellName)
        }
    }
    
    func getItemDetailCell(tableView: UITableView, indexPath: IndexPath) -> ItemDetailCell {
        return tableView.dequeueReusableCell(withIdentifier: itemDetailCellName, for: indexPath) as? ItemDetailCell ?? ItemDetailCell(style: .default, reuseIdentifier: itemDetailCellName)
    }
    
    func reloadItemDetail() {
        self.itemDetailTableView.reloadData()
    }
    
    func startLoadingView() {
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    func stopLoadingView() {
        MBProgressHUD.hide(for: self, animated: true)
    }
}
