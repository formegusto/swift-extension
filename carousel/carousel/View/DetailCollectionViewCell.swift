//
//  DetailCollectionViewCell.swift
//  carousel
//
//  Created by formegusto on 2022/02/15.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    var number: Int = 0
    @IBOutlet weak var textLabel: UILabel!
    
    func loadCell() {
        self.backgroundColor = .gray
        textLabel.text = number.description
    }

}
