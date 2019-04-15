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

class cart: NSObject {
    
    var cartId: Int
    var mealName: String
    var mealPrice: String
    var mealImage: String
    var qty: String
    var totalPrice: Double
    
    
    init?(dict: [String: JSON]){
        
        guard let cartId = dict["cartId"]?.int,let mealName = dict["mealName"]?.string,let mealPrice = dict["mealPrice"]?.string,let mealImage = dict["mealImage"]?.string,let qty = dict["qty"]?.string,let totalPrice = dict["totalPrice"]?.double else {return nil}
        self.cartId = cartId
        self.mealName = mealName
        self.mealPrice = mealPrice
        self.mealImage = mealImage
        self.qty = qty
        self.totalPrice = totalPrice
        
    }
}

