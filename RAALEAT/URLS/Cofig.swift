//
//  Cofig.swift
//  RAALEAT
//
//  Created by Farido on 4/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import Foundation


struct URLs {
    
    static let main = "http://raaleat.com/site/public/api/"
    static let mainImage = ""
    
    
    static let login = main + "login"
    static let register = main + "register"
    static let resetPassword = main + "resetPassword"
    static let getCity = main + "getCity"
    static let getState = main + "getState"
    static let getType = main + "getType"
    static let search = main + "search"
    static let getMenu = main + "getMenu"
    static let getMenuDetails = main + "getMenuDetails"
    static let addCart = main + "auth/addCart"
    static let plusCart = main + "plusCart"
    static let minCart = main + "minCart"
    static let authUser = main + "auth/user"
    static let authMyCart = main + "auth/myCart"
    static let authPlusCart = main + "auth/plusCart"
    static let authMinCart = main + "auth/minCart"
    static let authUpdateProfile = main + "auth/updateProfile"
    static let authUpdatePassword = main + "auth/updatePassword"
    static let getOffersRestaurant = main + "getOffersRestaurant"
    static let getOffers = main + "getOffers"
    static let authDeleteCart = main + "auth/deleteCart"
    static let authMyWallets = main + "auth/myWallets"
    static let getPackage = main + "getPackage"
    static let chargingWallets = main + "auth/chargingWallets"
    static let authOrder = main + "auth/order"
    static let authMyOrders = main + "auth/myOrders"
    static let authMyOrderDetails = main + "auth/myOrderDetails"
}
