//
//  SucessVC.swift
//  Fotonicia
//
//  Created by sawan on 27/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class SucessVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.bgColor
        setupsucessMark()
        setupordernumberlbl()
        setupsucessorderlbl()
        setupseperatorview()
  
        setupmessagelbl()
        setupsharefeedbackbtn()
        setuprateUsbtn()
    }

     let  sucessMark: UIImageView = {
        let lineView = UIImageView()
        lineView.image = UIImage(named: "successicon")
        lineView.contentMode = .scaleAspectFit
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupsucessMark(){
        view.addSubview(sucessMark)
        
        sucessMark.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sucessMark.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        sucessMark.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sucessMark.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    let  ordernumberlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Your order number is #8268297"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupordernumberlbl(){
        view.addSubview(ordernumberlbl)
        
        ordernumberlbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ordernumberlbl.topAnchor.constraint(equalTo: sucessMark.bottomAnchor, constant: 20).isActive = true
        ordernumberlbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        ordernumberlbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
    
    let  sucessorderlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Successfully Ordered."
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupsucessorderlbl(){
        view.addSubview(sucessorderlbl)
        
        sucessorderlbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sucessorderlbl.topAnchor.constraint(equalTo: ordernumberlbl.bottomAnchor, constant: 20).isActive = true
        sucessorderlbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        sucessorderlbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
    let  seperatorview: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupseperatorview(){
        view.addSubview(seperatorview)
        seperatorview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        seperatorview.topAnchor.constraint(equalTo: sucessorderlbl.bottomAnchor, constant: 30).isActive = true
        seperatorview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        seperatorview.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    
    let  sharefeedbackbtn: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("Share Feedback", for: .normal)
        lineView.setTitleColor(UIColor.black, for: .normal)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupsharefeedbackbtn(){
        view.addSubview(sharefeedbackbtn)
        
        sharefeedbackbtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        sharefeedbackbtn.bottomAnchor.constraint(equalTo: messagelbl.topAnchor, constant: -20).isActive = true
        sharefeedbackbtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        sharefeedbackbtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    
    
    let  rateUsbtn: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("Rate Us", for: .normal)
        lineView.setTitleColor(UIColor.black, for: .normal)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuprateUsbtn(){
        view.addSubview(rateUsbtn)
        
        rateUsbtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        rateUsbtn.bottomAnchor.constraint(equalTo: messagelbl.topAnchor, constant: -20).isActive = true
        rateUsbtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        rateUsbtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    
    
    let  messagelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Thank you for your order.You can also check status of your order through my account section."
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        lineView.textAlignment = .center
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupmessagelbl(){
        view.addSubview(messagelbl)
        messagelbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messagelbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        messagelbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        messagelbl.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    


}
