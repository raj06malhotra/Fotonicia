//
//  Contants.swift
//  Fotonicia
//
//  Created by sawan on 14/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit


struct Device {
    static func deviceInfo() -> [String : Any] {
        
        var dic = [String : Any]()
        let userDefault = UserDefaults.standard
        guard let dt =  userDefault.value(forKey: "DeviceToken") as? String else {
            dic = ["device_token" : "NotFound",
                   "device_osversion" : UIDevice.current.systemVersion,
                   "device_model" : UIDevice.current.model,
                   "device_name" : UIDevice.current.name,
                   "device_type" : "iPhone",
                   "app_version" : "1.0"]
            return dic
        }
        
        dic = ["device_token" : dt,
               "device_osversion" : UIDevice.current.systemVersion,
               "device_model" : UIDevice.current.model,
               "device_name" : UIDevice.current.name,
               "device_type" : "iPhone",
               "app_version" : "1.0"]
        
        return dic
    }
}


let kAPI = "index"
let API  = "page"
let kData = "data"
let kStatus = "status"


struct Constant {
    struct PlaceHolderImage {
        static let UserProfile = "DummyProfile"
        static let Background = "Cart"
       
    }
    struct hashkey {
         static let HashKey =  "api123456789"
    }
    
    struct BaseUrl {
        static let url = "http://www.zataksoftech.info/fotonicia/mobileapi/"
        
    }
    
    struct APIEndPoints {
      
        
        static let Login = "auth/login"
        static let Register = "auth/register"
        static let SendOTP = "auth/validateOTP"
        static let reSendOTP = "auth/resendOTP"
        static let ForgetPassword = "auth/forgotPassword"
        static let ChangePassword = "/changePassword"
        static let GetDashboard = "/getDashboard"
        static let GetSubCategory = "/getSubCategory"
        static let getsubcategories = "/getsubcategories"
        static let GetCategoryItem = "/getCategoryItem"
        static let GetItem = "/getItem"
        static let GetReviewDetails = "/getReviewDetails"
        static let SubmitReview = "/submitReview"
        
        static let Getwishlist = "/getWishlist"
        static let Removewishlist = "/removeItemFromWishlist"
        
        static let Addaddress = "/addAddress"
        static let Getaddress = "/getAddress"
         static let Deleteaddress = "/deleteAddress"
        
        static let offers = "offer/getOffer"
        
        static let EditMyProfile = "/editUserProfile"
        static let GetOrder = "/getCustomerOrder"
        static let Reorder = "reorder"
        static let Cancelorder = "/cancelOrder"
        
        static let Getpage = "/getPage"
        
        static let Getreview = "/getReview"
        static let mydonation = "/getDonation"
        
        static let myWallet = "/getWallet"
        
        static let getTag = "tag/getTag"
        static let addTag = "tag/addTag"
        
        static let getLayout = "personalize/getLayout"
        
        static let getLayoutCategory = "personalize/getLayoutByCategory"
        static let getTextbyCategory = "personalize/getTextByCategory"
        
        
        static let HomeSearch = "productsearch/getProductSearchByTag"
        
        static let GetSearch = "tag/getTagListForAutocomplete"
        
        static let Fan = "fan/getFanData"
        static let CartList = "cart/getCartList"
        static let AboutUS = "personalize/getCmsPage"
        
        static let AddFeedback = "/addFeedback"
        
        
    }
    
      
    struct AlertMessage {
        struct SigninAndSignup {
            static let EmptyField = "Field can not be empty"
            static let ValidLastName = "Please enter valid Last Name"
            static let ValidMobileNumber = "Please enter Valid mobile number"
            static let ValidEmail = "Please enter valid email"
            static let PasswordMismatch = "Password mismatch"
            static let PasswordLenghtLimit = "Password can not be less than 7 characters"
            
            static let Fullname = "Please Insert Full Name"
            static let addressFirst = "Please Insert Address"
            static let addressSecond = "Please Insert Second Address"
            static let PinCode = "Please Insert Pincode No"
            static let city = "Please Insert City"
            static let State = "Please Insert State"
            static let Country = "Please Insert Country"
            static let Saveas = "Please Insert Country"
        }
    }
    
    
    
}

















