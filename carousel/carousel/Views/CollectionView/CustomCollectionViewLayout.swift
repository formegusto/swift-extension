//
//  CustomCollectionViewLayout.swift
//  carousel
//
//  Created by formegusto on 2022/01/28.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        self.itemSize = CGSize(width: screenWidth / 2, height: screenWidth / 2)
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
