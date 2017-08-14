//
//  Layout API.swift
//  Fotonicia
//
//  Created by sawan on 31/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//


import UIKit
import AlamofireObjectMapper 
import Alamofire
import ObjectMapper
import Kingfisher



extension LayoutViewController{
    
    
    func get_layout_API(id:String) {
        self.startActivityIndicator()
        
        DispatchQueue.global(qos: .background).async { 
            let url = Constant.BaseUrl.url + Constant.APIEndPoints.getLayout
            
            let dicParams = ["layout_id": id]
          
            Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseObject { (response: DataResponse<Layout_Detail_Model>) in
                
                let pasrseJson = response.result.value
                
                if let elements = pasrseJson?.layout_history?.element {
                    
                    for index in elements{
                       
                        let new = layoutDesignCollectionVC()
                        new.array.append(index)
                        print(new.array.count)
                    }
                    
                }
                
                
                
                if let img = pasrseJson?.layout_history?.image {
                    self.stopActivityIndicator()
                    
                    let new = ImageViewVC()
                    let img = URL(string: img)
                    
                    new.itemimg.kf.setImage(with: img, placeholder: UIImage(named: "placeholder"))
                    self.navigationController?.pushViewController(new, animated: true)
                    
                    
                    
                    
                    }
                
                else {
                    
                    self.showAlertViewWithSingleButton(title : "Warning!",message:"Apologize!  Please try again later.")
                    
                }
                
                }
                
            }
        
        }
        
    }




class Layout_Detail_Model : Mappable {
   
    var layout_history : layout_history_model?
    var product_history : [product_history]?
    
    required init?(map: Map) {
        
    }
   
    func mapping(map: Map) {
        layout_history <- map["layout_history"]
        product_history <- map["product_history"]
    }

    
    
}

class layout_history_model :Mappable {
  
    var sno: String?
    var layout_name: String?
    var layout_price: String?
    var base_image: String?
    var image: String?
    var print_width: String?
    var print_height: String?
    var min_no_of_photos: String?
    var max_no_of_photos: String?
    var no_of_elements: String?
    var element:[tier_element]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        sno <- map["sno"]
        layout_name <- map["layout_name"]
        layout_price <- map["layout_price"]
        base_image <- map["base_image"]
        image <- map["image"]
        print_width <- map["print_width"]
        print_height <- map["print_height"]
        min_no_of_photos <- map["min_no_of_photos"]
        max_no_of_photos <- map["max_no_of_photos"]
        no_of_elements <- map["no_of_elements"]
        element <- map["tier_element"]
    }
    
}




class tier_element: Mappable{
    
    var height: String?
    var width:  String?
    var xcoordinate:  String?
    var ycoordinate:  String?
    var id:  String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        height <- map["height"]
        width <- map["width"]
        xcoordinate <- map["xcoordinate"]
        ycoordinate <- map["ycoordinate"]
        id <- map["id"]
    }
}






class product_history: Mappable {
    
    var personalize_text : String?
    var personalize_background: String?
    var personalize_border: String?
    var personalize_frame_color: String?
    var personalize_style: String?
    var personalize_matting: String?
    var frame: String?
    var personalize_rotate: String?
    var no_of_layouts_per_product: String?
    var price_per_sheet: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
         personalize_text <- map["personalize_text"]
         personalize_background <- map["personalize_background"]
         personalize_border <- map["personalize_border"]
         personalize_frame_color <- map["personalize_frame_color"]
         personalize_style <- map["personalize_style"]
         personalize_matting <- map["personalize_matting"]
         frame <- map["frame"]
         personalize_rotate <- map["personalize_rotate"]
         no_of_layouts_per_product <- map["no_of_layouts_per_product"]
         price_per_sheet <- map["price_per_sheet"]
        
    }
}







