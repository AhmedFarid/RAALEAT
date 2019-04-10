//
//  searchVC.swift
//  RAALEAT
//
//  Created by Farido on 4/9/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import RevealingSplashView

class searchVC: UIViewController {
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var food: UITextField!
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "logo-b")!, iconInitialSize: CGSize(width: 229, height: 216), backgroundImage: UIImage(named: "Group 85")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftBarButon()
        
        revealingSplashView.useCustomIconColor = false
        revealingSplashView.iconColor = UIColor.red
        
        //Adds the revealing splash view as a sub view
        let window = UIApplication.shared.keyWindow
        window?.addSubview(revealingSplashView)
//        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.swingAndZoomOut
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
        
        tap()

        
    }
    
    func leftBarButon(){
        if helper.getAPIToken().access_token == nil{
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(back))
        }
        
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
}
