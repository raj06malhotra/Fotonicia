//
//  LayoutAPI.swift
//  Fotonicia
//
//  Created by sawan on 24/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import ObjectMapper
import Alamofire
import SwiftyJSON


extension LayoutViewController{
    
    
    func getAPI(id:String){
        
        DispatchQueue.global(qos: .background).async { 
            
            
            let url = "http://www.zataksoftech.info/fotonicia/mobileapi/personalize/getLayoutByCategory"
            
            let dicParams:SMJSON = ["product_id" : id]
            
            Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseObject { (response: DataResponse<Category_Layout>) in
                
                let parseJson = response.result.value
                
                if let  layoutdetail = parseJson?.layout {
                    
                    for index in layoutdetail {
                        
                        self.arrayCategory.append(index)
                        
                        if let detail = index.layout_detail {
                          
                            for i in detail {
                                
                               self.childCategory.append(i)
                            }
                        }
                    }
                }
                
                DispatchQueue.main.async(execute: {
                    self.parentcollectionview.reloadData()
                })
            }
        }
        
    }
    
    
    
}

class Category_Layout: Mappable{
    
    var layout : [Layout_category_details]?
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        layout <- map["category_details"]
    }
}


class Layout_category_details : Mappable {
    
 
    
    var category_name : String?
    var category_id : String?
    var layout_detail : [layout_details]?

    required init?(map: Map) {
        
    }
    
    
     func mapping(map: Map) {
        category_id <- map["category_id"]
        category_name <- map["category_name"]
        layout_detail <- map["layout_details"]
        
    }
}


class layout_details: Mappable {
   
    var thumbnail : String?
    var min_no_of_photos : String?
    var no_of_elements : String?
    var max_no_of_photos : String?
    var layout_name : String?
    var layout_price : String?
    var layout_id : String?
    var  sno : String?
    var type : String?
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        thumbnail <- map["thumbnail"]
        min_no_of_photos <- map["min_no_of_photos"]
        no_of_elements <- map["no_of_elements"]
        max_no_of_photos <- map["max_no_of_photos"]
        layout_name <- map["layout_name"]
        layout_price <- map["layout_price"]
        layout_id <- map["layout_id"]
        sno <- map["sno"]
        type <- map["type"]
        
    }
}

