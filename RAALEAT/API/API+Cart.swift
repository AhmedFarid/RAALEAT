//
//  API+Cart.swift
//  RAALEAT
//
//  Created by Farido on 4/14/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class API_Cart: NSObject {
    class func addCart(menu_details_id: Int,qty: Int, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ data: String?,_ errors: String?)->Void) {
        
        let url = URLs.addCart
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil)
            return
        }
        
        print(url)
        let parameters = [
            "menu_details_id": menu_details_id,
            "qty": qty
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
    
    
    class func showCart (completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [cart]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil, nil,nil,nil)
            return
        }
        
        let url = URLs.authMyCart
        
        let parameters = [
            "lang" : lang
            ] as [String : Any]
        
        let headers = [
            "Authorization": "Bearer \(user_token)"
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                if let status = json["status"].bool {
                    if status == true{
                        guard let dataArray = json["data"].array else{
                            completion(nil, status ,nil,nil)
                            return
                        }
                        
                        print(dataArray)
                        var products = [cart]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = cart.init(dict: data){
                                products.append(prodect)
                            }
                        }
                        completion(nil, status, nil, products)
                        
                        
                    }else {
                        let data = json["error"].string
                        print(data ?? "no")
                        completion(nil, status,data,nil)
                    }
                }
                
            }
        }
    }
    
}
