//
//  API Services.swift
//  Fotonicia
//
//  Created by sawan on 14/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import Alamofire
import Toast_Swift
import SCLAlertView
import SwiftyJSON



extension LogInVC {
    
    
    
    func  handlegoogleSignIn(){
        
        
        
        if Auth.auth().currentUser != nil {
            self.view.makeToast("You are already signin with Google!")
            
        } else  {
            GIDSignIn.sharedInstance().signIn()
            print("do google sigin")
        }
        
    }
    
    
    
    
    func handleSociallogin(token:String, provider:String){
        
        self.startActivityIndicator()
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.Login
        
        
        let dicUserDetails : SMJSON = ["access_token" : token, "provider" : provider]
        
        
        
        
        
        
        Alamofire.request(url, method: .post, parameters: dicUserDetails, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            switch(response.result) {
                
            case .success(_):
                
                let data = JSON(response.result.value as Any)
                print("Response Success: \(data)")
                
                let statuscode = data["status_code"].stringValue
                
                
                let message = data["message"].stringValue
                
                print(statuscode, message)
                if statuscode == "200" {
                    let accessToken = data["access_token"].stringValue
                    self.stopActivityIndicator()
                    UserDefaults.setUserID(userID: accessToken)
                    UserDefaults.setUserLoginStatus(logingStatus: true)
                    self.showAlertViewWithSingleButton(title: "Success", message: message)
                    
                    
                } else if statuscode == "201" {
                    let code = data["code"].stringValue
                    self.stopActivityIndicator()
                    
                    let alertController : UIAlertController = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "Verify", style: UIAlertActionStyle.default) { UIAlertAction in
                        
                        let new = OTPVC()
                        new.code = code
                        self.navigationController?.pushViewController(new, animated: true)
                        
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                    
                }
                else {
                    self.stopActivityIndicator()
                    print(statuscode)
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                    
                }
                
                
                break
            case .failure(_):
                if let error = response.result.error {
                    print("Response Error: \(error)")
                    
                }
                self.stopActivityIndicator()
                self.view.makeToast("Please try again!")
                break
                
            }
            
        }
        
        
    }
    
    
    
    
    
    func handlelogin(){
        
        self.startActivityIndicator()
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.Login
        
        guard let email = self.emailBox.text else {return}
        guard let password = self.passwordBox.text else {return}
        
        let dicUserDetails : SMJSON = ["login" : email, "password" : password]
        
        let dicParams:SMJSON = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : Constant.hashkey.HashKey]
        
        
        
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            switch(response.result) {
                
            case .success(_):
                
                let data = JSON(response.result.value as Any)
                print("Response Success: \(data)")
                
                let statuscode = data["status_code"].stringValue
                
                
                let message = data["message"].stringValue
                
                print(statuscode, message)
                if statuscode == "200" {
                    let accessToken = data["access_token"].stringValue
                    self.stopActivityIndicator()
                    UserDefaults.setUserID(userID: accessToken)
                    UserDefaults.setUserLoginStatus(logingStatus: true)
                    self.showAlertViewWithSingleButton(title: "Success", message: message)
                    
                    
                } else if statuscode == "201" {
                    let code = data["code"].stringValue
                    self.stopActivityIndicator()
                    
                    let alertController : UIAlertController = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "Verify", style: UIAlertActionStyle.default) { UIAlertAction in
                        
                        let new = OTPVC()
                        new.code = code
                        self.navigationController?.pushViewController(new, animated: true)
                        
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                    
                }
                else {
                    self.stopActivityIndicator()
                    print(statuscode)
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                    
                }
                
                
                break
            case .failure(_):
                if let error = response.result.error {
                    print("Response Error: \(error)")
                    
                }
                self.stopActivityIndicator()
                self.view.makeToast("Please try again!")
                break
                
            }
            
        }
        
        
    }
    
    
    
    func forgotAction(){
        
        let title = "Forgot password"
        let message =  "Enter your email ID or mobile number  to receive password"
        
        let alert = SCLAlertView()
        let txt = alert.addTextField("Email / Mobile ")
        alert.addButton("Proceed") {
            
            self.getpassword(txt: txt)
        }
        alert.showEdit(title, subTitle: message)
        
    }
    
    
    func getpassword(txt:UITextField){
        
        guard let text = txt.text else {return}
        let url = Constant.BaseUrl.url +  Constant.APIEndPoints.ForgetPassword
        let dicParams:SMJSON = ["login" : text]
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            if((response.result.value) != nil) {
                let data = JSON(response.result.value as Any)
                
                print(data)
                let statuscode = data["status_code"].stringValue
                let message = data["message"].stringValue
                
                if statuscode == "200" {
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                } else {
                    
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                }
            }
        }
    }
}



