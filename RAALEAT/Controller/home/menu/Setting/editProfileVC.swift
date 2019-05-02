//
//  editProfileVC.swift
//  RAALEAT
//
//  Created by Farido on 4/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class editProfileVC: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spiner.isHidden = true
        handleRefshProfile()
        tap()
        
    }
    
    func handleRefshProfile(){
        API_Profile.profile { (error: Error?, Success, statues, name, email, phone, address, errors) in
            
            if Success{
                if statues == true{
                    self.emailTF.text = email
                    self.nameTF.text = name
                    self.phone.text = phone
                    self.address.text = address
                }else {
                    self.showAlert(title: "Profile", message: errors ?? "")
                }
                
            }
            
        }
    }
    
    
    
    @IBAction func edit(_ sender: Any) {
        
        
        guard let email = emailTF.text, !email.isEmpty else {
            let messages = NSLocalizedString("enter your email", comment: "hhhh")
            let title = NSLocalizedString("update profile", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let name = nameTF.text, !name.isEmpty else {
            let messages = NSLocalizedString("enter your name", comment: "hhhh")
            let title = NSLocalizedString("update profile", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("update profile", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let addresss = address.text, !addresss.isEmpty else {
            let messages = NSLocalizedString("enter your address", comment: "hhhh")
            let title = NSLocalizedString("update profile", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        spiner.startAnimating()
        spiner.isHidden = false
        API_Profile.updateProfile(firstName: nameTF.text ?? "", email: emailTF.text ?? "", phone: phone.text ?? "", address: address.text ?? ""){ (erroe: Error?, Success,status ,data,errors)  in
            if Success {
                if status == true {
                    self.showAlert(title: "update profile", message: data ?? "")
                }else {
                    self.showAlert(title: "update profile", message: errors ?? "")
                }
            }else{
                self.showAlert(title: "update profile", message: errors ?? "")
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
        }
        
    }
    
    
    
    
}
