//
//  offerscell.swift
//  RAALEAT
//
//  Created by Farido on 4/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class offerscell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var reate: CosmosView!
    

    func configuerCell(prodect: offers) {
        self.name.text = prodect.restaurantName
        self.reate.rating = 4.0
        reate.settings.updateOnTouch = false
        
        images.image = UIImage(named: "3")
        let s = prodect.restaurantLogo
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
        }
    }
}
