//
//  ItemDetailViewController+UITableViewDataSource.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 16/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension ItemDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.itemDetailView.getItemDetailCell(tableView: tableView, indexPath: indexPath)
        cell.configure(itemViewModel: self.viewModel.item)
        return cell
    }
}
