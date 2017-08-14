//
//  AboutUSAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 28/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


extension aboutVC{


    func getAboutAPI(){
    
     let url =  Constant.BaseUrl.url + Constant.APIEndPoints.AboutUS
        
        let dicParams:SMJSON = ["cmspage_id" : "2"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            if((response.result.value) != nil){
                
                self.myResponse = JSON(response.result.value as Any)
                
                
                guard let data  = self.myResponse["cms_page_details"]["cms_element_details"].array else {return}
                let newdata = cms_element_details()
                for i in 0..<data.count {
                    
                    newdata.title = data[i]["title"].stringValue
                    newdata.image = data[i]["image"].stringValue
                    newdata.description1 = data[i]["description"].stringValue
                    newdata.id = data[i]["id"].stringValue
                    
                    self.array.append(newdata)
                }
                
              
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
        }
    }
}



class cms_page_detailed: NSObject {
    
    var cmspage_id: String?
    var cmspage_name: String?
}

class cms_element_details: NSObject {
    
    var title: String?
    var image: String?
    var description1: String?
    var id: String?
}




