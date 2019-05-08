//
//  myordersCell.swift
//  RAALEAT
//
//  Created by Farido on 5/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myordersCell: UITableViewCell {

    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var typeShift: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
     func configuerCell(prodect: myOrders) {
        self.orderId.text = "Order ID: \(prodect.orderId)"
        self.amount.text = "meals Price: \(prodect.amount)"
        self.totalPrice.text = "total price: \(prodect.totalPrice)"
        self.date.text = "date: \(prodect.date)"
        self.time.text = "tiem: \(prodect.time)"
        self.typeShift.text = "type shift: \(prodect.typeShift)"
        self.status.text = "status: \(prodect.status)"
    }
}
