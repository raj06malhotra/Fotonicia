//
//  myAccount_ALL_API.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

// MARK: Order Histort API

extension orderHistoryVC{
    
    func getAPI(){
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetOrder
        
        let dicParams:SMJSON = ["user_id" : "282",  "hash_key" : Constant.hashkey.HashKey]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
               
                let items = order_History_response(json: response.result.value as! SMJSON)
                
                self.aaray = (items?.order_details_array)!
                //  self.history = (items?.orderArray)!
                self.collectionView?.reloadData()
                
                
            }
            
            
        }
        
    }
    
}


struct order_History_response {
    
    
    let order_details_array : [order_details]
    //let orderArray : [order_history]
    
    init?(json:SMJSON)  {
        
        
        
        guard let orderaay = json["order_details"] as? [SMJSON] else {return nil }
        let ordetype = orderaay.map { (order_details(json: $0)!)}
        self.order_details_array = ordetype
        
        //
        //        guard let history = json["order_history"] as? [SMJSON] else {return nil }
        //        let historytype = history.map { (order_history(json: $0)!)}
        //        self.orderArray = historytype
        //
        
        
    }
    
}



struct order_details {
    
    
    let order_amount:String
    let order_date:String
    let order_number:String
    let order_status:String
    let rewardpoints_earn:String
    
    
    init?(json: SMJSON) {
        
        guard let amount = json["order_amount"] as? String,
            let date = json["order_date"] as? String,
            let number = json["order_number"] as? String,
            let status = json["order_status"] as? String,
            let points = json["rewardpoints_earn"] as? String else {return nil }
        
        self.order_amount = amount
        self.order_date = date
        self.order_number = number
        self.order_status = status
        self.rewardpoints_earn = points
        
    }
    
    
}



struct order_history {
    
    
    let total_amount:String
    let total_orders:String
    
    
    
    init?(json: SMJSON) {
        
        guard let amount = json["total_amount"] as? String,
            let order = json["total_orders"] as? String else {return nil }
        
        
        self.total_amount = amount
        self.total_orders = order
        
    }
    
    
}



//MARK: MY Donation API

extension myDonationVC {
    func getAPI(){
        
        DispatchQueue.global().async {
            
            let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.mydonation
            
            let dicParams:SMJSON = ["user_id" : "282",  "hash_key" : Constant.hashkey.HashKey]
            
            Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
                
                
                if((response.result.value) != nil) {
                   
                    let new = donationModel()
                    let json =   JSON(response.result.value!)
                        
                        new.donation_amount = json["donation_total"]["donation_amount"].stringValue
                        new.rewardpoints_earn = json["donation_total"]["rewardpoints_earn"].stringValue
                        new.no_of_donations = json["no_of_donations"].stringValue
                    
                        self.array.append(new)
                        DispatchQueue.main.async {
                            self.tableView?.reloadData()
                    }
                }
            }
        }
    }
}

class  donationModel : NSObject {
    
    var donation_amount: String?
    var rewardpoints_earn: String?
    var no_of_donations: String?
}




// MARK: My Wallet API
extension myWalletVC{
    func getAPI(){
        
        DispatchQueue.global().async {
            
            let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.myWallet
            
            let dicParams:SMJSON = ["user_id" : "282",  "hash_key" : Constant.hashkey.HashKey]
            
            Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
                
                
                if((response.result.value) != nil) {
                    
                      let historyItems = item_Response(json: response.result.value as! SMJSON)
                      self.rewardHistory = (historyItems?.reward_history)!
                    
                      let items = JSON(response.result.value!)
                      let model = walletPoints()
                      let code = items["points"]["referral_code"].stringValue
                      let data = items["points"]["total_point_amount"].stringValue
                    
                   
                    
                    model.referral_code = code
                    model.total_point_amount = data
                   
                    self.arrayPoints.append(model)
               
                    DispatchQueue.main.async {
                        self.tableView?.reloadData()
                    }
                }
            }
        }
    }
}



struct item_Response {
    
    let reward_history : [rewar_history_walletModel]

    
    init?(json: SMJSON) {
        
        guard let formsarray = json["reward_history"] as? [SMJSON] else {return nil }
        let formstype = formsarray.map { (rewar_history_walletModel(json: $0)!)}
        self.reward_history = formstype
        

        
        
    }
    
}



