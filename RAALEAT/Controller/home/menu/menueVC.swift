//
//  menueVC.swift
//  RAALEAT
//
//  Created by Farido on 4/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class menueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.8666666667, green: 0.4235294118, blue: 0.1019607843, alpha: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.tintColor = .white
    }
}
