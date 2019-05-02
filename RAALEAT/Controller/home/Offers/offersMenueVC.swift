//
//  offersMenueVC.swift
//  RAALEAT
//
//  Created by Farido on 4/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class offersMenueVC: UIViewController {

    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reste: CosmosView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var singleItem: offers?
    var meal = [offerMenues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPdetials()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        spiner.isHidden = true
        
        handleRefreshgetMeal()
        //tap()
    }
        
    @objc private func handleRefreshgetMeal() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Offers.offoersMenues(restaurantId: singleItem?.restaurantId ?? ""){(error: Error?,status,data,meal: [offerMenues]?) in
            if status == true {
                if let meal = meal {
                    self.meal = meal
                    print("xxx\(self.meal)")
                    
                    self.tableView.reloadData()
                }
            }else  {
                self.showAlert(title: "Food", message: data ?? "")
                self.meal = []
                self.tableView.reloadData()
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
            self.tableView.reloadData()
        }
        
    }
    

    
    
    func setUPdetials(){
        
        self.reste.rating = 4.0
        reste.settings.updateOnTouch = false
        self.des.text = singleItem?.restaurantName
        images.image = UIImage(named: "3")
        let s = singleItem?.restaurantImage ?? ""
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
        }
        
    }
    

    
}

extension offersMenueVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? offermenuCell{
            let meals = meal[indexPath.item]
            cell.configuerCell(prodect: meals)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return offermenuCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: meal[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? offerAddCartVC{
            destaiantion.singleItem = sender as? offerMenues
            destaiantion.desc = singleItem?.restaurantName ?? ""
            destaiantion.image = singleItem?.restaurantImage ?? ""

        }
    }

    
}