class walletPoints:NSObject {
    
       var referral_code:String?
       var total_point_amount:String?
}


struct rewar_history_walletModel {
  
    let title:String?
    let reward_date:String?
    let point_amount:String?

    
    init?(json:SMJSON)  {
        
          guard let titlenew = json["title"] as? String  else {return nil}
          guard let reward_datenew = json["reward_date"] as? String else {return nil}
          guard let point_amountnew = json["point_amount"] as? String else {return nil}
        
     
         self.title = titlenew
         self.reward_date = reward_datenew
         self.point_amount = point_amountnew
        
        
    }
}



//MARK: My Reviews API


extension myReviewsVC{
    
    func getAPI(){
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.Getreview
        
        let dicParams:SMJSON = ["user_id" : "282",  "hash_key" : Constant.hashkey.HashKey]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
              
              let items = item_reviews_response(json: response.result.value as! SMJSON)
             
                self.array = (items?.revies_detail)!
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            
        }
        
    }

}




struct item_reviews_response {
    
    let revies_detail: [reviews_details]
    
    
    init?(json: SMJSON) {
        
        guard let formsarray = json["review_details"] as? [SMJSON] else {return nil }
        let formstype = formsarray.map { (reviews_details(json: $0)!)}
        self.revies_detail = formstype
        
    }
    
    
}


struct reviews_details {
    
    
    let product_id:String?
    let product_name:String?
    let review_date:String?
    let review_description:String?
    let review_id:String?
    let review_rate:String?
    
    init?(json: SMJSON) {
        
        guard let id = json["product_id"] as? String else{return nil}
        guard let name = json["product_name"] as? String else{return nil}
        guard let date = json["review_date"] as? String else{return nil}
        guard let desc = json["review_description"] as? String else{return nil}
        guard let reviewid = json["review_id"] as? String else{return nil}
        guard let reviewrate = json["review_rate"] as? String else{return nil}
        
        self.product_id = id
        self.product_name = name
        self.review_date = date
        self.review_description = desc
        self.review_id = reviewid
        self.review_rate = reviewrate
        
    }
    
    
    
}





//MARK: MY Wishlist API

extension myWishlistVC{
    
   public func getAPI(){
        
          let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.Getwishlist
        
          let dicParams:SMJSON = ["user_id" : "282",  "hash_key" : Constant.hashkey.HashKey]
    
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                
                
                let id  = JSON(response.result.value!)
                let wishid = id["wishlist_id"].stringValue
                UserDefaults.setWishlist_ID(ID: wishid)
                
                let items = JSON(response.result.value!)
                let new = items["item_details"].arrayValue
                
               
                    print(new)
                
                    for i in 0..<new.count {
                    let data = wishlist_details()
                    data.item_image = new[i]["item_image"].stringValue
                    data.item_name = new[i]["item_name"].stringValue
                    data.item_starting_price = new[i]["item_starting_price"].stringValue
                    data.item_id = new[i]["item_id"].stringValue
                    data.wishlist_item_id = new[i]["wishlist_item_id"].stringValue
                
                    self.array.append(data)
                        
                    print("TEST PRINT \(data.item_image)")
                }
               
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
         
            }
        
        }
    
    }

}





class wishlist_details : NSObject {
    
    
    var item_image:String?
    var wishlist_item_id:String?
    var item_name:String?
    var item_id:String?
    var item_starting_price:String?
 
    
    
}


// MARK Remove Wishlist

extension myWishlistVC{



   public func getRemoveWishlishtAPI(user_id: String , wishlist_id: String){
        
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.Removewishlist
      
        
        let dicParams:SMJSON = ["user_id" : "282"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                print(" Remove WishList Repsonse\(String(describing: response.result.value))")
                
                


            }}
    }
}


// MARK MY TAG


extension myTagVC{
    
