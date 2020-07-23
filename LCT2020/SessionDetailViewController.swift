//
//  SessionDetailViewController.swift
//  LCT2020
//
//  Created by My Apps on 19/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class SessionDetailViewController: UIViewController {

     var sessionResult: SessionSearchResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var coachLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var sessionNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    
    @IBAction func payButtonTapped(_ sender: Any) {
        payButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.payButton.backgroundColor = UIColor.init(named: "pale grey")
            self.payButton.setTitle("PAID", for: .disabled)
            self.payButton.setTitleColor(UIColor.init(named: "green"), for: .disabled)
        }
    }
    
    func updateUI() {
        addressLabel.text = sessionResult.address
        sessionNameLabel.text = sessionResult.sessionName
        timeLabel.text = sessionResult.time
        dateLabel.text = sessionResult.date
        priceLabel.text = sessionResult.price
    }
   
}
