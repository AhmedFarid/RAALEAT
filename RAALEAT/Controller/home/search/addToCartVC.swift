//
//  addToCartVC.swift
//  RAALEAT
//
//  Created by Farido on 4/14/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class addToCartVC: UIViewController {
    
    @IBOutlet weak var reate: CosmosView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var quntity: UILabel!
    @IBOutlet weak var mainCart: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var dse2: UILabel!
    
    
    var desc = ""
    var rate = ""
    var totalRate = 0
    var image = ""
    var totalReate = ""
    var qty = 1
    var prices = ""
    var priod = ""
    
    var singleItem: meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPdetials()
        //tap()
    }
    
    func setUPdetials(){
        self.reate.rating = Double(rate) ?? 0
        self.reate.text = "\(totalRate)"
        reate.settings.updateOnTouch = false
        self.des.text = desc
        self.dse2.text = singleItem?.descriptio
        self.mealName.text = singleItem?.name ?? ""
        self.price.text = "\(singleItem?.price ?? 0) SAR"
        self.time.text = "\(singleItem?.period ?? "") min"
        images.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
        }
        mealImage.image = UIImage(named: "3")
        let ss = ("\(URLs.mainImage)\(singleItem?.image ?? "")")
        let encodedLinks = ss.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURLs = NSURL(string: encodedLinks!)! as URL
        
        mealImage.kf.indicatorType = .activity
        if let urls = URL(string: "\(encodedURLs)") {
            print("g\(urls)")
            mealImage.kf.setImage(with: urls)
        }
        
    }
    
    @IBAction func blusCart(_ sender: Any) {
        mainCart.isEnabled = true
        self.qty = qty + 1
        self.quntity.text = "\(qty)"
    }
    
    @IBAction func mainCart(_ sender: Any) {
        if qty == 0{
            mainCart.isEnabled = false
        }else {
        self.qty = qty - 1
        self.quntity.text = "\(qty)"
        }
    }
    @IBAction func addTocart(_ sender: Any) {
         guard helper.getAPIToken().access_token != nil else{
            self.showAlert(title:"Plz login frist", message: "Plz login frist")
            return
        }
        
        API_Cart.addCart(menu_details_id: singleItem?.id ?? 0, qty: qty) { (erroe: Error?, Success,status ,data,errors)  in
            if Success {
                if status == true {
                    self.showAlert(title: "Add to cart", message: data ?? "")
                }else {
                    self.showAlert(title: "Add to cart", message: errors ?? "")
                }
            }else{
                self.showAlert(title: "Add to cart", message: errors ?? "")
            }
        }
    }
}
