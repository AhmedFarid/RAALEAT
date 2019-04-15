//
//  settingVC.swift
//  RAALEAT
//
//  Created by Farido on 4/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class settingVC: UIViewController {

    @IBOutlet weak var acoutInfo: UIButton!
    @IBOutlet weak var imageAcountInfo: UIImageView!
    @IBOutlet weak var changePassword: UIButton!
    @IBOutlet weak var imageChangePasword: UIImageView!
    @IBOutlet weak var logoutBTN: UIButton!
    @IBOutlet weak var logoutImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard helper.getAPIToken().access_token != nil else {
            acoutInfo.isHidden = true
            imageAcountInfo.isHidden = true
            changePassword.isHidden = true
            imageChangePasword.isHidden = true
            logoutBTN.isHidden = true
            logoutImage.isHidden = true
            return
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        helper.dleteAPIToken()
    }
    
}
