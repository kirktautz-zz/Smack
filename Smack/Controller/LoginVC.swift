//
//  LoginVC.swift
//  Smack
//
//  Created by Kirk Tautz on 10/26/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func dismissLogin(sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func signUpPressed(sender: UIButton) {
        performSegue(withIdentifier: TO_SIGN_UP, sender: nil)
    }
    @IBAction func loginPressed(_ sender: RoundedButton) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let username = usernameField.text, usernameField.text != "" else { return }
        guard let password = passwordField.text, passwordField.text != "" else { return }
        
        AuthService.instance.loginUser(email: username, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                        self.dismiss(animated: true)
                    }
                })
            }
        }
    }
    
    func setupView() {
        usernameField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        
        spinner.isHidden = true
    }
    
}
