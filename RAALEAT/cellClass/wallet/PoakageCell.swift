//
//  PoakageCell.swift
//  RAALEAT
//
//  Created by Farido on 5/2/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class PoakageCell: UICollectionViewCell {
    
    @IBOutlet weak var waltes: UILabel!
    
    var buy: (()->())?
    
    func configuerCell(prodect: waltePakages) {
        self.waltes.text = "\(prodect.name)\nPointes:\(prodect.point)\nPrice:\(prodect.price)"
    }
    
    @IBAction func buys(_ sender: Any) {
        buy?()
    }
    
}
