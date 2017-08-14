//
//  EditProfileAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 02/08/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension editProfileVC{


    func getEditAPI(){
        
        
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.EditMyProfile
    
         let dicParams:SMJSON = ["user_id" : "282"]

        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                print("RESPONSE \(response.result.value!)")
                
                
                
            }
            

        }
    
    
}




}
