//
//  waletHomeVC.swift
//  RAALEAT
//
//  Created by Farido on 5/2/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class waletHomeVC: UIViewController {

    @IBOutlet weak var myWalet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        handleRefshWallet()
    }
    func handleRefshWallet(){
        API_Wallet.myWallet { (error: Error?, Success, statues, amount, errors) in
            
            if Success{
                if statues == true{
                    self.myWalet.text = "RAALEAT COINS\n\(amount ?? "")"
                }else {
                    self.showAlert(title: "Profile", message: errors ?? "")
                }
            }
        }
    }
}
