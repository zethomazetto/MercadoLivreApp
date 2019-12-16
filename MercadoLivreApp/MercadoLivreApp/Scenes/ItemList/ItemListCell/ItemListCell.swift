//
//  ItemListCell.swift
//  MercadoLivreApp
//
//  Created by Ezequiel Thomazetto on 14/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import AlamofireImage

class ItemListCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
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
    
    func configure(itemViewModel:ItemListModels.SearchItem.ViewModel.ItemViewModel) {
        
        if let thumbnailUrl = itemViewModel.thumbnailUrl {
            self.thumbnailImageView.af_setImage(withURL: thumbnailUrl)
        }
        
        self.itemTitleLabel.text = itemViewModel.title
        self.itemPriceLabel.text = itemViewModel.price
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbnailImageView.image = nil
    }
}
