//
//  mellCell.swift
//  RAALEAT
//
//  Created by Farido on 4/11/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class mellCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    func configuerCell(prodect: meals) {
        self.name.text = prodect.name
        
        images.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
        }
    }
}
