//
//  registerVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import LTHRadioButton

class SignUpVC: UIViewController, UIScrollViewDelegate {
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Sign up"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(handleRegister))
        setupScrollView()
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 20)
        scrollView.addSubview(viewOnScroll)
        setupviewOnScroll()
     
        viewOnScroll.addSubview(firstnameBox)
        setupfirstnameBox()
        viewOnScroll.addSubview(line3)
        setupline3()
        viewOnScroll.addSubview(lastnameBox)
        setuplastnameBox()
        viewOnScroll.addSubview(line4)
        setupline4()
        viewOnScroll.addSubview(emailBox)
        setupemailBox()
        viewOnScroll.addSubview(line)
        setupLine()
        viewOnScroll.addSubview(passwordBox)
        setuppasswordBox()
        viewOnScroll.addSubview(line2)
        setupLine2()
        viewOnScroll.addSubview(mobileNumberBox)
        setupmobileNumberBox()
        viewOnScroll.addSubview(line5)
        setupLine5()
        viewOnScroll.addSubview(malebtnview)
        setupmalebtnview()
        malebtnview.addSubview(maleradiobtn)
        setupmaleradiobtn()
        malebtnview.addSubview(malelbl)
        setupmalelbl()
        viewOnScroll.addSubview(femalebtnview)
        setupfemalebtnview()
       
        femalebtnview.addSubview(femalelbl)
        setupfemalelbl()
        femalebtnview.addSubview(femaleradiobtn)
        setupfemaleradiobtn()
