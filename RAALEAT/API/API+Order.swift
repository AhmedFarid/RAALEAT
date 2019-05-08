//
//  API+Order.swift
//  RAALEAT
//
//  Created by Farido on 5/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class API_Order: NSObject {

    class func Order(address: String,lat: Double,lng: Double,payment_type: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ data: Int?,_ errors: String?)->Void) {
        
        let url = URLs.authOrder
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil,false,false,nil,nil)
            return
        }
        
        print(url)
        let parameters = [
            "address": address,
            "lat": lat,
            "lng": lng,
            "payment_type": payment_type
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
                        let data = json["data"]["orderId"].int
                        print(data ?? "no")
                        completion(nil, true,status,data,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,status,nil,errors)
                    }
                }
                
            }
        }
    }
    
    class func myOrder (completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [myOrders]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.authMyOrders
        
        let parameters = [
            "lang" : lang
            ] as [String : Any]
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil, nil,nil,nil)
            return
        }
        
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
                        var products = [myOrders]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = myOrders.init(dict: data){
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
    
    class func myOrderDetail (order_id: Int,completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [myOrderDetails]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.authMyOrderDetails
        
        let parameters = [
            "order_id": order_id,
            "lang" : lang
            ] as [String : Any]
        
        guard let user_token = helper.getAPIToken().access_token else {
            completion(nil, nil,nil,nil)
            return
        }
        
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
                        var products = [myOrderDetails]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = myOrderDetails.init(dict: data){
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
