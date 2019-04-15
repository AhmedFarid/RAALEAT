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
    }
    
    @IBAction func order(_ sender: Any) {
        
    }
    
    func countCart(){
        for cart in carts {
            cartCount = cartCount + cart.totalPrice
            self.totlaPrice.text = "Subtotal: \(cartCount)"
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
            return cell
        }else {
            return cartCell()
        }
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "suge", sender: searh[indexPath.row])
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destaiantion = segue.destination as? menuVC{
//            destaiantion.singleItem = sender as? searchs
////        }
//    }
}

