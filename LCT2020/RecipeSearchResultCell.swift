//
//  RecipeSearchResultCell.swift
//  LCT2020
//
//  Created by My Apps on 15/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class RecipeSearchResultCell: UITableViewCell {
    
    var downloadTask: URLSessionDownloadTask?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

    // MARK:- Public Methods
    func configure(for result: RecipeSearchResult) {
    
        nameLabel.text = result.recipeName
        
        recipeImageView.image = UIImage(named: "Placeholder")
        if let thumbnailURL = URL(string: result.thumbnail) {
            downloadTask = recipeImageView.loadImage(url: thumbnailURL)
        }
    }

}
