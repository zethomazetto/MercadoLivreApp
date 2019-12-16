//
//  ItemDetailCell.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 16/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import AlamofireImage

class ItemDetailCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var conditionAndQuantitySoldLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(itemViewModel:ItemDetailModels.GetItem.ViewModel.ItemViewModel) {
        
        if let itemImageUrl = itemViewModel.itemImageUrl {
            self.itemImageView.af_setImage(withURL: itemImageUrl)
        }
        conditionAndQuantitySoldLabel.text = itemViewModel.conditionAndQuantitySold
        itemTitleLabel.text = itemViewModel.title
        itemPriceLabel.text = itemViewModel.price
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.itemImageView.image = nil
    }
}
