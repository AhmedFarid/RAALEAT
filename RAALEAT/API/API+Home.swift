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
                guard let dataArray = json["message"].array else{
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
    
    

}
