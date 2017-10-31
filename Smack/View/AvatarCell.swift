//
//  AvatarCell.swift
//  Smack
//
//  Created by Kirk Tautz on 10/31/17.
//  Copyright © 2017 Kirk Tautz. All rights reserved.
//

import UIKit

enum AvatarType {
    case light, dark
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func setupCell(index: Int, type: AvatarType) {
        if type == .dark {
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else if type == .light {
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
