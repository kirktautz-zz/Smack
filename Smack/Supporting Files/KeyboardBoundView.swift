//
//  KeyboardBoundView.swift
//  Smack
//
//  Created by Kirk Tautz on 11/11/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notif: Notification) {
        let duration = notif.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notif.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notif.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notif.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }) { (true) in
            self.layoutIfNeeded()
        }
    }
}
