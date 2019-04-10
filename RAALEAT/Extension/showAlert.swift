//
//  showAlert.swift
//  RAALEAT
//
//  Created by Farido on 4/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit


extension UIViewController {
    func showAlert(title: String, message: String, okTitle: String = "Ok", okHandler: ((UIAlertAction)->Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func tap() {
    let tapRecognizer = UITapGestureRecognizer()
    tapRecognizer.addTarget(self, action: #selector(self.didTapView))
    self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func didTapView(){
        self.view.endEditing(true)
    }
    
}
