//
//  RecipeSearchResultCell.swift
//  LCT2020
//
//  Created by My Apps on 15/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class RecipeSearchResultCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

}
