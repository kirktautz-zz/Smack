//
//  SignUpVC.swift
//  Smack
//
//  Created by Kirk Tautz on 10/26/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        activityIndicator.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDataService.instance.avatarName != "" {
            profileImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
        
        if avatarName.contains("light") && bgColor == nil {
            profileImage.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func closeBtnPresseD(sender: UIButton) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        guard let email = emailField.text, emailField.text != "" else { return }
        guard let pass = passwordField.text, passwordField.text != "" else { return }
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("Created account successfully")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        guard let name = self.usernameField.text, self.usernameField.text != "" else { return }
                        guard let email = self.emailField.text, self.emailField.text != "" else { return }
                        
                AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.activityIndicator.isHidden = true
                                self.activityIndicator.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBtnPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        UIView.animate(withDuration: 0.2) {
            self.bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        self.profileImage.backgroundColor = bgColor
    }
    
    func setupView() {
        usernameField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        emailField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
