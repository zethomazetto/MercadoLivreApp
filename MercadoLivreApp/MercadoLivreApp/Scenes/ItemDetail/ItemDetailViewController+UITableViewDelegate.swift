//
//  ItemDetailViewController+UITableViewDelegate.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 16/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension ItemDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 562
    }
}
