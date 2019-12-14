//
//  LoginViewController.swift
//  Twitter
//
//  Created by William Huynh on 10/28/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 25.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // check if if already logged in
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            
            // Segue to Home if already logged in
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }
        
    }
    
    // MARK: - Action
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        // Call Twitter API (LOGIN)
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            // Set user login to true
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // Segue to Home
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            
            // Error message in console if login failure
            print("Could not log in!")
            
        })
    }

}
