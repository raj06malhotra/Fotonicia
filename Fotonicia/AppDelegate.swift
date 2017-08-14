//
//  AppDelegate.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import IQKeyboardManagerSwift
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , GIDSignInDelegate {
   

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        IQKeyboardManager.sharedManager().enable = true
        window?.rootViewController = TabBarVC()
        
        UIApplication.shared.statusBarView?.backgroundColor = .white
        setupnavigation_apperance()
        setuptabbar_apperance()
        return true
    }
    
    func setupnavigation_apperance(){
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.black
        navigationBarAppearace.barTintColor = UIColor.white
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]
        navigationBarAppearace.shadowImage = UIImage()
        
        
    }
    
    func setuptabbar_apperance(){
        
        let navigationBarAppearace = UITabBar.appearance()
        navigationBarAppearace.tintColor = UIColor.navColor
        
        navigationBarAppearace.isTranslucent = false
        
        
        
        
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        let googleDidHandle = GIDSignIn.sharedInstance().handle(url,
                                                                sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                                annotation: [:])
        
        let facebookDidHandle = FBSDKApplicationDelegate.sharedInstance().application(app,open: url,sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,annotation:  options[UIApplicationOpenURLOptionsKey.annotation])
        
        
        return googleDidHandle || facebookDidHandle
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            
            
            let new = LogInVC()
            new.showAlertViewWithSingleButton(title: "Warning", message: error.localizedDescription)
            return
            
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                let new = LogInVC()
                new.showAlertViewWithSingleButton(title: "Warning", message: (error?.localizedDescription)!)
                return
            }
            
            guard let token =  GIDSignIn.sharedInstance().currentUser.authentication.accessToken else {return}
            
            let new = LogInVC()
            new.handleSociallogin(token: token, provider: "Google")
            
            
        }
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
        GIDSignIn.sharedInstance().signOut()
        
    }
    
    

}

