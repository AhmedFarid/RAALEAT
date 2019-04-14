//
//  searchCell.swift
//  RAALEAT
//
//  Created by Farido on 4/11/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class searchCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var cosmos: CosmosView!
    
    func configuerCell(prodect: searchs) {
        self.name.text = prodect.name
        self.cosmos.rating = Double(prodect.rating) ?? 0
        cosmos.settings.updateOnTouch = false
        
        images.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.logo)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
        }
    }
}
