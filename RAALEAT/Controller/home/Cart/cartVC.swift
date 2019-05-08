//
//  cartVC.swift
//  RAALEAT
//
//  Created by Farido on 4/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class cartVC: UIViewController {

    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totlaPrice: UILabel!
    
    
    
    var carts = [cart]()
    var cartCount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        spiner.isHidden = true
        handleRefreshgetType()
        //tap()
    }
    
    @IBAction func order(_ sender: Any) {
        
    }
    
    func countCart(){
        for cart in carts {
            cartCount = cartCount + cart.totalPrice
            self.totlaPrice.text = "Subtotal: \(cartCount)"
        }
        
        
    }
    
     func handleRefreshgetBlusCart(_ Id: Int?) {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Cart.plusCart(menu_details_id: Id ?? 0) { (erroe: Error?, Success,status ,data,errors)  in
            if Success {
                if status == true {
                    self.showAlert(title: "Add to cart", message: data ?? "")
                }else {
                    self.showAlert(title: "Add to cart", message: errors ?? "")
                }
            }else{
                self.showAlert(title: "Add to cart", message: errors ?? "")
            }
            self.handleRefreshgetType()
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
        }
        
    }
    
    func handleRefreshgetMainCart(_ Id: Int?) {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Cart.mainCart(menu_details_id: Id ?? 0) { (erroe: Error?, Success,status ,data,errors)  in
            if Success {
                if status == true {
                    self.showAlert(title: "Add to cart", message: data ?? "")
                }else {
                    self.showAlert(title: "Add to cart", message: errors ?? "")
                }
            }else{
                self.showAlert(title: "Add to cart", message: errors ?? "")
            }
            self.handleRefreshgetType()
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
            
        }
        
    }
    
    func handleRefreshgetDeleteCart(_ Id: Int?) {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Cart.deletCart(menu_details_id: Id ?? 0) { (erroe: Error?, Success,status ,data,errors)  in
            if Success {
                if status == true {
                    self.showAlert(title: "Add to cart", message: data ?? "")
                }else {
                    self.showAlert(title: "Add to cart", message: errors ?? "")
                }
            }else{
                self.showAlert(title: "Add to cart", message: errors ?? "")
            }
            self.handleRefreshgetType()
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
            
        }
        
    }
    
    
    
    @objc private func handleRefreshgetType() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Cart.showCart{(error: Error?,status,data,carts: [cart]?) in
            if status == true {
                if let carts = carts {
                    self.carts = carts
                    print("xxx\(self.carts)")
                    self.countCart()
                    self.tableView.reloadData()
                }
            }else  {
                self.showAlert(title: "Food", message: data ?? "")
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
        }
        
    }
    
    
    @IBAction func orderBtn(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
}

extension cartVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cartCell{
            let food = carts[indexPath.item]
            cell.configuerCell(prodect: food)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cell.add = {
                
                guard (helper.getAPIToken().access_token != nil)  else {
                    let message = NSLocalizedString("please login frist", comment: "hhhh")
                    let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                    self.showAlert(title: title, message: message)
                    return
                }
                self.handleRefreshgetBlusCart(Int(food.menuDetailsId))
            }
            
            cell.delete = {
                guard (helper.getAPIToken().access_token != nil)  else {
                    let message = NSLocalizedString("please login frist", comment: "hhhh")
                    let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                    self.showAlert(title: title, message: message)
                    return
                }
                self.handleRefreshgetDeleteCart(Int(food.menuDetailsId))
            }
                
            if food.qty != "1" {
                
                cell.delletBTN.isEnabled = true
                cell.min = {
                    
                    guard (helper.getAPIToken().access_token != nil)  else {
                        let message = NSLocalizedString("please login frist", comment: "hhhh")
                        let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                        self.showAlert(title: title, message: message)
                        return
                    }
                    self.handleRefreshgetMainCart(Int(food.menuDetailsId))
                }
            }else {
                cell.delletBTN.isEnabled = false
            }
            return cell
        }else {
            return cartCell()
        }
        
    }
}

