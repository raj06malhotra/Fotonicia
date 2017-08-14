//
//  extensions.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

extension UIImageView {
    
  
    override func applyShadow() {
        let layer  = self.layer
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.4
        layer.shadowRadius  = 2
    }
    
     override func applyBottomShadow() {
        let layer  = self.layer
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.4
        layer.shadowRadius  = 2
        layer.masksToBounds = false
    }
    
}

extension UIView {
    
    
    func applyShadow() {
        let layer  = self.layer
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.4
        layer.shadowRadius  = 2
    }
    
    func applyBottomShadow() {
        let layer  = self.layer
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.4
        layer.shadowRadius  = 2
        
    }
    
}

extension UIColor{
    class var textWhite: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
    class var btnColor: UIColor {
        return UIColor(red: 103 / 255.0, green: 201 / 255.0, blue: 204 / 255.0, alpha: 1.0)
    }
    
    class var bgColor: UIColor {
        return UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
}
    
    
    class var navColor: UIColor {
        return UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
    }
    
    class var buttoncolor: UIColor{
    
    return UIColor(red:0.40, green:0.79, blue:0.80, alpha:1.0)
    
    }

}


extension UIViewController {
    
    func showAlertViewWithSingleButton(title : String,message:String) -> Void {
        let alertController : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default) { UIAlertAction in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
}


extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


extension UIViewController {
    
    var activityIndicatorTag: Int { return 10 }
    
    func startActivityIndicator(
        style: UIActivityIndicatorViewStyle = .gray) {
        let loc = self.view.center
        DispatchQueue.main.async(execute: {
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.color = UIColor.black
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        })
    }
    
    
    func stopActivityIndicator() {
        DispatchQueue.main.async(execute: {
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        })
    }
    
    
    
    func alert(message:String, title:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Dismiss", style: .default) { (UIAlertAction) in
        }
        
        alert.addAction(actionOK)
        self.present(alert, animated: true) {
        }
    }
    
       
}







extension String{
    
    
    // Last Name validation
    
    func isValidInput(testStr:String) -> Bool {
        let RegEx = "\\A\\w{7,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: testStr)
    }
    
    //Email Validation :
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    //Phone Number validation :
    
    
    
    
    static let strPhoneNumberRegex = "^((\\+)|(00)|(\\*)|())[0-9]{10,14}((\\#)|())$"
    
    
    func isValidMobileNumber(value : String) -> Bool
    {
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", String.strPhoneNumberRegex)
        return phoneTest.evaluate(with: trim)
    }
    var trim: String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }

    //Pincode validation :
    func isValidPincode(value: String) -> Bool {
        if value.characters.count == 6{
            return true
        }
        else{
            return false
        }
    }
    
    //Password Validation : Check current and confirm is same.
    func isPasswordNotSame(password: String , confirmPassword : String) -> Bool {
        return password == confirmPassword
    }
    
    //Password length validation : length should grater than 7.
    func isPasswordLenthCorrect(password: String) -> Bool {
        if password.characters.count <= 6{
            return false
        }
        else{
            return true
        }
    }
}
