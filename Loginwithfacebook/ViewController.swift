//
//  ViewController.swift
//  Loginwithfacebook
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    
    @IBAction func loginBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    
    @IBAction func registerBtn(_ sender: UIButton) {
         performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 10
        register.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
    }


}

