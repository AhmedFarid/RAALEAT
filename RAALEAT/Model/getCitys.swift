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
    var countRating: Int
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let phone = dict["phone"]?.string,let logo = dict["logo"]?.string,let image = dict["image"]?.string,let rating = dict["rating"]?.string,let countRating = dict["countRating"]?.int else {return nil}
        self.id = id
        self.name = name
        self.phone = phone
        self.logo = logo
        self.image = image
        self.rating = rating
        self.countRating = countRating
        
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
    var price: Int
    var image: String
    var descriptio: String
    var period: String
    
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let price = dict["price"]?.int,let image = dict["image"]?.string,let descriptio = dict["description"]?.string,let period = dict["period"]?.string else {return nil}
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        self.descriptio = descriptio
        self.period = period
        
    }
}

class cart: NSObject {
    
    var cartId: Int
    var mealName: String
    var mealPrice: String
    var mealImage: String
    var qty: String
    var totalPrice: Double
    var menuDetailsId: String
    
    
    init?(dict: [String: JSON]){
        
        guard let cartId = dict["cartId"]?.int,let mealName = dict["mealName"]?.string,let mealPrice = dict["mealPrice"]?.string,let mealImage = dict["mealImage"]?.string,let qty = dict["qty"]?.string,let totalPrice = dict["totalPrice"]?.double,let menuDetailsId = dict["menuDetailsId"]?.string else {return nil}
        self.cartId = cartId
        self.mealName = mealName
        self.mealPrice = mealPrice
        self.mealImage = mealImage
        self.qty = qty
        self.totalPrice = totalPrice
        self.menuDetailsId = menuDetailsId
        
    }
}

class offers: NSObject {
    
    var restaurantId: String
    var restaurantName: String
    var restaurantImage: String
    var restaurantLogo: String
    
    
    init?(dict: [String: JSON]){
        
        guard let restaurantId = dict["restaurantId"]?.string,let restaurantName = dict["restaurantName"]?.string,let restaurantImage = dict["restaurantImage"]?.string,let restaurantLogo = dict["restaurantLogo"]?.string else {return nil}
        
        self.restaurantId = restaurantId
        self.restaurantName = restaurantName
        self.restaurantImage = restaurantImage
        self.restaurantLogo = restaurantLogo
    }
}


class offerMenues: NSObject {
    
    var offerId: Int
    var menuDetailsId: String
    var menuDetailsName: String
    var originalPrice: Int
    var offerPrice: Int
    var fromDate: String
    var toDate: String
    var fromTime: String
    var toTime: String
    var menuDetailsImage: String
    
    
    init?(dict: [String: JSON]){
        
        guard let offerId = dict["offerId"]?.int,let menuDetailsId = dict["menuDetailsId"]?.string,let menuDetailsName = dict["menuDetailsName"]?.string,let originalPrice = dict["originalPrice"]?.int,let offerPrice = dict["offerPrice"]?.int,let fromDate = dict["fromDate"]?.string,let toDate = dict["toDate"]?.string,let fromTime = dict["fromTime"]?.string,let toTime = dict["toTime"]?.string,let menuDetailsImage = dict["menuDetailsImage"]?.string else {return nil}
        
        self.offerId = offerId
        self.menuDetailsId = menuDetailsId
        self.menuDetailsName = menuDetailsName
        self.originalPrice = originalPrice
        self.offerPrice = offerPrice
        self.fromDate = fromDate
        self.fromTime = fromTime
        self.toTime = toTime
        self.toDate = toDate
        self.menuDetailsImage = menuDetailsImage
    }
}

