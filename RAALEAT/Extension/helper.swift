//
//  helper.swift
//  RAALEAT
//
//  Created by Farido on 4/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class helper: NSObject {
    class func restartApp(){
        guard let window = UIApplication.shared.keyWindow else {return}
        
        var vc: UIViewController
        if getAPIToken().access_token == nil {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }else {
            let sb = UIStoryboard(name: "searchResults", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func dleteAPIToken() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "access_token")
        def.removeObject(forKey: "token_type")
        def.removeObject(forKey: "expires_at")
        def.synchronize()
        
        restartApp()
    }
    
    class func saveAPIToken(access_token: String,token_type: String,expires_at: String) {
        let def = UserDefaults.standard
        def.setValue(access_token, forKey: "access_token")
        def.setValue(token_type, forKey: "token_type")
        def.setValue(expires_at, forKey: "expires_at")
        def.synchronize()
        
        restartApp()
    }
    
    class func getAPIToken() -> (access_token: String?,token_type: String?, expires_at: String?) {
        let def = UserDefaults.standard
        return (def.object(forKey: "access_token") as? String,def.object(forKey: "token_type") as? String,def.object(forKey: "expires_at") as? String)
    }
}


