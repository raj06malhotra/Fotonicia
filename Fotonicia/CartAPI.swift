//
//  CartAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 27/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension cartVC{


    func getCartAPI() {
        
         let url = Constant.BaseUrl.url + Constant.APIEndPoints.CartList
        
        let dicParams:SMJSON = ["user_id" : "86"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
            
                
                 self.myResponse = JSON(response.result.value!)
                
      

                
               
                let cartsum = self.myResponse["cart_summary"].dictionary
                
                
                
                
                cart_summary.total_reward_point_earn = cartsum?["total_reward_point_earn"]?.stringValue
                cart_summary.item_count = cartsum?["item_count"]?.stringValue
                cart_summary.sub_total = cartsum?["sub_total"]?.stringValue
                cart_summary.promo_discount = cartsum?["promo_discount"]?.stringValue
                cart_summary.credit_point_discount = cartsum?["credit_point_discount"]?.stringValue
                cart_summary.total_discount = cartsum?["total_discount"]?.stringValue
                cart_summary.donation = cartsum?["donation"]?.stringValue
                cart_summary.total_donation = cartsum?["total_donation"]?.stringValue
                cart_summary.shipping_price = cartsum?["shipping_price"]?.stringValue
                cart_summary.total_price = cartsum?["total_price"]?.stringValue
                cart_summary.max_points_per_order = cartsum?["max_points_per_order"]?.stringValue
                cart_summary.point = cartsum?["point"]?.stringValue
                cart_summary.money_against_points = cartsum?["money_against_points"]?.stringValue
                cart_summary.total_user_points = cartsum?["total_user_points"]?.stringValue

                
                
                print(" TEST \(String(describing:   cart_summary.total_reward_point_earn))")
                
                print("TEST @ \(String(describing: cart_summary.total_discount))")
                
               
                
                                
                
                
                
                
                let productdetails = JSON(response.result.value!)
                let detail = productdetails["product_details"].arrayValue
                let data = product_details()
                  for i in 0..<detail.count {
                
                data.cart_id = detail[i]["cart_id"].stringValue
                data.parent_id = detail[i]["parent_id"].stringValue
                data.parent_item_name = detail[i]["parent_item_name"].stringValue
                data.parent_image = detail[i]["parent_image"].stringValue
                data.child_id = detail[i]["child_id"].stringValue
                data.child_item_name = detail[i]["child_item_name"].stringValue
                data.item_starting_price = detail[i]["item_starting_price"].stringValue
                data.total_layout_price = detail[i]["total_layout_price"].stringValue
                data.item_rate = detail[i]["item_rate"].stringValue
                data.total_item_rate = detail[i]["total_item_rate"].stringValue
                data.qty = detail[i]["qty"].stringValue
                data.layout_per_product = detail[i]["layout_per_product"].stringValue
                data.rewardpoints_earn = detail[i]["rewardpoints_earn"].stringValue
                self.array.append(data)
                
                 

                }
                DispatchQueue.main.async {
                    
                    self.collectionView?.reloadData()
                }

                
                
            }
        
        
        }
        
        
        
    }






}






class product_details: NSObject {
    
    
    var cart_id: String?
    var parent_id: String?
    var parent_item_name: String?
    var parent_image: String?
    var child_id: String?
    var child_item_name: String?
    var item_starting_price: String?
    var total_layout_price: String?
    var item_rate: String?
    var total_item_rate: String?
    var qty: String?
    var layout_per_product: String?
    var rewardpoints_earn: String?
    
}




struct cart_summary {
    
    
    static var total_reward_point_earn: String?
    static var item_count: String?
    static var sub_total: String?
    static var promo_discount: String?
    static var credit_point_discount: String?
    static var total_discount: String?
    static var donation: String?
    static var total_donation: String?
    static var shipping_price: String?
    static var total_price: String?
    static var max_points_per_order: String?
    static var point: String?
    static var money_against_points: String?
    static var child_id: String?
    static var total_user_points: String?
    
    
    
    
    
}
