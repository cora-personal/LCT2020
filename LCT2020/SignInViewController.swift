//
//  ViewController.swift
//  LCT2020
//
//  Created by My Apps on 25/02/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func validateFields() -> Bool { // func validateFields() -> String
        let test = true
        return test
    }
    
    
    @IBAction func logInTapped(_ sender: Any) { //@IBAction func showAlert() {
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
        if validateFields() {
            print("Password Correct")
            
            //move to home screen
           // performSegue(withIdentifier: "SuccessfulLogIn", sender: self)
            
            present(mainTabController, animated: true, completion: nil)
            emailTextField.text = ""
            passwordTextField.text = ""
            
            
        } else {
            let alert = UIAlertController(title: "Password Incorrect",
                                          message: "Your password does not match your email",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Try again", style: .default,
                                       handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
    }

}

