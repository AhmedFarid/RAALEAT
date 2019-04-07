//
//  ViewController.swift
//  RAALEAT
//
//  Created by Farido on 4/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var views: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }
    
    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }


}

