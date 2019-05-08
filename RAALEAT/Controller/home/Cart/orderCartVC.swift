//
//  orderCartVC.swift
//  RAALEAT
//
//  Created by Farido on 5/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import MapKit

class orderCartVC: UIViewController {
    
    var isValid: Bool?

    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var cachSwitch: UISwitch!
    @IBOutlet weak var walletSwitch: UISwitch!
    @IBOutlet weak var cridtSwitch: UISwitch!
    
    var userLat = 0.0
    var userLng = 0.0
    
    let locationManager = CLLocationManager()
    var paymentType = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tap()
        spiner.isHidden = true
     }
    
    
    func getUserLocation(){
        //self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        let lon: Double = Double("\(pdblLongitude)")!
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    print("xxxxxx\(pm.country ?? ""),\(pm.locality ?? ""),\(pm.subLocality ?? ""),\(pm.thoroughfare ?? ""),\(pm.postalCode ?? ""),\(pm.subThoroughfare ?? "")")
                    self.address.text = ("\(pm.subThoroughfare ?? ""),\(pm.thoroughfare ?? ""),\(pm.subLocality ?? ""),\(pm.locality ?? ""),\(pm.country ?? "")")
                }
        })
        
    }
    
    
    @IBAction func cachActionSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.paymentType = "cash "
            cachSwitch.isOn = true
            walletSwitch.isOn = false
            cridtSwitch.isOn = false
        }
        else{
            self.paymentType = ""
            cachSwitch.isOn = false
            walletSwitch.isOn = false
            cridtSwitch.isOn = false
        }
    }
    @IBAction func walletActionSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.paymentType = "wallet"
            cachSwitch.isOn = false
            walletSwitch.isOn = true
            cridtSwitch.isOn = false
        }
        else{
            self.paymentType = ""
            cachSwitch.isOn = false
            walletSwitch.isOn = false
            cridtSwitch.isOn = false
        }
    }
    
    @IBAction func creditActionSwatch(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.paymentType = "cart"
            cachSwitch.isOn = false
            walletSwitch.isOn = false
            cridtSwitch.isOn = true
        }
        else{
            self.paymentType = ""
            cachSwitch.isOn = false
            walletSwitch.isOn = false
            cridtSwitch.isOn = false
        }
    }
    
    @IBAction func orderBtn(_ sender: Any) {
        if paymentType == "" {
            showAlert(title: "order", message: "choose payment method")
        }else {
            spiner.startAnimating()
            spiner.isHidden = false
            API_Order.Order(address: address.text ?? "", lat: userLat, lng: userLng, payment_type: paymentType) { (erroe: Error?, Success,status ,data,errors)  in
                if Success {
                    if status == true {
                        self.showAlert(title: "order", message: "Your order Id is: \(data ?? 0)")
                    }else {
                        self.showAlert(title: "order", message: errors ?? "")
                    }
                }else{
                    self.showAlert(title: "order", message: errors ?? "")
                }
                self.spiner.stopAnimating()
                self.spiner.isHidden = true
                
            }
        }
    }
    
    @IBAction func oderBtn(_ sender: Any) {
        getUserLocation()
    }
}

extension orderCartVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.userLat = locValue.latitude
        self.userLng = locValue.longitude
        getAddressFromLatLon(pdblLatitude: "\(locValue.latitude)", withLongitude: "\(locValue.longitude)")
    }
}
