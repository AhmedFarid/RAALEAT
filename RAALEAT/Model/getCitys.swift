//
//  getCitys.swift
//  RAALEAT
//
//  Created by Farido on 4/10/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class getCitys: NSObject {
    
    var id: String
    var name: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
        
    }
}