extension SignUpVC {
    
    
    func handleRegister(){
        
        
        if self.firstnameBox.text?.characters.count == 0{
            self.alert(message: Constant.AlertMessage.SigninAndSignup.EmptyField, title: "")
            
        }
        else if self.lastnameBox.text?.characters.count == 0 {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidLastName, title: "")
        }
            
        else if !self.mobileNumberBox.text!.isValidMobileNumber(value: self.mobileNumberBox.text!)
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidMobileNumber, title: "")
        }
            
        else if !self.emailBox.text!.isValidEmail(testStr: self.emailBox.text!){
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidEmail, title: "")
        }
        else if !self.passwordBox.text!.isPasswordLenthCorrect(password: self.passwordBox.text!){
            self.alert(message: Constant.AlertMessage.SigninAndSignup.PasswordLenghtLimit, title: "")
            
        }
        else{
            self.signup()
            
        }
        
    }
    
    
    func signup(){
        self.startActivityIndicator()
        let urlString = Constant.BaseUrl.url + Constant.APIEndPoints.Register
        
        let dicUserDetails :[String:Any] = ["first_name" : self.firstnameBox.text!, "last_name" : self.lastnameBox.text!, "phone" : self.mobileNumberBox.text!, "email" : self.emailBox.text!,"password" : self.passwordBox.text!, "gender" : "male"]
        
        let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : Constant.hashkey.HashKey]
        
        
        
        Alamofire.request(urlString, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            
            
            switch(response.result) {
            case .success(_):
                
                
                
                let data = JSON(response.result.value as Any)
                print("Response Success: \(data)")
                
                let statuscode = data["status_code"].stringValue
                
                let message = data["message"].stringValue
                
                if statuscode == "200" {
                    let code = data["code"].stringValue
                    self.stopActivityIndicator()
                    let new = OTPVC()
                    new.code = code
                    self.navigationController?.pushViewController(new, animated: true)
                    
                    
                    
                } else {
                    self.stopActivityIndicator()
                    print(statuscode)
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                    
                }
                
                
                break
            case .failure(_):
                if let error = response.result.error {
                    print("Response Error: \(error)")
                    
                }
                self.stopActivityIndicator()
                self.view.makeToast("Please try again!")
                break
                
            }
            
        }
        
        
        
        
    }
    
    
}


extension myAccountVC{
    
    func handleChangePassword(old:String?, new:String?){
        
        
        self.startActivityIndicator()
        let url = Constant.BaseUrl.url + Constant.APIEndPoints.ChangePassword
        
        guard let email = old else {return }
        guard let password = new else {return}
        
        let dicUserDetails : SMJSON = ["login" : email, "password" : password]
        
        let dicParams:SMJSON = ["user_details" : dicUserDetails]
        
        
        
        
        Alamofire.request(url, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            switch(response.result) {
                
            case .success(_):
                
                let data = JSON(response.result.value as Any)
                print("Response Success: \(data)")
                
                let statuscode = data["status_code"].stringValue
                let message = data["message"].stringValue
                
                print(statuscode, message)
                if statuscode == "200" {
                    self.stopActivityIndicator()
                    self.showAlertViewWithSingleButton(title: "Success", message: message)
                    
                    
                }
                else {
                    self.stopActivityIndicator()
                    
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                    
                }
                
                
                break
            case .failure(_):
                if let error = response.result.error {
                    print("Response Error: \(error)")
                    
                }
                self.stopActivityIndicator()
                self.view.makeToast("Please try again!")
                break
                
            }
            
        }
        
        
    }
}