extension UserDefaults {
    
    
    static func saveInsatgramAccessToken(token:String){
        UserDefaults.standard.set(token, forKey: "insttoken")
         UserDefaults.standard.synchronize()
        
    }
    
    
    static func getInstgramAccessToken() -> String? {
        return UserDefaults.standard.value(forKey: "insttoken") as? String
    }
    
    
    static func logoutInstgram() {
        UserDefaults.standard.removeObject(forKey: "insttoken")
        UserDefaults.standard.synchronize()

    }
    
    static func setforms_img(image img: Any) {
        UserDefaults.standard.set(img, forKey: "forms_img")
        UserDefaults.standard.synchronize()
    }
    static func setDeviceID(ID id: String) {
        UserDefaults.standard.set(id, forKey: "deviceid")
        UserDefaults.standard.synchronize()
    }
    static func getDeviceID() -> String{
        return UserDefaults.standard.value(forKey: "deviceid") as! String
    }
    
    static func setUserName(userName name: String) {
        UserDefaults.standard.set(name, forKey: "UserName")
        UserDefaults.standard.synchronize()
    }
    
    static func setUserName_first(userName name: Character) {
        UserDefaults.standard.set(name, forKey: "UserName_first")
        UserDefaults.standard.synchronize()
    }
    
    static func setUserName_last(userName name: Character) {
        UserDefaults.standard.set(name, forKey: "UserName_last")
        UserDefaults.standard.synchronize()
    }
    static func setUserID(userID id: String) {
        UserDefaults.standard.set(id, forKey: "UserId")
        UserDefaults.standard.synchronize()
    }
    
    static func setSignupCode(userID id: String) {
        UserDefaults.standard.set(id, forKey: "code")
        UserDefaults.standard.synchronize()
    }
    
  
    static func setUserEmail(userEmail email: String) {
        UserDefaults.standard.set(email, forKey: "UserEmail")
        UserDefaults.standard.synchronize()
    }
    
    static func setUserLoginStatus(logingStatus status: Bool) {
        UserDefaults.standard.set(status, forKey: "UserLoginStatus")
        UserDefaults.standard.synchronize()
    }
    
    
    
    static func setWishlist_ID(ID id: String) {
        UserDefaults.standard.set(id, forKey: "wishlistid")
        UserDefaults.standard.synchronize()
    }

    
    static func getWishlist_ID() -> Any{
        return UserDefaults.standard.value(forKey: "wishlistid") as Any
    }

    static func removeWishlist_ID(){
        UserDefaults.standard.removeObject(forKey: "wishlistid")
        UserDefaults.standard.synchronize()
    }
  
    static func getforms_img() -> Any{
         return UserDefaults.standard.value(forKey: "forms_img") as Any
    }

    static func getUserID() -> String? {
        return UserDefaults.standard.value(forKey: "UserId") as? String
    }
    
    
    static func getUserName() -> String? {
      
        return UserDefaults.standard.value(forKey: "UserName") as? String
    }
    
    
    
    static func getUserName_First() -> Character? {
        
        return UserDefaults.standard.value(forKey: "UserName_first") as? Character
    }
    
    static func getUserName_Last() -> Character? {
        
        return UserDefaults.standard.value(forKey: "UserName_last") as? Character
    }
    
    
    static func getSignupCode() -> String? {
        return UserDefaults.standard.value(forKey: "code") as? String
    }
    
    
    static func getUserEmail() -> String {
        return UserDefaults.standard.value(forKey: "UserEmail") as! String
    }
    
    static func getUserLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "UserLoginStatus")
    }
    
    
  
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: "UserName")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserID() {
        UserDefaults.standard.removeObject(forKey: "UserId")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserEmail() {
        UserDefaults.standard.removeObject(forKey: "UserEmail")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserLoginStatus() {
        UserDefaults.standard.removeObject(forKey: "UserLoginStatus")
    }
    
    
    
}
