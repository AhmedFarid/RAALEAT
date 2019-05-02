//
//  API+Offers.swift
//  RAALEAT
//
//  Created by Farido on 4/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Offers: NSObject {
    
    class func offoers (completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [offers]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getOffersRestaurant
        
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
                        var products = [offers]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = offers.init(dict: data){
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
    
    class func offoersMenues (restaurantId: String, completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [offerMenues]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getOffers
        
        let parameters = [
            "lang" : lang,
            "restaurantId": restaurantId
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
                        var products = [offerMenues]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = offerMenues.init(dict: data){
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