    func getAPI(){
        
        let url = Constant.BaseUrl.url  + Constant.APIEndPoints.getTag
        
        print(url)
        let dicParams:SMJSON = ["user_id" : "282"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                print("TAG RESPONE GET \(response.result.value)")
                
                self.myResponse = JSON(response.result.value as Any)
                let tag = tag_response_data()
                tag.tag_count =  self.myResponse["tag_count"].stringValue
                self.array3.append(tag)
                
                let detail = self.myResponse["product_details"].arrayValue
                
                print(detail)
                for i in 0..<detail.count {
                    let data = mtag_response()
                    let id = detail[i]["product_id"].stringValue
                    let name = detail[i]["productname"].stringValue
                    let time = detail[i]["created_time"].stringValue
                    
                    data.created_time = time
                    data.product_id = id
                    data.productname = name
                    
                    self.array2.append(data)
                    
                    let detail_tag = detail[i]["tag_details"].arrayValue
                   
                    
                    for j in 0..<detail_tag.count {
                         let newdata = tag_details_data()
                        newdata.tagname =  detail_tag[j]["tagname"].stringValue
                        newdata.taged_product_url =  detail_tag[j]["taged_product_url"].stringValue
                        newdata.tag_id =  detail_tag[j]["tag_id"].stringValue
                        self.array.append(newdata)
                    }
                    
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
}


class tag_response_data {
    
     var tag_count = String()
    
}



class mtag_response {
    
    var product_id : String?
    var productname : String?
    var created_time : String?
}



class tag_details_data {
    
    var tagname: String?
    var taged_product_url: String?
    var tag_id: String?
    
  
}



extension myTagVC {



    func AddTagAPI(){
        
        let url = Constant.BaseUrl.url  + Constant.APIEndPoints.addTag
        
        print(url)
        let dicParams:SMJSON = ["user_id" : "282" ,"product_id" : "64" ,"tag_name" : "print"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            

            if((response.result.value) != nil) {
                
                
                print("\(response.result.value)")
            
            
            }}

    }





}




// MARK My Address

extension myAddressVC{
    
    
    func getAPI(){
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.Getaddress
        
        let dicParams:SMJSON = ["user_id" : "282"]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                
                print("MY ADDRESS \(response.result.value)")
                
                self.myResponse = JSON(response.result.value as Any)
                
                let detail = self.myResponse["customer_address"].arrayValue
                
                for i in 0..<detail.count{
                    
                    let customer = customeradress()
                    
                    customer.prefix = detail[i]["prefix"].stringValue
                    customer.firstname = detail[i]["firstname"].stringValue
                    customer.lastname = detail[i]["lastname"].stringValue
                    customer.city = detail[i]["city"].stringValue
                    customer.country_id = detail[i]["country_id"].stringValue
                    customer.region = detail[i]["region"].stringValue
                    customer.postcode = detail[i]["postcode"].stringValue
                    customer.telephone = detail[i]["telephone"].stringValue
                    customer.street = detail[i]["street"].stringValue
                    customer.address_id = detail[i]["address_id"].stringValue
                    customer.cod_available = detail[i]["cod_available"].stringValue
                    print("Adress ID \(String(describing: customer.address_id))")
                    
                    self.array.append(customer)
                    
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }
    }
    
    
    
    
    
    
    
    
}



class customeradress: NSObject {
    
    var prefix: String?
    var firstname: String?
    var lastname: String?
    var city: String?
    var country_id: String?
    var region: String?
    var postcode: String?
    var telephone: String?
    var street: String?
    var address_id: String?
    var cod_available: String?
    
    
    
    
    
}






extension myAddressVC{
    
    func getAPID(userid:String, addressid:String){
        
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.Deleteaddress
        
        let dicParams:SMJSON = ["user_id" : userid, "address_id": addressid ]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                print("Delete Response \(String(describing: response.result.value))")
                
                
            }
            
        }
        
    }
    
}

// MARK : ADD ADDRESS

extension newAddressVC{
    
    
    func AddAdressAPi(userid:String, addressid:String, prefix: String, firstname: String, lastname: String, city: String, region: String, postcode: String, telephone: String, street: String, country_id: String){
        
        let url = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.Addaddress
        
        let dicParams:SMJSON = ["user_id" : userid, "address_id": addressid, "prefix" : prefix, "firstname" : firstname, "lastname" : lastname, "city" : city, "region" : region, "postcode" : postcode, "telephone" : telephone ,"street" : street, "country_id" : country_id]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                
                print("Save Response \(String(describing: response.result.value))")
                
                
            }
            
        }
        
    }
    
    
    
}









