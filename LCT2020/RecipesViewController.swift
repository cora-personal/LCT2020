//
//  RecipeViewController.swift
//  LCT2020
//
//  Created by My Apps on 10/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Recipe" //made this change in storyboard
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0,
                                              bottom: 0, right: 0)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
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
