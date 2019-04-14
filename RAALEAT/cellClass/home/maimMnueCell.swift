//
//  maimMnueCell.swift
//  RAALEAT
//
//  Created by Farido on 4/11/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class maimMnueCell: UICollectionViewCell {
    @IBOutlet weak var catgoury: UILabel!
    
    override func awakeFromNib() {
        catgoury.alpha = 0.6
    }
    
    func configuerCell(prodect: mainMnue) {
        self.catgoury.text = prodect.name
        }
    
    override var isSelected: Bool{
        didSet{
            catgoury.alpha =  isSelected ? 1.0 : 0.6
        }
    }
}
