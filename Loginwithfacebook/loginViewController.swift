//
//  loginViewController.swift
//  Loginwithfacebook
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
class loginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginwithFacebook(_ sender: UIButton) {
       
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = AccessToken.current else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if  error == nil {
                    print("Login error: \(error!.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error!.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                
                // Present the main view
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"loginSuccess")
                self.present(vc!,animated: true,completion: nil)
                
            })
            
        }
        
        
        
    }
    
    
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        if emailTextField.text == nil || passwordTextField.text == nil{
          let alertController = UIAlertController(title: "Error", message: "Email and Passowrd is not empty", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController,animated: true,completion: nil)
        }
        
        else{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"loginSuccess")
                    self.present(vc!,animated: true,completion: nil)
                }
                else{
                    print("Login error: \(error!.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error!.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
       
    }
    

   
}
