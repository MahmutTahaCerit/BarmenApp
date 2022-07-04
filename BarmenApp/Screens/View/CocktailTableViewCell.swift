//
//  CocktailTableViewCell.swift
//  BarmenApp
//
//  Created by Mahmut Taha Cerit on 3.07.2022.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var coctailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var alcoholicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cocktailImageView.backgroundColor = .lightGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
