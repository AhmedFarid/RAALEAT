//
//  cartCell.swift
//  RAALEAT
//
//  Created by Farido on 4/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class cartCell: UITableViewCell {

    @IBOutlet weak var mellImag: UIImageView!
    @IBOutlet weak var mellName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var totolPrice: UILabel!
    @IBOutlet weak var qnt: UILabel!
    @IBOutlet weak var delletBTN: UIButton!
    
    
    var add: (()->())?
    var delete: (()->())?
    var min: (()->())?
    
    
    func configuerCell(prodect: cart) {
        
        mellName.text = prodect.mealName
        price.text = "Price: \(prodect.mealPrice)"
        totolPrice.text = "Total: \(prodect.totalPrice)"
        qnt.text = prodect.qty
        mellImag.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.mealImage)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        mellImag.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            mellImag.kf.setImage(with: url)
        
        }
    }

    @IBAction func deletes(_ sender: Any) {
        delete?()
    }
    @IBAction func add(_ sender: Any) {
        add?()
    }
    @IBAction func main(_ sender: Any) {
        min?()
    }
}
