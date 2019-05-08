//
//  API+Wallet.swift
//  RAALEAT
//
//  Created by Farido on 5/2/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Wallet: NSObject {
    
    class func myWallet(completion: @escaping (_ error: Error?, _ success: Bool, _ status: Bool?, _ amount: String?, _ error: String?)->Void) {
        
        let url = URLs.authMyWallets
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil)
            return
        }
        
        print(url)
        
        let headers = [
            "Authorization": "Bearer \(user_token)"
        ]
        
        print(headers)
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(nil,false,false,nil,nil)
                print(error)
                
            case .success(let value):
                let json = JSON(value)
                if let status = json["status"].bool {
                    if status == true{
                        let amount = json["data"]["amount"].string
                        print(amount ?? "")
                        completion(nil,true,status,amount,nil)
                    }else {
                        let error = json["error"].string
                        completion(nil,false,status,nil,error)
                    }
                }
                
            }
        }
    }
    
    class func watePackage (completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [waltePakages]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getPackage
        
        let parameters = [
            "lang" : lang
            ] as [String : Any]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
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
                        var products = [waltePakages]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = waltePakages.init(dict: data){
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
    
    class func charge(packageID: Int,completion: @escaping (_ error: Error?, _ success: Bool, _ status: Bool?, _ amount: String?, _ error: String?)->Void) {
        
        let url = URLs.chargingWallets
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil)
            return
        }
        
        print(url)
        
        let headers = [
            "Authorization": "Bearer \(user_token)"
        ]
        
        let parameters = [
            "package_id": packageID
        ]
        
        print(headers)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(nil,false,false,nil,nil)
                print(error)
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let status = json["status"].bool {
                    if status == true{
                        let amount = json["data"].string
                        print(amount ?? "")
                        completion(nil,true,status,amount,nil)
                    }else {
                        let error = json["error"].string
                        completion(nil,false,status,nil,error)
                    }
                }
                
            }
        }
    }
}
