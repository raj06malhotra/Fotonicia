//
//  HomeSearchAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 25/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


extension SearchVC {

    
    func SearchAPI(){
    
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.GetSearch
        
        print(url)
        let dicParams:SMJSON = ["tag_name" : "print"]
        
        Alamofire.request(url, method: .get, parameters: dicParams, encoding: URLEncoding.default, headers: nil).responseJSON { (response : DataResponse<Any>) in
            
            if((response.result.value) != nil){
    
                let tagdetails = JSON(response.result.value!)
                let detail = tagdetails["tag_details"].arrayValue
                let search = searc_tag_details()
                
                for i in 0..<detail.count {
                    
                    search.tag_id = detail[i]["tag_id"].stringValue
                    search.tagname = detail[i]["tagname"].stringValue
                    self.searcharray.append(search)
                    
                    print("ARRAY DAATA \(self.searcharray)")

                }
                
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }

                
                
            }
        }
    }
            
            
}



class searc_tag_details: NSObject {
    
    
    var tag_id: String?
    var tagname: String?
    
    
    
    
}



// MARK After Search

extension SearchVC {

    func aferSearchAPI(){
    
    
    
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.HomeSearch
        
        let dicParams:SMJSON = ["tag_id" : "2", "tagname" : "Photo"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil){
                self.myResponse = JSON(response.result.value as Any)
                
                let detail = self.myResponse["product_details"].arrayValue
                for i in 0..<detail.count {
                let data = aftersearch_product_details()
                data.item_id = detail[i]["item_id"].stringValue
                data.item_name = detail[i]["item_name"].stringValue
                data.item_starting_price = detail[i]["item_starting_price"].stringValue
                
                print("Get Data \(String(describing: data.item_id))")
                print("Get name \(String(describing: data.item_name))")
                print("Get price \(String(describing: data.item_starting_price))")
                    
                    let item_image = detail[i]["item_images"].arrayValue
                    for x in 0..<item_image.count {
                    
                    let images = aftersearch_product_deatils_images()
                    
                    images.itemimage = item_image[x]["item_image"].stringValue
                        
                    print("ARRAY RESPONSE \(String(describing: images.itemimage))")
                    
                    }
          }
        }
    }
 }








}

class aftersearch_product_details: NSObject {
    
    
    var item_id: String?
    var item_name: String?
    var item_starting_price: String?
  
    
    
}

class aftersearch_product_deatils_images: NSObject {
    var itemimage: String?
}
