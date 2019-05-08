//
//  myOrdersVC.swift
//  RAALEAT
//
//  Created by Farido on 5/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myOrdersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var myOrder = [myOrders]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        spiner.isHidden = true
        handleRefreshgetPackage()
    }
    
    @objc private func handleRefreshgetPackage() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Order.myOrder{(error: Error?,status,data,myOrder: [myOrders]?) in
            if status == true {
                if let myOrder = myOrder {
                    self.myOrder = myOrder
                    print("xxx\(self.myOrder)")
                    
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

extension myOrdersVC: UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myordersCell{
            let trips = myOrder[indexPath.row]
            cell.configuerCell(prodect: trips)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return myordersCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: myOrder[indexPath.row])
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destaiantion = segue.destination as? myorderDetilesVC{
                if let sub = sender as? myOrders{
                    destaiantion.singelItem = sub
                }
            }
        }
    
}


