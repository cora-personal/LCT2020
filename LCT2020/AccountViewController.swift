//
//  AccountViewController.swift
//  LCT2020
//
//  Created by My Apps on 10/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    
    @IBOutlet weak var editAccountButton: UIButton!
    
    @IBOutlet weak var accountTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Account" //made that change in storybaord
        // Do any additional setup after loading the view.
    }

}


extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
            return 2
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SearchResultCell"
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            
        cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
        if indexPath.row == 0 {
            cell.textLabel!.text = "User Guide"
        } else if indexPath.row == 1 {
            cell.textLabel!.text = "Change Password"
        }
        return cell
       
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        if indexPath = 0 {
//        performSegue(withIdentifier: "ShowDetail", sender: indexPath)
//        }
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
            return indexPath
    }

}

