//
//  ChangePasswordViewController.swift
//  LCT2020
//
//  Created by My Apps on 20/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.oldPasswordTextField.text = ""
        self.newPasswordTextField.text = ""
        self.confirmPasswordTextField.text = ""

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        submitButton.isEnabled = false
       // if oldPasswordTextField.text !== ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.submitButton.backgroundColor = UIColor.init(named: "pale grey")
                    self.submitButton.setTitle("DONE", for: .disabled)
                    self.submitButton.setTitleColor(UIColor.init(named: "green"), for: .disabled)
                }
    }
            
}

extension ChangePasswordViewController : UITextFieldDelegate {
    
}