extension OTPVC {
    
    
    
    func handleOTP(){
        
        self.startActivityIndicator()
        
        let urlString = Constant.BaseUrl.url + Constant.APIEndPoints.SendOTP
        
        guard let otp = self.emailBox.text else {return}
        
        
        
        guard let id = self.code else {return}
        
        let dicParams:[String : Any] = ["code" :  id, "otp" : otp]
        
        Alamofire.request(urlString, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON(completionHandler: { (response) in
            
            switch(response.result) {
                
            case .success(_):
                
                let data = JSON(response.result.value as Any)
                print("OTP Success: \(data)")
                
                
                let statuscode = data["status_code"].stringValue
                let message = data["message"].stringValue
                let accessToken = data["access_token"].stringValue
                
                if statuscode == "200" {
                    self.stopActivityIndicator()
                    UserDefaults.setUserID(userID: accessToken)
                    UserDefaults.setUserLoginStatus(logingStatus: true)
                    self.goToHomeController(message: message)
                    
                    
                } else {
                    self.stopActivityIndicator()
                    print(statuscode)
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                    
                }
                
                
                break
            case .failure(_):
                if let error = response.result.error {
                    print("OTP Error: \(error)")
                    
                }
                self.stopActivityIndicator()
                self.showAlertViewWithSingleButton(title: "Waring", message: "OTP verification failed")
                break
                
            }
            
        })
        
        
    }
    
    func reSendOTP(){
        
        self.startActivityIndicator()
        
        let urlString = Constant.BaseUrl.url + Constant.APIEndPoints.reSendOTP
        
        
        
        
        
        guard let id = self.code else {return}
        
        let dicParams:[String : Any] = ["code" :  id]
        
        Alamofire.request(urlString, method: .post, parameters: dicParams, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON(completionHandler: { (response) in
            
            switch(response.result) {
                
            case .success(_):
                
                let data = JSON(response.result.value as Any)
                print("OTP Success: \(data)")
                
                
                let statuscode = data["status_code"].stringValue
                let message = data["message"].stringValue
                let accessToken = data["code"].stringValue
                
                if statuscode == "200" {
                    self.stopActivityIndicator()
                    
                    self.AlertController(message: message, accessToken: accessToken)
                    
                    
                } else {
                    self.stopActivityIndicator()
                    print(statuscode)
                    self.showAlertViewWithSingleButton(title: "Warning", message: message)
                    
                }
                
                
                break
            case .failure(_):
                if let error = response.result.error {
                    print("OTP Error: \(error)")
                    
                }
                self.stopActivityIndicator()
                self.showAlertViewWithSingleButton(title: "Waring", message: "OTP verification failed")
                break
                
            }
            
        })
        
        
    }
    
    
    
    func goToHomeController(message:String){
        
        
        let alertController : UIAlertController = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default) { UIAlertAction in
            
            self.navigationController?.popViewController(animated: true)
            
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    func AlertController(message:String, accessToken:String){
        
        
        let alertController : UIAlertController = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default) { UIAlertAction in
            UserDefaults.setUserID(userID: accessToken)
            UserDefaults.setUserLoginStatus(logingStatus: true)
            self.dismiss(animated: true, completion: nil)
            
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    
    
}













struct LoginauthResponse {
    
    let user_id:String
    let status_code:String
    let otp:String
    
    
    
    init?(json:SMJSON)  {
        
        guard let user_id = json["user_id"] as? String,
            let otp = json["otp"] as? String,
            let status_code = json["status_code"] as? String else {return nil }
        
        
        self.user_id = user_id
        self.status_code = status_code
        self.otp = otp
        
        
        
    }
    
}


