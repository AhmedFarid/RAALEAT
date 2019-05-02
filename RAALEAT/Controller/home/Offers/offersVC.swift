//
//  offersVC.swift
//  RAALEAT
//
//  Created by Farido on 4/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class offersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var offer = [offers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        spiner.isHidden = true
        handleRefreshgetType()
        //tap()
    }
    
    @objc private func handleRefreshgetType() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Offers.offoers{(error: Error?,status,data,offer: [offers]?) in
            if status == true {
                if let offer = offer {
                    self.offer = offer
                    print("xxx\(self.offer)")
                    
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

extension offersVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offer.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? offerscell{
            let food = offer[indexPath.item]
            cell.configuerCell(prodect: food)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return offerscell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: offer[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? offersMenueVC{
            destaiantion.singleItem = sender as? offers
        }
    }
}

