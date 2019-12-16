//
//  Item.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

struct Item: Codable {
    var id: String?
    var title: String?
    var price: Double?
    var thumbnail: String?
    var sold_quantity: Int?
    var pictures: [Picture]?
    var attributes: [Attribute]?
}
