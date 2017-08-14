//
//  InstgramAPI.swift
//  Fotonicia
//
//  Created by sawan on 18/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension instgramimagePickerVC {
    
    
    func getPhotos(token:String){
        
        DispatchQueue.global().async { 
            
            
            let url = "https://api.instagram.com/v1/users/self/media/recent/?access_token=\(token)"
            
            Alamofire.request(url).responseJSON { (response) in
                
                
                let json =   JSON(response.result.value!)
                
                let image_array = json["data"]
                
                
                for item in 0..<image_array.count {
                    
                    let new = instgramImageModel()
                    
                    let data = image_array[item]["images"]["standard_resolution"]["url"].stringValue
                    
                    new.img = data
                    self.instaimgArray.append(new)
                    
                    self.stopActivityIndicator()
                    DispatchQueue.main.async(execute: {
                        self.collectionView?.reloadData()
                    })
                    
                }
                
                
            }
        }
    }
    
}





class instgramImageModel: NSObject{
    
    var img : String?
}
