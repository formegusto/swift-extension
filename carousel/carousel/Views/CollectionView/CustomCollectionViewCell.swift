//
//  CustomCollectionViewCell.swift
//  carousel
//
//  Created by formegusto on 2022/01/28.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        let vw = UIScreen.main.bounds.width
        
        
        self.widthAnchor.constraint(equalToConstant: vw / 2 - 5).isActive = true
        self.heightAnchor.constraint(equalToConstant: vw / 2 - 5).isActive = true
        
        
        self.backgroundColor = .gray
    }
}
