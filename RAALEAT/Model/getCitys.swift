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
    
    var id: Int
    var name: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
        
    }
}


class getStates: NSObject {
    
    var id: Int
    var name: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
        
    }
}

class getTypes: NSObject {
    
    var id: Int
    var name: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
        
    }
}


class searchs: NSObject {
    
    var id: Int
    var name: String
    var phone: String
    var logo: String
    var image: String
    var rating: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let phone = dict["phone"]?.string,let logo = dict["logo"]?.string,let image = dict["image"]?.string,let rating = dict["rating"]?.string else {return nil}
        self.id = id
        self.name = name
        self.phone = phone
        self.logo = logo
        self.image = image
        self.rating = rating
        
    }
}

class mainMnue: NSObject {
    
    var id: Int
    var name: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
        
    }
}


class meals: NSObject {
    
    var id: Int
    var name: String
    var price: String
    var image: String
    
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let price = dict["price"]?.string,let image = dict["image"]?.string else {return nil}
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        
    }
}

