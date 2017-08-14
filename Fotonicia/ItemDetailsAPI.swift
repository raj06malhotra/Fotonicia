//
//  ItemDetailsAPI.swift
//  Fotonicia
//
//  Created by sawan on 17/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension CreateTableViewController {
    
    func getAPI(id:String){
        
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetItem
        let dicParams:SMJSON = ["hash_key" : Constant.hashkey.HashKey, "item_id" : id, "user_id": "282"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                
                
                
               
                let items = item_Details(json: response.result.value as! SMJSON)
              
             
                
                self.array = (items?.category_itemarray)!
              
                
                self.tableView?.reloadData()
                
                
            }
            
        }
        
    }
}

struct item_Details {
    
  
    let category_itemarray : [creation_details]
    let item_img_array : [item_images]
    
   
    
    init?(json:SMJSON)  {
    
       
        guard let itemaarray = json["creation_details"] as? [SMJSON] else {return nil }
        let itestype = itemaarray.map { (creation_details(json: $0)!)}
        self.category_itemarray = itestype
        
        
        guard let itmimgarry = json["item_images"] as? [SMJSON] else {return nil }
        let imgtype = itmimgarry.map { (item_images(json: $0)!)}
        self.item_img_array = imgtype
        
        


        guard let youtubeid = json["video_id"] as? String else {return nil}
        
        print("YOU TUBE \(youtubeid)")

        
        
    }
    
}




struct creation_details {
    
    let item_id:String
    let item_name:String
   
    let price:String
    let rewardpoints_earn:String
    
   
    
    init?(json:SMJSON)  {
        
        guard let id = json["item_id"] as? String,
            let name = json["item_name"] as? String,
            
            let reward = json["rewardpoints_earn"] as? String,
            let price = json["price"] as? String else {return nil }
        self.item_id = id
        self.price = price
        self.item_name = name
        
         self.rewardpoints_earn = reward
       
    }
    
}


struct item_images {
    
    
    let item_image :String
 
    init?(json:SMJSON)  {
        
        
        guard let itemimg = json["item_image"] as? String else {return nil }
       print(itemimg)
        self.item_image = itemimg
        
    }
    
}





extension CategoryCreateViewController {
    
    
    
    func getAPI(id:String){
        
        DispatchQueue.global(qos: .background).async { 
           
          
            let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetItem
            let dicParams:SMJSON = ["item_id" : id]
            
            Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseObject { (response: DataResponse<Category_create_item_Details>) in
                
                let pasrseJson = response.result.value
                
                if let detail = pasrseJson?.images {
                    
                    for index in detail {
                        self.array.append(index)
                    }
                    
                    DispatchQueue.main.async(execute: {
                        self.collectionview.reloadData()
                    })
                }
                
            }

        }
        
    }
}


class Category_create_item_Details : Mappable{
    
    var item_description : String?
    var video_id: String?
    var added_in_wishlist: String?
    var item_name: String?
    var layout_per_product: String?
    var rewardpoints_earn: String?
    var sku: String?
    var item_short_description: String?
    var creation_time: String?
    var item_review_count: String?
    var item_ratings: String?
    var detail: [creation_details]?
    var images : [Category_create_item_images]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        item_description  <- map["item_description"]
        video_id  <- map["video_id"]
        added_in_wishlist  <- map["added_in_wishlist"]
        item_name  <- map["item_name"]
        layout_per_product  <- map["layout_per_product"]
        rewardpoints_earn  <- map["rewardpoints_earn"]
        sku  <- map["sku"]
        item_short_description  <- map["item_short_description"]
        creation_time  <- map["creation_time"]
        item_review_count  <- map["item_review_count"]
        item_ratings  <- map["item_ratings"]
        detail <- map["creation_details"]
        images <- map["item_images"]
        
    }
    
}

class Category_create_creation_details: Mappable {

    var item_id: String?
    var item_name: String?
    var price: String?
    var sku: String?
    var rewardpoints_earn: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        item_id <- map["item_id"]
        item_name <- map["item_name"]
        price <- map["price"]
        sku <- map["sku"]
        rewardpoints_earn <- map["rewardpoints_earn"]
       
    }
    
}

class Category_create_item_images: Mappable {
 
    var item_image : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
       item_image <- map["item_image"]
    }
    
}








