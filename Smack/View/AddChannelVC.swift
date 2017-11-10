//
//  AddChannelVC.swift
//  Smack
//
//  Created by Kirk Tautz on 11/9/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var channelField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func createChannelPressed(_ sender: RoundedButton) {
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap))
        bgView.addGestureRecognizer(closeTouch)
        
        nameField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
        channelField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
    }
    
    @objc func closeTap(gest: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
