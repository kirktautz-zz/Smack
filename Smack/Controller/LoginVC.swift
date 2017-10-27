//
//  LoginVC.swift
//  Smack
//
//  Created by Kirk Tautz on 10/26/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissLogin(sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func signUpPressed(sender: UIButton) {
        performSegue(withIdentifier: TO_SIGN_UP, sender: nil)
    }

}
