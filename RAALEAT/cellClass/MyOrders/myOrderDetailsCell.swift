//
//  myOrderDetailsCell.swift
//  RAALEAT
//
//  Created by Farido on 5/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myOrderDetailsCell: UITableViewCell {

   
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var qty: UILabel!
    
    func configuerCell(prodect: myOrderDetails) {
        self.mealName.text = "meal name \(prodect.mealName)"
        self.price.text = "price \(prodect.price)"
        self.totalPrice.text = "total price \(prodect.total)"
        self.qty.text = "quantity \(prodect.qty)"
        
    }
}

