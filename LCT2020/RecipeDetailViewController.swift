//
//  DetailViewController.swift
//  LCT2020
//
//  Created by My Apps on 17/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var searchResult: RecipeSearchResult!
    var downloadTask: URLSessionDownloadTask?
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var methodLinkButton: UIButton!
    
    @IBAction func methodLinkButton(_ sender: Any) {
        let linkURL = searchResult.recipeLink
            if let url = NSURL(string: linkURL) {
                UIApplication.shared.openURL(url as URL)
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        if searchResult != nil {
            updateUI()
        }
    }
    
    func updateUI() {
        
        nameLabel.text = searchResult.recipeName
        ingredientsTextView.text = searchResult.ingredients
        
        recipeImageView.image = UIImage(named: "Placeholder")
        if let thumbnailURL = URL(string: searchResult.thumbnail) {
            downloadTask = recipeImageView.loadImage(url: thumbnailURL)
        }
    }

}
