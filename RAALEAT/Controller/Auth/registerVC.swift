//
//  registerregisterVC.swift
//  RAALEAT
//
//  Created by Farido on 4/9/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import FlagPhoneNumber

class registerVC: UIViewController {
    
    
    var isValid: Bool?
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var fristNameTF: UITextField!
    @IBOutlet weak var phoneTF: FPNTextField!
    @IBOutlet weak var locTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        spiner.isHidden = true
        phoneTF.delegate = self
        fristNameTF.delegate = self
        phoneTF.setCountries(including: [.SA])
        tap()
        
    }
    
    
    
    
    @IBAction func registerBTN(_ sender: Any) {
        guard let userName = emailTF.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard passwordTF.text?.count ?? 0 >= 8 else {
            let messages = NSLocalizedString("password at least 8", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard isValidInput(Input: fristNameTF.text!) == true else {
            self.showAlert(title: "register", message: "Full name not correct")
            return
        }
        
        guard isValid == true else {
            let messages = NSLocalizedString("your phone is wrong", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = passwordTF.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let fristName = fristNameTF.text, !fristName.isEmpty else {
            let messages = NSLocalizedString("enter your full name", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phone = phoneTF.text, !phone.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let loc = locTF.text, !loc.isEmpty else {
            let messages = NSLocalizedString("enter your location", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard isValidEmail(testStr: emailTF.text ?? "") == true else {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        let phoneWithoutSpace = phone.replacingOccurrences(of: " ", with: "")
        
        
        self.spiner.startAnimating()
        self.spiner.isHidden = false
        
        API_AUTH.register(firstName: fristNameTF.text ?? "", email: emailTF.text ?? "", password: passwordTF.text ?? "", phone: phoneWithoutSpace, address: locTF.text ?? ""){ (error: Error?, success: Bool, data)  in
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                }
                //
            }else {
                self.showAlert(title: "Login Filed", message: "\(data ?? "")")
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
            
        }
    }


func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidInput(Input:String) -> Bool {
    let myCharSet=CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
    let isValid: Bool = (Input == output)
    print("\(isValid)")
    
    return isValid
}



}

extension registerVC: FPNTextFieldDelegate {
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        phoneTF.rightViewMode = .always
        print(
            isValid,
            
            textField.getFormattedPhoneNumber(format: .E164) ?? "",
            textField.getFormattedPhoneNumber(format: .International) ?? "",
            textField.getFormattedPhoneNumber(format: .National) ?? "",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "",
            textField.getRawPhoneNumber() ?? ""
        )
        
        self.isValid = isValid
    }
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }
}
extension registerVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            if string.rangeOfCharacter(from: .letters) != nil || string == " " || string == ""{
                return true
            }else {
                showAlert(title: "register", message: "Enter alphabet not numbers")
                return false
            }
        }else {
            return true
        }
    }
}
