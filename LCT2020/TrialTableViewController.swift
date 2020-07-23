//
//  TrialTableViewController.swift
//  LCT2020
//
//  Created by My Apps on 23/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class TrialTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension TrialTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.detailTextLabel?.text =  ""
        cell.textLabel?.text = ""
        
        return cell
    }
}
