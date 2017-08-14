//
//  OurfansAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 25/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import  SwiftyJSON

extension myFanVC{



    func fansVideoApi(){
    
        
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.Fan
    
        let dicParams:SMJSON = ["fan_type" : "fan_video"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in

            if((response.result.value) != nil){
                
                //print(" Fans Response \(response.result.value)")
                let VedioDetails = JSON(response.result.value!)
                let detail = VedioDetails["fan_video_details"].arrayValue

                for i in 0..<detail.count {
                    let vedio = fan_video_details()
                    vedio.id = detail[i]["id"].stringValue
                    vedio.video_name = detail[i]["video_name"].stringValue
                    vedio.video_youtube_id = detail[i]["video_youtube_id"].stringValue
                
                print(" IDD \(String(describing: vedio.id))")
                print(" Name \(String(describing: vedio.video_name))")
                print(" Video ID \(String(describing: vedio.video_youtube_id))")
                    
            }
    
    
        }
    
    }



    }

}

class fan_video_details: NSObject {
    
    var id: String?
    var video_name: String?
    var video_youtube_id: String?
    
    
}


extension myFanVC{
    
    
    
    func fansImageApi(){
        
        
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.Fan
        
        let dicParams:SMJSON = ["fan_type" : "fan_image"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            if((response.result.value) != nil){
                
                //print(" Fans Response \(response.result.value)")
                let ImageDetails = JSON(response.result.value!)
                let detail = ImageDetails["fan_image_details"].arrayValue
                
                for i in 0..<detail.count {
                    let Image = fan_image_details()
                    Image.id = detail[i]["id"].stringValue
                    Image.image_name = detail[i]["image_name"].stringValue
                    Image.image_url = detail[i]["image_url"].stringValue
                    
                    self.array1.append(Image)
                    
                    
                    print("TEST \(self.array1))")
                    
                }
                
//                DispatchQueue.main.sync {
//                    self.collectionview?.reloadData()
//                }
                
                
            }
            
        }
        
        
        
    }
    
}

class fan_image_details: NSObject {
    
    var id: String?
    var image_name: String?
    var image_url: String?
    
    
    
}
