//
//  ProfileVC.swift
//  Smack
//
//  Created by Kirk Tautz on 11/2/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userNAme: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closeModelPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true)
        
    }
    
    func setupView() {
        userNAme.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
