//
//  offermenuCell.swift
//  RAALEAT
//
//  Created by Farido on 4/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class offermenuCell: UITableViewCell {

    @IBOutlet weak var names: UILabel!
    @IBOutlet weak var orginalPice: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    func configuerCell(prodect: offerMenues) {
        
        self.names.text = prodect.menuDetailsName
        self.orginalPice.text = "Original Price: \(prodect.originalPrice)"
        self.discountPrice.text = "Offer Price: \(prodect.offerPrice)"
        self.from.text = "from: \(prodect.fromDate):\(prodect.fromTime)"
        self.to.text = "to: \(prodect.toDate):\(prodect.toTime)"
        
        
        images.image = UIImage(named: "3")
        let s = prodect.menuDetailsImage
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
        }
    }
    
    
    
    

}
