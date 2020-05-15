//
//  RecipeViewController.swift
//  LCT2020
//
//  Created by My Apps on 10/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    var searchResults = [RecipeSearchResult]()
    var hasSearched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Recipe" //made this change in storyboard
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0,
                                              bottom: 0, right: 0)
        let cellNib = UINib(nibName: "RecipeSearchResultCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
            "RecipeSearchResultCell")
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

}

extension RecipesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchResults = []
        hasSearched = true
        
        if searchBar.text! != "Cat" { //was JB
            for i in 0...2 {
                let searchResult = RecipeSearchResult()
                searchResult.name = " \(String(format: "Fake Result %d for", i)) \(searchBar.text!)"
                searchResult.img = searchBar.text!
                searchResults.append(searchResult)
            }
        }
        tableView.reloadData()
    }
    //this doesnt blend the serach bar with the statue bar anymore with the search now with the nav controller
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 { //this is to display no results
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeSearchResultCell", for: indexPath)  as! RecipeSearchResultCell
        if searchResults.count == 0 {
            cell.nameLabel.text = "(Nothing found)"
        } else {
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
           // cell.artistnameLabel.text = searchResult.img
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
}
















class RecipeViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
