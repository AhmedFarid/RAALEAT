//
//  searchdetailsVC.swift
//  RAALEAT
//
//  Created by Farido on 4/11/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class searchdetailsVC: UIViewController {
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var searh = [searchs]()
    var city_id: Int?
    var type_id: Int?
    var state_id: Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        spiner.isHidden = true
        handleRefreshgetType()
        
     
        
    }
    
    
    @objc private func handleRefreshgetType() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Home.search(city_id: city_id ?? 1, type_id: type_id ?? 1, state_id: state_id ?? 1){(error: Error?,status,data,searh: [searchs]?) in
            if status == true {
            if let searh = searh {
                self.searh = searh
                print("xxx\(self.searh)")
                
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

extension searchdetailsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searh.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? searchCell{
            let food = searh[indexPath.item]
            cell.configuerCell(prodect: food)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return searchCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: searh[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? menuVC{
            destaiantion.singleItem = sender as? searchs
        }
    }
}
