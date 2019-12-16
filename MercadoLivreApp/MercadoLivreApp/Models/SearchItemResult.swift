//
//  SearchItemResult.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

struct SearchItemResult: Codable {
    var query: String?
    var results: [Item]?
}
