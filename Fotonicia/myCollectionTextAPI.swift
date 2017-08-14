//
//  myCollectionTextAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 08/08/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper


extension addTextVC {

func textAPI(){
    let url = Constant.BaseUrl.url + Constant.APIEndPoints.getTextbyCategory
    
    let dicParams = ["user_id" : "282"]
    
    Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
        
        if((response.result.value) != nil) {
            
            // print("RESPONSE \(response.result.value!)")
            
            let text = JSON(response.result.value!)
            let new = text["text_history"].arrayValue
            
            for i in 0..<new.count{
                
                let textdata = text_history()
                textdata.category_id = new[i]["category_id"].stringValue
                textdata.category_name = new[i]["category_name"].stringValue
                
                self.array1.append(textdata)
                
                
                print("TEST ARRAY1  \(self.array1)")
                
                // print("CATEGORY DATA \(textdata.category_name)")
                
                let textdetails = new[i]["text_details"].arrayValue
                
                for j in 0..<textdetails.count {
                    let text_detail = text_details()
                    text_detail.sno = textdetails[j]["sno"].stringValue
                    text_detail.text_id = textdetails[j]["text_id"].stringValue
                    text_detail.text_title = textdetails[j]["text_title"].stringValue
                    text_detail.text_description = textdetails[j]["text_description"].stringValue
                    text_detail.isLiked = textdetails[j]["isLiked"].stringValue
                    
                    self.array2.append(text_detail)
                    
                }
                
                
                
            }
//         DispatchQueue.main.async(execute: { 
//            let new  = SMSimpleListViewController()
//            self.swipeableView.reloadData()
//         })

            
            
        }
        
        
        
        
        
        
        
    }
    
    
    }

        
        
  
        
//        let pasrseJson = response.result.value
//        
//        print(pasrseJson?.history)
//        
       
//        for index in texth
//        {
//            print(index.text_description)
//            
//            }
//       
        
        
    
        
    
}

//class text_response: Mappable {
//   
//    var history : [String]?
//    
//    required init?(map: Map) {
//        
//    }
//    
//     func mapping(map: Map) {
//        history <- map["text_history"]
//    }
//}
//
//class texthist: Mappable {
//    
//    var category_id: String?
//    var category_name: String?
//    var text_details: [text_det]?
//    required init?(map: Map) {
//        
//    }
//    
//    func mapping(map: Map) {
//        category_id <- map["category_id"]
//        category_name <- map["category_name"]
//        text_details <- map["text_details"]
//    }
//    
//    
//}
//
//
//class text_det: Mappable {
//    var sno: String?
//    var text_id: String?
//    var text_title: String?
//    var text_description: String?
//    var isLiked: String?
//    
//    required init?(map: Map) {
//        
//    }
//    func mapping(map: Map) {
//        sno <- map["sno"]
//        text_id <- map["text_id"]
//        text_title <- map["text_title"]
//        text_description <- map["text_description"]
//        isLiked <- map["isLiked"]
//    }
//}


 class text_history: NSObject {

    var category_id: String?
    var category_name: String?
}




class text_details: NSObject {
    var sno: String?
    var text_id: String?
    var text_title: String?
    var text_description: String?
    var isLiked: String?
    
}
