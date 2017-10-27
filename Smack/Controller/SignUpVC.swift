//
//  SignUpVC.swift
//  Smack
//
//  Created by Kirk Tautz on 10/26/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closeBtnPresseD(sender: UIButton) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
}
