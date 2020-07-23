//
//  trialSignInViewController.swift
//  LCT2020
//
//  Created by My Apps on 23/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit
import WebKit

class TrialSignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let webView = WKWebView()
    
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.gmail.com")!
        let request = URLRequest(url: url)
        webView.frame = CGRect(x: 0, y: 200, width: 300, height: 300) //not required
        webView.load(request)
        view.addSubview(webView)//not required

    }

    @IBAction func onSignInTapped() {
        switch counter {
        case 0:
            //FirstName
            webView.evaluateJavaScript("document.getElementById('FirstName').value='\(emailTextField.text!)'",
                completionHandler: { (value, error) in
           // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML",
           //             completionHandler: { (value, error) in
                        print("EMAIL: \(value)")
                        print("ERROR \(error)")
            })
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        default : break
        }
        counter += 1
        
    }

}
