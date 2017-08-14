//
//  FeedBackFormAPI.swift
//  Fotonicia
//
//  Created by shadman Alam on 28/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


extension FeedbackformVC{


    func feedbackAPI(userid:String, Question1:String, Question2: String, Question3: String, Question4: String, Question5: String, Question6: String, Question7: String, Question8: String, Question9: String, Question10: String){
    
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.AddFeedback
        
        let dicParams:SMJSON = ["user_id" : userid, "question1" : Question1, "question2" : Question2, "question3" : Question3, "question4" : Question4 ,  "question5" : Question5, "question6" : Question6,  "question7" : Question7, "question8" : Question8,  "question9" : Question9, "question10" : Question10]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            if((response.result.value) != nil){
                
                print("\(response.result.value)")
                
                print("\(dicParams), \(response.result.value)")
            
            
            }
            

    
        }
    }





}
