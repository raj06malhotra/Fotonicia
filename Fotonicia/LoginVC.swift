//
//  LoginVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit


class LogInVC: UIViewController, UIScrollViewDelegate, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Login"
        
        fbBtn.delegate = self
        
        setupScrollView()
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 20)
        scrollView.addSubview(viewOnScroll)
        setupviewOnScroll()
        
        viewOnScroll.addSubview(fbBtn)
        setupfbBtn()
        viewOnScroll.addSubview(googleButton)
        setupgoogleButton()
        viewOnScroll.addSubview(emailBox)
        setupemailBox()
        viewOnScroll.addSubview(line)
        setupLine()
        viewOnScroll.addSubview(passwordBox)
        setuppasswordBox()
        viewOnScroll.addSubview(line2)
        setupLine2()
        viewOnScroll.addSubview(loginButton)
        setuploginButton()
        viewOnScroll.addSubview(line3)
        setupLine3()
        viewOnScroll.addSubview(forgotPasswordButton)
        setupforgotPasswordButton()
        viewOnScroll.addSubview(newUserButton)
        setupnewUserButton()
        viewOnScroll.addSubview(conditionlayer)
        setupconditionlayer()
        
        GIDSignIn.sharedInstance().uiDelegate = self
       
     
       
        
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
    
    
    
    //MARK: products button
    lazy var fbBtn:FBSDKLoginButton = {
        let Btn = FBSDKLoginButton()
        Btn.translatesAutoresizingMaskIntoConstraints = false
        return Btn
    }()
    
  
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error)
            return
        }
        
        
        guard let uid = FBSDKAccessToken.current().tokenString else {return}
        guard let name = FBSDKProfile.current().firstName else {return}
        guard let last = FBSDKProfile.current().lastName else {return}
        UserDefaults.setUserName(userName: "\(name) \(last)")
        print(uid)
        guard let first_name_letter = FBSDKProfile.current().firstName.characters.first else {return}
        guard let last_name_letter = FBSDKProfile.current().lastName.characters.first else {return}
        UserDefaults.setUserName_first(userName: first_name_letter)
        UserDefaults.setUserName_last(userName: last_name_letter)
        handleSociallogin(token: uid, provider: "facebook")
        
        
    }
    
    
    
    func setupfbBtn(){
        
        fbBtn.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        fbBtn.topAnchor.constraint(equalTo: viewOnScroll.topAnchor,constant: 50).isActive = true
        fbBtn.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -30).isActive = true
        fbBtn.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
    }
    //MARK: products button
    lazy var googleButton:GIDSignInButton = {
        let Btn = GIDSignInButton()
        Btn.addTarget(self, action: #selector(handlegoogleSignIn), for: .touchUpInside)
        Btn.translatesAutoresizingMaskIntoConstraints = false
        return Btn
    }()
    
    
    
    
    func setupgoogleButton(){
        
        googleButton.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        googleButton.topAnchor.constraint(equalTo: fbBtn.bottomAnchor,constant: 20).isActive = true
        googleButton.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -30).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
    }
    
    // MARK: create email textfield  box
    
    let emailBox : UITextField = {
        let contactField = UITextField()
        contactField.placeholder = "Email or Mobile Number"
        contactField.font = .systemFont(ofSize: 16)
        contactField.backgroundColor = UIColor.clear
        contactField.keyboardType = .emailAddress
        contactField.autocapitalizationType = .none
        contactField.layer.borderWidth = 0
        contactField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        contactField.layer.cornerRadius = 2.6
        
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setupemailBox() {
        
        emailBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        emailBox.topAnchor.constraint(equalTo: googleButton.bottomAnchor,constant: 25).isActive = true
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
        contactField.keyboardType = .numbersAndPunctuation
        contactField.autocapitalizationType = .none
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }()
    
    func setuppasswordBox() {
        
        passwordBox.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        passwordBox.topAnchor.constraint(equalTo: line.topAnchor,constant: 24).isActive = true
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
    
    //MARK: send button
    lazy var loginButton:UIButton = {
        
        let readBtn = UIButton()
        readBtn.backgroundColor = UIColor.btnColor
        readBtn.setTitle("Log in", for: .normal)
        readBtn.titleLabel?.font = .systemFont(ofSize: 20)
        readBtn.setTitleColor(UIColor.white, for: .normal)
        readBtn.layer.cornerRadius = 2.6
        readBtn.isUserInteractionEnabled = true
        readBtn.addTarget(self, action: #selector(handlelogin), for: .touchUpInside)
        readBtn.translatesAutoresizingMaskIntoConstraints = false
        return readBtn
    }()
    
    
    func setuploginButton(){
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: line2.bottomAnchor,constant: 30).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -34).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    //MARK: line view
    
    
    let line3: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupLine3(){
        
        line3.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        line3.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 14).isActive = true
        line3.widthAnchor.constraint(equalToConstant: 1).isActive = true
        line3.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //MARK: forgot button
    lazy var forgotPasswordButton:UIButton = {
        
        let readBtn = UIButton()
        readBtn.backgroundColor = UIColor.clear
        readBtn.setTitle("Forgot Password ", for: .normal)
        readBtn.titleLabel?.font = .systemFont(ofSize: 14)
        readBtn.setTitleColor(UIColor.gray, for: .normal)
        readBtn.layer.cornerRadius = 2.6
        readBtn.isUserInteractionEnabled = true
        readBtn.addTarget(self, action: #selector(forgotAction), for: .touchUpInside)
        readBtn.translatesAutoresizingMaskIntoConstraints = false
        return readBtn
    }()
   
    
    func setupforgotPasswordButton(){
        
        forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 15).isActive = true
        forgotPasswordButton.rightAnchor.constraint(equalTo: line3.leftAnchor,constant: 0).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/2,constant: -15).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    //MARK: new user button
    lazy var newUserButton:UIButton = {
        
        let readBtn = UIButton()
        readBtn.backgroundColor = UIColor.clear
        readBtn.setTitle("New user ? Sign up", for: .normal)
        readBtn.titleLabel?.font = .systemFont(ofSize: 14)
        readBtn.setTitleColor(UIColor.gray, for: .normal)
        readBtn.layer.cornerRadius = 2.6
        readBtn.isUserInteractionEnabled = true
        readBtn.addTarget(self, action: #selector(newuserAction), for: .touchUpInside)
        readBtn.translatesAutoresizingMaskIntoConstraints = false
        return readBtn
    }()
    
    func newuserAction(){
        
     
        let new = SignUpVC()
       self.navigationController?.pushViewController(new, animated: true)
        

        
    }
    
    func setupnewUserButton(){
        
        newUserButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 15).isActive = true
        newUserButton.leftAnchor.constraint(equalTo: line3.rightAnchor,constant: 0).isActive = true
        newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/2,constant: 0).isActive = true
        newUserButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    //MARK: create name label
    let conditionlayer:UILabel = {
        let name = UILabel()
        name.text = "By signing in, you agree to Fotonicia’s Term & Conditions and Privacy Policy"
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        name.backgroundColor = UIColor.clear
        name.font = .boldSystemFont(ofSize: 14)
        name.textColor = UIColor.gray
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    func setupconditionlayer(){
        
        conditionlayer.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        conditionlayer.bottomAnchor.constraint(equalTo: viewOnScroll.bottomAnchor,constant: -10).isActive = true
        conditionlayer.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor,constant: -30).isActive = true
        conditionlayer.heightAnchor.constraint(equalTo: conditionlayer.heightAnchor).isActive = true
        
    }
    
}
