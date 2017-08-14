//
//  DataServices.swift
//  Fotonicia
//
//  Created by Sawkan Team on 16/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper




extension featuredDetailCategoryVC {
    
    func getDashboard(index:Int){
        
        print(index)
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.getsubcategories
       
        let dicParams:SMJSON = ["category_id" : "6"]

        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseObject { (response : DataResponse<sub_category2>) in
            
            let parseResponse = response.result.value
          
           
            
            if let detail = parseResponse?.sub_details {
              
                for index in detail {
                   self.array.append(index)
                
                }
            }
            
            DispatchQueue.main.async {
                self.collectioView?.reloadData()
            }
        }
    }
}


class sub_category2: Mappable {
    
    var category_name : String?
    var category_image : String?
    var sub_details: [sub_category__details]?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        category_name <- map["category_name"]
        category_image <- map["category_image"]
        sub_details <- map["sub_category_details"]
    }
    
}

class sub_category__details: Mappable {
    var name : String?
    var image_url : String?
    var entity_id : String?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        name <- map["name"]
        image_url <- map["image_url"]
        entity_id <- map["entity_id"]
    }
    
}








