//
//  NumberFormatter.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 15/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static let BRLCurrencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        return currencyFormatter
    }()
}
