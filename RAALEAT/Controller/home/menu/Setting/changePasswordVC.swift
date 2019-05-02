//
//  changePasswordVC.swift
//  RAALEAT
//
//  Created by Farido on 4/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class changePasswordVC: UIViewController {

    
    @IBOutlet weak var oldPasswordTF: UITextField!
    @IBOutlet weak var newPaswword: UITextField!
    @IBOutlet weak var comfirmPassword: UITextField!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spiner.isHidden = true
        //tap()
    }
    

    
    @IBAction func chnagePassword(_ sender: Any) {
        
        guard let userName = oldPasswordTF.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your old password", comment: "hhhh")
            let title = NSLocalizedString("change Password", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let newPasswords = newPaswword.text, !newPasswords.isEmpty else {
            let messages = NSLocalizedString("enter your new password", comment: "hhhh")
            let title = NSLocalizedString("change Password", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let comfirmPasswords = comfirmPassword.text, !comfirmPasswords.isEmpty else {
            let messages = NSLocalizedString("enter your comfirm password", comment: "hhhh")
            let title = NSLocalizedString("change Password", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard newPaswword.text == comfirmPassword.text else {
            let messages = NSLocalizedString("The new password and confirm password must match", comment: "hhhh")
            let title = NSLocalizedString("change Password", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard newPaswword.text?.count ?? 0 >= 8 else {
            let messages = NSLocalizedString("password at least 8", comment: "hhhh")
            let title = NSLocalizedString("change Password", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        spiner.startAnimating()
        spiner.isHidden = false
        API_Profile.changePassword(old_password: oldPasswordTF.text ?? "", new_password: newPaswword.text ?? "", confirm_password: comfirmPassword.text ?? ""){ (erroe: Error?, Success,status ,data,errors)  in
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
