//
//  ViewController.swift
//  RAALEAT
//
//  Created by Farido on 4/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import RevealingSplashView

class loginVC: UIViewController {

    //@IBOutlet weak var views: UIView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
      let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "logo-b")!, iconInitialSize: CGSize(width: 229, height: 216), backgroundImage: UIImage(named: "Group 85")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spiner.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        revealingSplashView.useCustomIconColor = false
        revealingSplashView.iconColor = UIColor.red
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.swingAndZoomOut
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
        
        tap()
        
        
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    @IBAction func signinBTN(_ sender: Any) {
        guard let userName = emailTF.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = passwordTF.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        self.spiner.startAnimating()
        self.spiner.isHidden = false
        
        API_AUTH.login(email: userName, password: passwords) { (error: Error?, success: Bool, data) in
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
    
    
    @IBAction func gestBTN(_ sender: Any) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "searchResults", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "y")
//        self.present(newViewController, animated: true, completion: nil)
    }
    
    

}
