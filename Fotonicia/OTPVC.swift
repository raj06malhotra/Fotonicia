//
//  LoginVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit



class OTPVC: UIViewController {
    
    
    var code: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.bgColor
        
        view.addSubview(emailBox)
        setupemailBox()
        view.addSubview(loginButton)
        setuploginButton()
   
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Resend", style: .plain, target: self, action: #selector(reSendOTP))
        navigationItem.title = "Verify OTP"
    }
    
   
    
    
    // MARK: create email textfield  box
    
    let emailBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "Enter OTP"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        contactField.keyboardType = .numberPad
        contactField.borderStyle = .roundedRect
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setupemailBox() {
        
        emailBox.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailBox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailBox.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -34).isActive = true
        emailBox.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    

    //MARK: send button
    lazy var loginButton:UIButton = {
        
        let readBtn = UIButton()
        readBtn.backgroundColor = UIColor.btnColor
        readBtn.setTitle("Verify", for: .normal)
        readBtn.titleLabel?.font = .systemFont(ofSize: 20)
        readBtn.setTitleColor(UIColor.white, for: .normal)
        readBtn.layer.cornerRadius = 2.6
        readBtn.isUserInteractionEnabled = true
        readBtn.addTarget(self, action: #selector(handleOTP), for: .touchUpInside)
        readBtn.translatesAutoresizingMaskIntoConstraints = false
        return readBtn
    }()
    
    
    func setuploginButton(){
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -17).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -34).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    
}
