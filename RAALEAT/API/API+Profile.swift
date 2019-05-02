//
//  API+Profile.swift
//  RAALEAT
//
//  Created by Farido on 4/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Profile: NSObject {
    class func profile(completion: @escaping (_ error: Error?, _ success: Bool, _ status: Bool?, _ name: String?, _ email: String?, _ phone: String?, _ address: String?, _ error: String?)->Void) {
        
        let url = URLs.authUser
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil,nil,nil,nil)
            return
        }
        
        print(url)
        
        let headers = [
            "Authorization": "Bearer \(user_token)"
        ]
        
        print(headers)
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(nil,false,false,nil,nil,nil,nil,nil)
                print(error)
                
            case .success(let value):
                let json = JSON(value)
                if let status = json["status"].bool {
                    if status == true{
                        let name = json["data"]["name"].string
                        let email = json["data"]["email"].string
                        let phone = json["data"]["phone"].string
                        let address = json["data"]["address"].string
                        print(name ?? "")
                        completion(nil,true,status,name,email,phone,address,nil)
                    }else {
                        let error = json["error"].string
                        completion(nil,false,status,nil,nil,nil,nil,error)
                    }
                }
                
            }
        }
    }
    
    class func updateProfile(firstName: String,email: String,phone: String, address: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ data: String?,_ errors: String?)->Void) {
        
        let url = URLs.authUpdateProfile
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil)
            return
        }
        
        print(url)
        let parameters = [
            "firstName": firstName,
            "lastName": "",
            "email": email,
            "phone": phone,
            "address": address
            ] as [String : Any]
        
        let headers = [
            "Authorization": "Bearer \(user_token)"
        ]
        
        print(headers)
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false, nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let status = json["status"].bool {
                    if status == true{
                        let data = json["data"]["message"].string
                        print(data ?? "no")
                        completion(nil, true,status,data,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,status,errors,errors)
                    }
                }
                
            }
        }
    }
    
    class func changePassword(old_password: String,new_password: String,confirm_password: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ data: String?,_ errors: String?)->Void) {
        
        let url = URLs.authUpdatePassword
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil)
            return
        }
        
        print(url)
        let parameters = [
            "old_password": old_password,
            "new_password": new_password,
            "confirm_password": confirm_password
            ] as [String : Any]
        
        let headers = [
            "Authorization": "Bearer \(user_token)"
        ]
        
        print(headers)
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false, nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let status = json["status"].bool {
                    if status == true{
                        let data = json["data"].string
                        print(data ?? "no")
                        completion(nil, true,status,data,nil)
                    }else {
                        let errors = json["data"].string
                        print(errors ?? "no")
                        completion(nil, false,status,errors,errors)
                    }
                }
                
            }
        }
    }
}
