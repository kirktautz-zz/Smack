//
//  ChannelVC.swift
//  Smack
//
//  Created by Kirk Tautz on 10/26/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
    }
    
    // Actions
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    

}
