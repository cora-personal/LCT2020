//
//  SessionsViewController.swift
//  LCT2020
//
//  Created by My Apps on 10/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import Foundation
import UIKit

class SessionViewController: UIViewController {
    
   var sessionResults = [SessionResult]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    struct TableView {
        struct CellIdentifiers {
            static let sessionResultCell = "SessionResultCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // title = "Book Now" //this needs to be the same as the tab bar or the tab bar  switches about //so went with storyboard
        //title = "Tennis Sessions"
        
        tableView.contentInset = UIEdgeInsets(top: 66, left: 0,
                                              bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: TableView.CellIdentifiers.sessionResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
            TableView.CellIdentifiers.sessionResultCell)
        
        let result1 = SessionResult()
            result1.sessionName = "LCT Extreme"
            result1.time = "12:00 - 13:00"
            result1.date = "Sun, 01 Mar 2020"
            result1.price = "£ 6.50"
            result1.address = "Sefton Park Liverpool, Lancashire, L17 1AP"
            sessionResults.append(result1)
            
        let result2 = SessionResult()
            result2.sessionName = "Mersey Bowmen Tennis Session"
            result2.time = "17:00 - 18.30"
            result2.date = "Sat, 29 Feb 2020"
            result2.price = "£ 6.50"
            result2.address = "Mersey Bowmen LTC, Liverpool, L17 1AP"
            sessionResults.append(result2)
        
        let result3 = SessionResult()
            result3.sessionName = "Mersey Bowmen Tennis Session"
            result3.time = "17:00 - 18.30"
            result3.date = "Sat, 29 Feb 2020"
            result3.price = "£ 6.50"
            result3.address = "Mersey Bowmen LTC, Liverpool, L17 1AP"
            sessionResults.append(result3)
        
        let result4 = SessionResult()
            result4.sessionName = "Mersey Bowmen Tennis Session"
            result4.time = "17:00 - 18.30"
            result4.date = "Sun, 08 Mar 2020"
            result4.price = "£ 6.50"
            result4.address = "Mersey Bowmen LTC, Liverpool, L17 1AP"
            sessionResults.append(result4)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSession" {
            let sessionDetailViewController = segue.destination as! SessionDetailViewController
             let indexPath = sender as! IndexPath
            let sessionResult = sessionResults[indexPath.row]
            sessionDetailViewController.sessionResult = sessionResult
        }
    }
    
}


extension SessionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return 4 //sessionResults.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.sessionResultCell, for: indexPath) as! SessionResultCell
        
        //corect
        let sessionResult = sessionResults[indexPath.row]

        cell.sessionNameLabel.text = sessionResult.sessionName
        cell.timeLabel.text = sessionResult.time
        cell.dateLabel.text = sessionResult.date
        cell.priceLabel.text = sessionResult.price
        cell.addressLabel.text = sessionResult.address
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "ShowSession", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
    return indexPath
        }
}














