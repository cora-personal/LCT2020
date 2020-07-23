//  ViewController.swift
//  LCT2020

import UIKit
import WebKit

class SignInViewController: UIViewController {
    
    let passwordCorrect = true //need to change this to real verification
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   // let webView = WKWebView()
   // var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let url = URL(string: "https://auth.clubspark.uk/account/signin?ReturnUrl=%2fissue%2fwsfed%3fwa%3dwsignin1.0%26wtrealm%3dhttps%253a%252f%252fclubspark.lta.org.uk%252f%26wctx%3drm%253d0%2526id%253d0%2526ru%253d%25252fLydiaMountfordsCoaching%26wct%3d2020-05-23T16%253a16%253a15Z%26prealm%3dhttps%253a%252f%252fclubspark.lta.org.uk%252f%26proot%3dhttps%253a%252f%252fclubspark.lta.org.uk%252f%26paroot%3dhttps%253a%252f%252fclubspark.lta.org.uk%252fLydiaMountfordsCoaching%26source%3dLydiaMountfordsCoaching%26name%3dLydia%2bMountford%2bCoaching%26nologo%3d1&wa=wsignin1.0&wtrealm=https%3a%2f%2fclubspark.lta.org.uk%2f&wctx=rm%3d0%26id%3d0%26ru%3d%252fLydiaMountfordsCoaching&wct=2020-05-23T16%3a16%3a15Z&prealm=https%3a%2f%2fclubspark.lta.org.uk%2f&proot=https%3a%2f%2fclubspark.lta.org.uk%2f&paroot=https%3a%2f%2fclubspark.lta.org.uk%2fLydiaMountfordsCoaching&source=LydiaMountfordsCoaching&name=Lydia+Mountford+Coaching&nologo=1")!
      //register page url "https://clubspark.lta.org.uk/LydiaMountfordsCoaching/Account/SignUp?returnUrl=%2FLydiaMountfordsCoaching"
        
        //let request = URLRequest(url: url)
        // webView.frame = CGRect(x: 0, y: 0, width: 320, height: 600) //not required
        //  webView.load(request)
        // view.addSubview(webView)//not required
    }
    
    @IBAction func logInTapped(_ sender: Any) {
//        webView.evaluateJavaScript("document.getElementById('EmailAddress').value='\(emailTextField.text!)'",     completionHandler: nil)
//         webView.evaluateJavaScript("document.getElementById('Password').value='\(passwordTextField.text!)'", completionHandler: nil)
//         webView.evaluateJavaScript("document.getElementsByClassName('cs-btn primary lg')[0].click();", completionHandler: nil)
//
//         let url = URL(string: "https://clubspark.lta.org.uk/LydiaMountfordsCoaching/Coaching/Adult")!
//         let request = URLRequest(url: url)
//         webView.load(request)
        
//        webView.evaluateJavaScript("document.documentElement.innerHTML", completionHandler: { (innerHTML, error) in
//                do {
//                    let sessionResult = try SessionResponse(innerHTML)
//                    print("Got response")
//                } catch{}
//            })
        
            let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
            if passwordCorrect  {
                print("Password Correct")
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




