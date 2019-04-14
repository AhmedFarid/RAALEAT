//
//  API+Home.swift
//  RAALEAT
//
//  Created by Farido on 4/10/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Home: NSObject {
    
    class func myorder (completion: @escaping (_ error: Error?,_ sparParts: [getCitys]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getCity
        
        let parameters = [
            "lang" : lang
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [getCitys]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = getCitys.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func getState (city_id: String, completion: @escaping (_ error: Error?,_ sparParts: [getStates]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getState
        
        let parameters = [
            "lang" : lang,
            "city_id": city_id
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [getStates]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = getStates.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func getType (completion: @escaping (_ error: Error?,_ sparParts: [getTypes]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getType
        
        let parameters = [
            "lang" : lang
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [getTypes]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = getTypes.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func search (city_id: Int,type_id: Int,state_id: Int,completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [searchs]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.search
        
        let parameters = [
            "lang" : lang,
            "state_id": state_id,
            "type_id": type_id,
            "city_id": city_id
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
                        var products = [searchs]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = searchs.init(dict: data){
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
    
    class func meanMenue (restaurant_id: Int,completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [mainMnue]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getMenu
        
        let parameters = [
            "lang" : lang,
            "restaurant_id": restaurant_id
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
                        var products = [mainMnue]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = mainMnue.init(dict: data){
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
    
    class func getMenuDetails (menu_id: Int,completion: @escaping (_ error: Error?, _ status: Bool?,_ data: String?,_ sparParts: [meals]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let url = URLs.getMenuDetails
        
        let parameters = [
            "lang" : lang,
            "menu_id": menu_id
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
                        var products = [meals]()
                        for data in dataArray {
                            if let data = data.dictionary, let prodect = meals.init(dict: data){
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
