//
//  myorderDetilesVC.swift
//  RAALEAT
//
//  Created by Farido on 5/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myorderDetilesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var myOrder = [myOrderDetails]()
    var singelItem: myOrders?
    
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
        API_Order.myOrderDetail(order_id: singelItem?.orderId ?? 0){(error: Error?,status,data,myOrder: [myOrderDetails]?) in
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

extension myorderDetilesVC: UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myOrderDetailsCell{
            let trips = myOrder[indexPath.row]
            cell.configuerCell(prodect: trips)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return myOrderDetailsCell()
        }
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        print("ccccc")
    //        performSegue(withIdentifier: "suge", sender: waltes[indexPath.row])
    //    }
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let destaiantion = segue.destination as? detialsTripVC{
    //            if let sub = sender as? trips{
    //                destaiantion.singleItem = sub
    //            }
    //        }
    //    }
    
}



