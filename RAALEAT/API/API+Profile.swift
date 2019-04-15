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

}
