//
//  CircleImage.swift
//  Smack
//
//  Created by Kirk Tautz on 11/1/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
