//
//  AccountViewController.swift
//  LCT2020
//
//  Created by My Apps on 10/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var editAccountButton: UIButton!
    @IBOutlet weak var accountTableView: UITableView!
    @IBAction func signOuthandler(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editAccountbutton(_ sender: Any) {
         performSegue(withIdentifier: "EditAccount", sender: sender)
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
       if indexPath.row == 0 {
            let linkURL = "https://www.youtube.com/"
            if let url = NSURL(string: linkURL) {
                UIApplication.shared.openURL(url as URL)
            }
       } else if indexPath.row == 1 {
         performSegue(withIdentifier: "ChangePassword", sender: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
            return indexPath
    }
}

