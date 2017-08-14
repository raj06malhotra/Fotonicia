//
//  HomeAPI.swift
//  Fotonicia
//
//  Created by sawan on 31/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper

extension HomeVC {
    
    func getDashboard(){
        
        Alamofire.request(urlstring).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                self.dashboardArray = (items?.Category)!
                self.fillersArray = (items?.fillers)!
                
                
                DispatchQueue.main.async(execute: {
                    
                    self.collectionView?.reloadData()
                })
                
                
            }
        }
    }
    
}


extension topCategoryCell {
    
    func getDashboard(){
        
        Alamofire.request(urlstring).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                self.topCategory = (items?.categoryDetails)!
                
                DispatchQueue.main.async(execute: {
                    self.collectioView?.reloadData()
                })
                
                
                
            }
        }
    }
}




extension formCell {
    
    func getDashboard(){
        
        Alamofire.request(Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                self.formdata = (items?.forms)!
                
                DispatchQueue.main.async(execute: {
                    self.collectioView?.reloadData()
                })
                
                
                
            }
        }
    }
    
}



extension couponcell{
    
    func getDashboard(){
        
        Alamofire.request(Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                self.couponArray = (items?.coupons)!
                
                DispatchQueue.main.async(execute: {
                    self.collectioView?.reloadData()
                })
                
                
                
            }
        }
    }
    
}


extension trendingCell {
    
    func getDashboard(){
        
        Alamofire.request(Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                self.trendingArray = (items?.trendings)!
                
                DispatchQueue.main.async(execute: {
                    self.collectioView?.reloadData()
                })
                
                
                
            }
        }
    }
}


extension featuredCell {
    
    func getDashboard(index:Int){
        
        Alamofire.request(Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                
                self.sub_categoryArray = (items?.Category[index].subCategory)!
                
                DispatchQueue.main.async(execute: {
                    self.collectioView?.reloadData()
                })
                
                
                
            }
        }
    }
    
}





extension homemadeArtCell {
    
    func getDashboard(index:Int){
        
        Alamofire.request(Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard).responseJSON { (response) in
            
            if((response.result.value) != nil) {
                
                let items = itemResponse(json: response.result.value as! SMJSON)
                
                self.sub_categoryarray = (items?.Category[index].subCategory)!
                
                DispatchQueue.main.async(execute: {
                    self.collectioView?.reloadData()
                })
                
                
                
            }
        }
    }
}




typealias SMJSON = [String: Any]



struct itemResponse {
    
    let forms : [array_forms]
    let coupons : [array_coupons]
    let trendings : [array_trending_items]
    let Category : [array_category]
    let fillers : [array_fillers]
    let categoryDetails : [array_category_details]
    
    init?(json: SMJSON) {
        
        guard let formsarray = json["array_forms"] as? [SMJSON] else {return nil }
        let formstype = formsarray.map { (array_forms(json: $0)!)}
        self.forms = formstype
        
        
        guard let couponsarray = json["array_coupons"] as? [SMJSON] else {return nil }
        let couponstype = couponsarray.map { (array_coupons(json: $0)!)}
        self.coupons = couponstype
        
        guard let trendingsarray = json["array_trending_items"] as? [SMJSON] else {return nil }
        let trendingtype = trendingsarray.map { (array_trending_items(json: $0)!)}
        self.trendings = trendingtype
        
        guard let categoryArray = json["array_category"] as? [SMJSON] else {return nil }
        let categorytype = categoryArray.map { (array_category(json: $0)!)}
        self.Category = categorytype
        
        guard let fillersArray = json["fillers"] as? [SMJSON] else {return nil }
        let fillerstype = fillersArray.map { (array_fillers(json: $0)!)}
        self.fillers = fillerstype
        
        guard let categoryDetailArray = json["category_details"] as? [SMJSON] else {return nil }
        let categoryDetailtype = categoryDetailArray.map { (array_category_details(json: $0)!)}
        self.categoryDetails = categoryDetailtype
        
        
        
        
    }
    
}



struct array_forms {
    
    let form_id:String?
    let form_image:String?
    
    
    
    init?(json:SMJSON)  {
        
        guard let id = json["form_id"] as? String,
            let image = json["form_image"] as? String else {return nil }
        self.form_id = id
        self.form_image = image
        
        
        
    }
    
}




struct array_coupons {
    
    
    let coupon_id:String?
    let coupon_image:String?
    
    
    
    init?(json:SMJSON)  {
        guard let id = json["coupon_id"] as? String,
            let image = json["coupon_image"] as? String else {return nil }
        self.coupon_id = id
        self.coupon_image = image
        
        
        
    }
}



struct array_trending_items {
    
    
    let item_id:String?
    let item_image:String?
    
    
    
    init?(json:SMJSON)  {
        
        guard let id = json["item_id"] as? String,
            let image = json["item_image"] as? String else {return nil }
        self.item_id = id
        self.item_image = image
        
        
    }
}


struct array_category {
    
    
    let entity_id:String?
    let name:String?
    let image_url:String?
    
    let subCategory : [sub_category]
    
    init?(json:SMJSON)  {
        
        guard let id = json["entity_id"] as? String,
            let name = json["name"] as? String,
            let image = json["image_url"] as? String else {return nil }
        
        self.entity_id = id
        self.name = name
        self.image_url = image
        
        guard let categoryArray = json["sub_category"] as? [SMJSON] else {return nil }
        let categorytype = categoryArray.map { (sub_category(json: $0)!)}
        self.subCategory = categorytype
    }
}




struct sub_category {
    
    
    let entity_id:String?
    let name:String?
    let image_url:String?
    
    
    
    
    init?(json:SMJSON)  {
        
        guard let id = json["entity_id"] as? String,
            let name = json["name"] as? String,
            let image = json["image_url"] as? String else {return nil }
        
        self.entity_id = id
        self.name = name
        self.image_url = image
        
        
        
    }
}





struct array_fillers {
    
    
    let filler_id:String?
    let filler_image:String?
    
    
    
    init?(json:SMJSON)  {
        
        guard let id = json["filler_id"] as? String,
            let image = json["filler_image"] as? String else {return nil }
        self.filler_id = id
        self.filler_image = image
        
        
    }
}




struct array_category_details {
    
    
    let entity_id:String?
    let category_name:String?
    let category_image:String?
    
    
    
    init?(json:SMJSON)  {
        
        guard let id = json["entity_id"] as? String,
            let name = json["category_name"] as? String ,
            let image = json["category_image"] as? String else {return nil }
        self.entity_id = id
        self.category_name = name
        self.category_image = image
        
        
    }
}



