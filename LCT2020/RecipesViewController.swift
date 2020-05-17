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
    
    struct TableView {
        struct CellIdentifiers {
            static let recipeSearchResultCell = "RecipeSearchResultCell"
            static let nothingFoundCell = "NothingFoundCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Recipe" //made this change in storyboard
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0,
                                              bottom: 0, right: 0)
        var cellNib = UINib(nibName: TableView.CellIdentifiers.recipeSearchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
            TableView.CellIdentifiers.recipeSearchResultCell)
        
        cellNib = UINib(nibName:
            TableView.CellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
        TableView.CellIdentifiers.nothingFoundCell)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Helper Methods
    func recipePuppyURL(searchText: String) -> URL {
        let searchText = searchText.replacingOccurrences(of: ",", with: "")
        let encodedText = searchText.addingPercentEncoding(
            withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlString = String(format:
            "http://www.recipepuppy.com/api/?q=%@", encodedText)
        let url = URL(string: urlString)
        return url!
    }
    
    func performRequest(with url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func parse(data: Data) -> [RecipeSearchResult] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResultArray.self, from:data)
            return result.results
        } catch {
            print("JSON Error: \(error)")
            return [] }
    }
}

extension RecipesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            hasSearched = true
            searchResults = []
            let url = recipePuppyURL(searchText: searchBar.text!)
            print("URL: '\(url)'")

            if let data = performRequest(with: url) {
                let results = parse(data: data)
                print("Got results: \(results)")
            }
            tableView.reloadData()
        }
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
       
        if searchResults.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.nothingFoundCell, for: indexPath)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.recipeSearchResultCell, for: indexPath) as! RecipeSearchResultCell
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.title
           // cell.artistNameLabel.text = searchResult.artistName
            return cell
        }
        
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
