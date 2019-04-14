//
//  menuVC.swift
//  RAALEAT
//
//  Created by Farido on 4/11/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos


class menuVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var reate: CosmosView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    
    var meal = [meals]()
    var mainMnues = [mainMnue]()
    var item: Int?
    var singleItem: searchs?
    var selected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
        spiner.isHidden = true
        
        setUPdetials()
        handleRefreshgetMeune()
    }
    
    
    
    
    func setUPdetials(){
        self.reate.rating = Double(singleItem?.rating ?? "") ?? 0
        reate.settings.updateOnTouch = false
        self.des.text = singleItem?.name
        image.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(singleItem?.image ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
    }
    
    @objc private func handleRefreshgetMeal() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Home.getMenuDetails(menu_id: item ?? 0){(error: Error?,status,data,meal: [meals]?) in
            if status == true {
                if let meal = meal {
                    self.meal = meal
                    print("xxx\(self.meal)")
                    
                    self.tabelView.reloadData()
                }
            }else  {
                self.showAlert(title: "Food", message: data ?? "")
                self.meal = []
                self.tabelView.reloadData()
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
            self.tabelView.reloadData()
        }
        
    }
    
    @objc private func handleRefreshgetMeune() {
        spiner.startAnimating()
        spiner.isHidden = false
        API_Home.meanMenue(restaurant_id: 1){(error: Error?,status,data,mainMnues: [mainMnue]?) in
            if status == true {
                if let mainMnues = mainMnues {
                    self.mainMnues = mainMnues
                    print("xxx\(self.mainMnues)")
                    
                    self.collectionView.reloadData()
                }
            }else  {
                self.showAlert(title: "Food", message: data ?? "")
                self.collectionView.reloadData()
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
        }
        
    }
    

}

extension menuVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? mellCell{
            let meals = meal[indexPath.item]
            cell.configuerCell(prodect: meals)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return mellCell()
        }
       
    }
    
    
}

extension menuVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMnues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? maimMnueCell {
            let menus = mainMnues[indexPath.item]
            cell.configuerCell(prodect: menus)
            item = mainMnues.first?.id
//            if indexPath.row == 0 {
//              cell.isSelected = selected
//            }
            handleRefreshgetMeal()
            return cell
        }else {
            return 	maimMnueCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 4, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        item = mainMnues[indexPath.row].id
        handleRefreshgetMeal()
    }
    
    
}
