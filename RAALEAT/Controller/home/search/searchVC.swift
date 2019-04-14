//
//  searchVC.swift
//  RAALEAT
//
//  Created by Farido on 4/9/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import RevealingSplashView

class searchVC: UIViewController {
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var food: UITextField!
    
    
    var getCity = [getCitys]()
    var getState = [getStates]()
    var getType = [getTypes]()
    
    var citys = 0
    var statec = 0
    var typec = 0
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "logo-b")!, iconInitialSize: CGSize(width: 229, height: 216), backgroundImage: UIImage(named: "Group 85")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftBarButon()
        
        revealingSplashView.useCustomIconColor = false
        revealingSplashView.iconColor = UIColor.red
        
        //Adds the revealing splash view as a sub view
        let window = UIApplication.shared.keyWindow
        window?.addSubview(revealingSplashView)
//        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.swingAndZoomOut
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
        
        tap()
        textEnabeld()
        createBussPiker()
        createTypePiker()

        
    }
    
    
    @objc private func handleRefreshgetCity() {
        API_Home.myorder{ (error: Error?, getCity: [getCitys]?) in
            if let getCity = getCity {
                self.getCity = getCity
                print("xxx\(self.getCity)")
                self.textEnabeld()
                //self.createBussPiker()
            }
        }
        
    }
    
    @objc private func handleRefreshgetStates() {
        API_Home.getState(city_id: "\(citys)"){ (error: Error?, getState: [getStates]?) in
            if let getState = getState {
                self.getState = getState
                print("xxx\(self.getState)")
                self.textEnabeld()
                //self.createBussPiker()
            }
        }
        
    }
    
    @objc private func handleRefreshgetType() {
        API_Home.getType{ (error: Error?, getType: [getTypes]?) in
            if let getType = getType {
                self.getType = getType
                print("xxx\(self.getType)")
                self.textEnabeld()
                //self.createBussPiker()
            }
        }
        
    }
    
    
    
    func textEnabeld() {
        if getCity.isEmpty == true {
            city.isEnabled = false
        }else {
            city.isEnabled = true
        }
        
        if getState.isEmpty == true {
            state.isEnabled = false
        }else {
            state.isEnabled = true
        }
        if getType.isEmpty == true {
            state.isEnabled = false
        }else {
            state.isEnabled = true
        }
    }
    
    func createBussPiker(){
        let cityx = UIPickerView()
        cityx.delegate = self
        cityx.dataSource = self
        cityx.tag = 0
        city.inputView = cityx
        handleRefreshgetCity()
        cityx.reloadAllComponents()
    }
    
    func createTypePiker(){
        let type = UIPickerView()
        type.delegate = self
        type.dataSource = self
        type.tag = 2
        food.inputView = type
        handleRefreshgetType()
        type.reloadAllComponents()
    }
    
    func createStatusPiker(){
        let states = UIPickerView()
        states.delegate = self
        states.dataSource = self
        states.tag = 1
        state.inputView = states
        handleRefreshgetStates()
        states.reloadAllComponents()
    }
    
    func leftBarButon(){
        if helper.getAPIToken().access_token == nil{
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(back))
        }
        
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
    
    @IBAction func searchNow(_ sender: Any) {
        guard let foods = food.text, !foods.isEmpty else {
            let messages = NSLocalizedString("enter your food type", comment: "hhhh")
            let title = NSLocalizedString("Search Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        performSegue(withIdentifier: "suge", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? searchdetailsVC{
            destaiantion.city_id = citys
            destaiantion.state_id = statec
            destaiantion.type_id = typec
        }
    }
    
}

extension searchVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return getCity.count
        }else if pickerView.tag == 1 {
            return getState.count
        }else {
            return getType.count
        }
    }
    
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return getCity[row].name
        }else if pickerView.tag == 1{
            return getState[row].name
        }else {
            return getType[row].name
        }
    }
  
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            city.text = getCity[row].name
            citys = getCity[row].id
            createStatusPiker()
            self.view.endEditing(false)
        }else if pickerView.tag == 1{
            state.text = getState[row].name
            statec = getState[row].id
            self.view.endEditing(false)
            
        }else{
            food.text = getType[row].name
            typec = getType[row].id
            self.view.endEditing(false)
        }
    }
}
