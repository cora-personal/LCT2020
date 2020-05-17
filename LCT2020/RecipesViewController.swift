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
    var isLoading = false
    var dataTask: URLSessionDataTask?
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        searchBar.text = ""
        hasSearched = false
        tableView.reloadData()
        if segmentedControl.selectedSegmentIndex == 0 {
            searchBar.placeholder = "Search for a recipe by ‘name’"
        } else if segmentedControl.selectedSegmentIndex == 1 {
            searchBar.placeholder = "Search for a recipe by ‘leftover ingredients’"
        }
        
        
        performSearch()
    }
    
    struct TableView {
        struct CellIdentifiers {
            static let recipeSearchResultCell = "RecipeSearchResultCell"
            static let nothingFoundCell = "NothingFoundCell"
            static let loadingCell = "LoadingCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Recipe" //made this change in storyboard
        tableView.contentInset = UIEdgeInsets(top: 98, left: 0,
                                              bottom: 0, right: 0)
        var cellNib = UINib(nibName: TableView.CellIdentifiers.recipeSearchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
            TableView.CellIdentifiers.recipeSearchResultCell)
        
        cellNib = UINib(nibName:
            TableView.CellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
            TableView.CellIdentifiers.nothingFoundCell)
        
        cellNib = UINib(nibName: TableView.CellIdentifiers.loadingCell,
                        bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
            TableView.CellIdentifiers.loadingCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let recipeDetailViewController = segue.destination
                as! RecipeDetailViewController
            let indexPath = sender as! IndexPath
            let searchResult = searchResults[indexPath.row]
            recipeDetailViewController.searchResult = searchResult
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Helper Methods
    func recipePuppyURL(searchText: String, category: Int) -> URL {
        let kind: String
        switch category {
        case 0: kind = "q=" //query
        case 1: kind =  "i=" //ingredient
        default: kind = "q="
        }
        
        //let searchText = searchText.replacingOccurrences(of: " ", with: "")
        let encodedText = searchText.addingPercentEncoding(
            withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlString = String(format:
            "http://www.recipepuppy.com/api/?\(kind)%@", encodedText)
            // "http://www.recipepuppy.com/api/?q=%@&limit=200", encodedText) this is supposed to return more results but doesnt work
        print(urlString)
        let url = URL(string: urlString)
        
        return url!
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
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Whoops...",
                                      message: "There was an error accessing the Recipe database. Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: nil)
        present(alert, animated: true, completion: nil)
        alert.addAction(action)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        performSearch()
    }
    
}

extension RecipesViewController: UISearchBarDelegate {
    
    func performSearch() {
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            dataTask?.cancel()
            isLoading = true
            tableView.reloadData()
            hasSearched = true
            searchResults = []
            let url = recipePuppyURL(searchText: searchBar.text!, category: segmentedControl.selectedSegmentIndex)
            let session = URLSession.shared
            dataTask = session.dataTask(with: url,
                completionHandler: { data, response, error in
                    if let error = error as NSError?, error.code == -999 {
                        return  // Search was cancelled
                    } else if let httpResponse = response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 {
                        if let data = data {
                            self.searchResults = self.parse(data: data)
                            self.searchResults.sort(by: <)
                            DispatchQueue.main.async {
                                self.isLoading = false
                                self.tableView.reloadData()
                            }
                            return
                        }
                    } else {
                        print("Failure! \(response!)")
                    }
                    DispatchQueue.main.async {
                        self.hasSearched = false
                        self.isLoading = false
                        self.tableView.reloadData()
                        self.showNetworkError()
                    }
            })
            dataTask?.resume()
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
        if isLoading {
            return 1
        } else if !hasSearched {
            return 0
        } else if searchResults.count == 0 { //this is to display no results
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            let cell = tableView.dequeueReusableCell(withIdentifier:
                TableView.CellIdentifiers.loadingCell, for: indexPath)
            let spinner = cell.viewWithTag(100) as!
            UIActivityIndicatorView
            spinner.startAnimating()
            return cell
        } else if searchResults.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.nothingFoundCell, for: indexPath)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.recipeSearchResultCell, for: indexPath) as! RecipeSearchResultCell
            let searchResult = searchResults[indexPath.row]
            cell.configure(for: searchResult)
            return cell
            //cell.nameLabel.text = searchResult.recipeName //MOVED TO CELL
           // cell.artistNameLabel.text = searchResult.artistName
        }
        
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowDetail", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if searchResults.count == 0 || isLoading {    // Changed
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
