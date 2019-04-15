//
//  profileVC.swift
//  RAALEAT
//
//  Created by Farido on 4/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spiner.isHidden = true
        handleRefshProfile()
    }
    
    func handleRefshProfile(){
        spiner.startAnimating()
        spiner.isHidden = false
        API_Profile.profile { (error: Error?, Success, statues, name, email, phone, address, errors) in
            
            if Success{
                if statues == true{
                    self.email.text = "    \(email ?? "")"
                self.name.text = "    \(name ?? "")"
                self.phone.text = "    \(phone ?? "")"
                self.address.text = "    \(address ?? "")"
                }else {
                    self.showAlert(title: "Profile", message: errors ?? "")
                }
                self.spiner.stopAnimating()
                self.spiner.isHidden = true
            }
            
        }
    }
    
    
    
}
