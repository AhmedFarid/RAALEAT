//
//  resetPasswordVC.swift
//  RAALEAT
//
//  Created by Farido on 4/10/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class resetPasswordVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func restBTN(_ sender: Any) {
        
        guard isValidEmail(testStr: emailTF.text ?? "") == true else {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let userName = emailTF.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        API_AUTH.resetPassword(email: emailTF.text ?? ""){ (error: Error?, success: Bool, data) in
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "reset Password", message: "\(data ?? "")")
                }
                //
            }else {
                self.showAlert(title: "reset Password", message: "\(data ?? "")")
            }
            
        }
      
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

