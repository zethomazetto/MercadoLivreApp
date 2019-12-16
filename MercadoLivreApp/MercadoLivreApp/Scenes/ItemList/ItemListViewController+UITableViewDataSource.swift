//
//  ItemListViewController+UITableViewDataSource.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.itemListView.getItemListCell(tableView: tableView, indexPath: indexPath)
        let itemViewModel = self.viewModel.items[indexPath.row]
        cell.configure(itemViewModel: itemViewModel)
        return cell
    }
}
