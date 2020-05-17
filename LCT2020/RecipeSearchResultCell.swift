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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

    // MARK:- Public Methods
    func configure(for result: RecipeSearchResult) {
    
        nameLabel.text = result.recipeName
        
        //this doesnt work - type orange into leftovers one comes with no title 
//        if result.recipeName == "" {
//            nameLabel.text = "Unknown"
//        } else {
//            nameLabel.text = result.recipeName
//        }
        
//        if result.artist.isEmpty {
//            artistNameLabel.text = "Unknown"
//        } else {
//            artistNameLabel.text = String(format: "%@ (%@)", result.artist, result.type)
        
        recipeImageView.image = UIImage(named: "Placeholder")
        if let thumbnailURL = URL(string: result.thumbnail) {
            downloadTask = recipeImageView.loadImage(url: thumbnailURL)
        }
        
//        print(result.thumbnail)
//        if  result.thumbnail == "" {
//            recipeImageView.image = UIImage(named: "Placeholder")
//        } else if let thumbnailURL = URL(string: result.thumbnail) {
//            downloadTask = recipeImageView.loadImage(url: thumbnailURL)
//        }
    }

}