//        view.addSubview(signUpButton)
//        setupsignUpButton()
        
       
        
        checkRegistrationComplete()
    }
    
    
    func checkRegistrationComplete(){
        
        if UserDefaults.getUserLoginStatus() {
            
            
            let alertController : UIAlertController = UIAlertController(title: "Warning", message: "You are already registered with us. If You would like sign up again first logout and come back.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default) { UIAlertAction in
                
               self.dismiss(animated: true, completion: nil)
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            

           
        }
        
    }
    
    func handleCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Scroll View
    
    lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.bgColor
        scroll.delegate = self
        scroll.isScrollEnabled = true
        scroll.isUserInteractionEnabled = true
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
        
    }()
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    //MARK: view on scroll
    
    let viewOnScroll:UIView = {
        let viewTop = UIView()
        viewTop.backgroundColor = UIColor.bgColor
        viewTop.translatesAutoresizingMaskIntoConstraints = false
        return viewTop
        
    }()
    
    func setupviewOnScroll(){
        
        viewOnScroll.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        viewOnScroll.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 5).isActive = true
        viewOnScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: 0).isActive = true
        viewOnScroll.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    

    
    // MARK: create first name textfield  box
    
    let firstnameBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "First name"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        //contactField.textAlignment = .center
        contactField.layer.borderWidth = 0
        contactField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        contactField.layer.cornerRadius = 2.6
        
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setupfirstnameBox() {
        
        firstnameBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        firstnameBox.topAnchor.constraint(equalTo: viewOnScroll.topAnchor,constant: 85).isActive = true
        firstnameBox.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -34).isActive = true
        firstnameBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //MARK: line view
    
    
    let line3: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupline3(){
        
        line3.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        line3.topAnchor.constraint(equalTo: firstnameBox.bottomAnchor).isActive = true
        line3.widthAnchor.constraint(equalTo: firstnameBox.widthAnchor).isActive = true
        line3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    // MARK: create first name textfield  box
    
    let lastnameBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "Last name"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        //contactField.textAlignment = .center
        contactField.layer.borderWidth = 0
        contactField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        contactField.layer.cornerRadius = 2.6
        
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setuplastnameBox() {
        
        lastnameBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        lastnameBox.topAnchor.constraint(equalTo: line3.bottomAnchor,constant: 24).isActive = true
        lastnameBox.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -34).isActive = true
        lastnameBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //MARK: line view
    
    
    let line4: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupline4(){
        
        line4.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        line4.topAnchor.constraint(equalTo: lastnameBox.bottomAnchor).isActive = true
        line4.widthAnchor.constraint(equalTo: lastnameBox.widthAnchor).isActive = true
        line4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    
    
    // MARK: create email textfield  box
    
    let emailBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "Email"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        //contactField.textAlignment = .center
        contactField.layer.borderWidth = 0
        contactField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        contactField.layer.cornerRadius = 2.6
        
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setupemailBox() {
        
        emailBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        emailBox.topAnchor.constraint(equalTo: line4.bottomAnchor,constant: 24).isActive = true
        emailBox.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -34).isActive = true
        emailBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //MARK: line view
    
    
    let line: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupLine(){
        
        line.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        line.topAnchor.constraint(equalTo: emailBox.bottomAnchor).isActive = true
        line.widthAnchor.constraint(equalTo: emailBox.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    
    // MARK: create password textfield  box
    
    let passwordBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "Password"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        contactField.isSecureTextEntry = true
        contactField.layer.borderWidth = 0
        contactField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        contactField.layer.cornerRadius = 2.6
        
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setuppasswordBox() {
        
        passwordBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        passwordBox.topAnchor.constraint(equalTo: line.bottomAnchor,constant: 24).isActive = true
        passwordBox.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -34).isActive = true
        passwordBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //MARK: line view
    
    
    let line2: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupLine2(){
        
        line2.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        line2.topAnchor.constraint(equalTo: passwordBox.bottomAnchor).isActive = true
        line2.widthAnchor.constraint(equalTo: passwordBox.widthAnchor).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // MARK: create mobile number textfield  box
    
    let mobileNumberBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "+91 - Mobile number"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        
        contactField.layer.borderWidth = 0
        contactField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        contactField.layer.cornerRadius = 2.6
        
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setupmobileNumberBox() {
        
        mobileNumberBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        mobileNumberBox.topAnchor.constraint(equalTo: line2.bottomAnchor,constant: 24).isActive = true
        mobileNumberBox.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -34).isActive = true
        mobileNumberBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //MARK: line view
    
    
    let line5: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupLine5(){
        
        line5.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        line5.topAnchor.constraint(equalTo: mobileNumberBox.bottomAnchor).isActive = true
        line5.widthAnchor.constraint(equalTo: mobileNumberBox.widthAnchor).isActive = true
        line5.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
    let malebtnview: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.clear
       lineView.isUserInteractionEnabled = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupmalebtnview(){
        
        malebtnview.leftAnchor.constraint(equalTo: viewOnScroll.leftAnchor, constant: 17).isActive = true
        malebtnview.topAnchor.constraint(equalTo: line5.bottomAnchor, constant: 24).isActive = true
        malebtnview.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor, multiplier: 1/2).isActive = true
        malebtnview.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    let maleradiobtn: LTHRadioButton = {
        let lineView = LTHRadioButton(radius: 18, selectedColor: .red, deselectedColor: nil)
        
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupmaleradiobtn(){
        
        maleradiobtn.leftAnchor.constraint(equalTo: malebtnview.leftAnchor).isActive = true
        maleradiobtn.centerYAnchor.constraint(equalTo: malebtnview.centerYAnchor).isActive = true
        maleradiobtn.widthAnchor.constraint(equalToConstant: maleradiobtn.frame.height).isActive = true
        maleradiobtn.heightAnchor.constraint(equalToConstant: maleradiobtn.frame.height).isActive = true
    }
    let malelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Male"
        lineView.textColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupmalelbl(){
        
        malelbl.leftAnchor.constraint(equalTo: maleradiobtn.rightAnchor, constant: 7).isActive = true
        malelbl.centerYAnchor.constraint(equalTo: malebtnview.centerYAnchor).isActive = true
        malelbl.widthAnchor.constraint(equalTo: malebtnview.widthAnchor, multiplier: 1/2).isActive = true
        malelbl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    let femalebtnview: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.clear
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupfemalebtnview(){
        
        femalebtnview.rightAnchor.constraint(equalTo: viewOnScroll.rightAnchor, constant: -17).isActive = true
        femalebtnview.topAnchor.constraint(equalTo: line5.bottomAnchor, constant: 24).isActive = true
        femalebtnview.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor, multiplier: 1/2).isActive = true
        femalebtnview.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    lazy var femaleradiobtn: LTHRadioButton = {
        let lineView = LTHRadioButton(radius: 18, selectedColor: .red, deselectedColor: nil)
   
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupfemaleradiobtn(){
        
        femaleradiobtn.rightAnchor.constraint(equalTo: femalelbl.leftAnchor, constant: -7).isActive = true
        femaleradiobtn.centerYAnchor.constraint(equalTo: femalebtnview.centerYAnchor).isActive = true
        femaleradiobtn.widthAnchor.constraint(equalToConstant: femaleradiobtn.frame.height).isActive = true
        femaleradiobtn.heightAnchor.constraint(equalToConstant: femaleradiobtn.frame.height).isActive = true
    }
    let femalelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Female"
        lineView.textColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupfemalelbl(){
        
        femalelbl.rightAnchor.constraint(equalTo: femalebtnview.rightAnchor, constant: 7).isActive = true
        femalelbl.centerYAnchor.constraint(equalTo: femalebtnview.centerYAnchor).isActive = true
        femalelbl.widthAnchor.constraint(equalTo: femalebtnview.widthAnchor, multiplier: 1/2).isActive = true
        femalelbl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    //MARK: send button
    lazy var signUpButton:UIButton = {
        
        let readBtn = UIButton()
        readBtn.backgroundColor = UIColor.btnColor
        readBtn.setTitle("Sign up", for: .normal)
        readBtn.titleLabel?.font = .systemFont(ofSize: 20)
        readBtn.setTitleColor(UIColor.white, for: .normal)
        readBtn.layer.cornerRadius = 2.6
        readBtn.isUserInteractionEnabled = true
        readBtn.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        readBtn.translatesAutoresizingMaskIntoConstraints = false
        return readBtn
    }()
    
    
    override func select(_ sender: Any?) {
        
        
        
        if (sender != nil) {
            return femaleradiobtn.select(animated: true)
        }
        
        femaleradiobtn.deselect(animated: false)

    }
    
    
  

  
    
    
    func updateprofile(){
      
    }
    
    func getGoogleSigInUserDetail(emailid:String,  name:String){
        
        
    }
    func setupsignUpButton(){
        
        signUpButton.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -17).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -34).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    
    
    
    
}
