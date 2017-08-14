//
//  offerAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 24/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire


extension offersVc {

func getAPIOffer(){
        
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.offers
    
         let dicParams:SMJSON = ["hash_key" : Constant.hashkey.HashKey]
    
    Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
        
        
        if((response.result.value) != nil){
            
            
            let items = JSON(response.result.value!)
            let detail = items["offer_details"].arrayValue
            
            
            for i in 0..<detail.count{
                
                
                let offer = offer_details()
                offer.offer_title = detail[i]["offer_title"].stringValue
                offer.offer_description = detail[i]["offer_description"].stringValue
                offer.offer_coupon = detail[i]["offer_coupon"].stringValue
                offer.to_date = detail[i]["to_date"].stringValue
                offer.offer_coupon_image = detail[i]["offer_coupon_image"].stringValue
                self.array.append(offer)
                print("Response of Offer API \(String(describing: offer.offer_coupon_image))")
                
            }
            
            
            DispatchQueue.main.async {
                print(" Testing \(self.array)")
                self.collectionView?.reloadData()
            }

           
        
        }else{
        print("Response Nil")
        }
    }

    }

    }

class offer_details: NSObject {
    
    
    var offer_title: String?
    var offer_description: String?
    var offer_coupon: String?
    var offer_coupon_image: String?
    var to_date: String?
    
}



extension offerVCCart {
    
    func getAPIOffer(){
        
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.offers
        
        let dicParams:SMJSON = ["hash_key" : Constant.hashkey.HashKey]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil){
                
                
                let items = JSON(response.result.value!)
                let detail = items["offer_details"].arrayValue
                
                
                for i in 0..<detail.count{
                    
                    
                    let offer = offer_detailed()
                    offer.offer_title = detail[i]["offer_title"].stringValue
                    offer.offer_description = detail[i]["offer_description"].stringValue
                    offer.offer_coupon = detail[i]["offer_coupon"].stringValue
                    offer.to_date = detail[i]["to_date"].stringValue
                    offer.offer_coupon_image = detail[i]["offer_coupon_image"].stringValue
                    self.array.append(offer)
                    print("Response of Offer API \(String(describing: offer.offer_coupon_image))")
                    
                }
                
                
                DispatchQueue.main.async {
                    print(" Testing \(self.array)")
                    self.collectionView?.reloadData()
                }
                
                
                
            }else{
                print("Response Nil")
            }
        }
        
    }
    
}

class offer_detailed: NSObject {
    
    
    var offer_title: String?
    var offer_description: String?
    var offer_coupon: String?
    var offer_coupon_image: String?
    var to_date: String?
    
}
