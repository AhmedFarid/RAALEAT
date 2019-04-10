//
//  API+AUTH.swift
//  RAALEAT
//
//  Created by Farido on 4/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class API_AUTH: NSObject {
    
    class func login(email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.login
        print(url)
        let parameters = [
            "remember_me": true,
            "email": email,
            "password": password
            ] as [String : Any]
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "X-Requested-With": "XMLHttpRequest"
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["access_token"].string, let token_type = json["token_type"].string, let expires_at = json["expires_at"].string  {
                    print("user token \(user_token)")
                    helper.saveAPIToken(access_token: user_token, token_type: token_type, expires_at: expires_at)
                    completion(nil, true , nil)
                }else {
                    let data = json["error"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }
    
    
    
    class func resetPassword(email: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.resetPassword
        print(url)
        let parameters = [
            "email": email
            ] as [String : Any]
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "X-Requested-With": "XMLHttpRequest"
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["access_token"].string, let token_type = json["token_type"].string, let expires_at = json["expires_at"].string  {
                    print("user token \(user_token)")
                    helper.saveAPIToken(access_token: user_token, token_type: token_type, expires_at: expires_at)
                    completion(nil, true , nil)
                }else {
                    let data = json["error"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }
    
    
    
    class func register(firstName: String,email: String, password: String,phone: String,address:String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ data: String?)->Void) {
        
        let url = URLs.register
        print(url)
        let parameters = [
            "firstName": firstName,
            "lastName": firstName,
            "email": email,
            "password": password,
            "phone": phone,
            "address": address
            ] as [String : Any]
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "X-Requested-With": "XMLHttpRequest"
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, false,nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let status = json["status"].bool {
                    if status == true{
                        if let data = json["data"].string{
                            completion(nil, true ,status, data)
                        }
                    }else {
                        let data = json["error"].string
                        print(data ?? "no")
                        completion(nil, true,status, data)
                    }
                }
                
            }
        }
        
    }
}



