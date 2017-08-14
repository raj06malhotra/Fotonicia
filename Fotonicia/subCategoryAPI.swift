//
//  subCategoryAPI.swift
//  Fotonicia
//
//  Created by sawan on 17/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import Alamofire


extension photoPrintVC {
    
    func getAPI(id:String){
        
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetCategoryItem
        let dicParams:SMJSON = ["category_id" : id]
       
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                 
                guard  let items = category_item(json: response.result.value as! SMJSON) else {return }
              
                print(items)
                self.array.append(items)
                self.categoryitemArray = (items.category_itemarray)
                self.newtitle = items.category_name
                self.collectioView?.reloadData()
                
                
            }
            
        }
        
    }
}







struct category_item {
    
    let category_id:String
    let category_image:String
    let category_name:String
    
    let category_itemarray : [category_items]
    
    init?(json:SMJSON)  {
        
        guard let id = json["category_id"] as? String,
            let name = json["category_name"] as? String,
            let image = json["category_image"] as? String else {return nil }
        self.category_id = id
        self.category_image = image
        self.category_name = name
        
        
        
        guard let itemaarray = json["category_item"] as? [SMJSON] else {return nil }
        let itestype = itemaarray.map { (category_items(json: $0)!)}
        self.category_itemarray = itestype
        
        
    }
    
}




struct category_items {
    
    
    let item_id:String
    let item_image:String
    let item_name:String
    let item_starting_price:String
    

   
    
    init?(json: SMJSON) {
        
        guard let id = json["item_id"] as? String,
            let image = json["item_image"] as? String,
            let name = json["item_name"] as? String,
            let price = json["item_starting_price"] as? String else {return nil }
        self.item_id = id
        self.item_image = image
        self.item_name = name
        self.item_starting_price = price
        
        
        
}


}
