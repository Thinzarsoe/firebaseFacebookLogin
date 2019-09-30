//
//  registerViewController.swift
//  Loginwithfacebook
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
import FirebaseAuth
class registerViewController: UIViewController {

    @IBOutlet weak var nametextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        if emailTextField.text == nil
        {
            let alertController = UIAlertController(title: "Error", message:"Email and Password must be entered", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController,animated:true,completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user,error) in
               
                if error == nil{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
                    self.present(vc!,animated: true,completion: nil)
                }
                
                else{
                    let alertController = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController,animated:true,completion: nil)
                }
                
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
