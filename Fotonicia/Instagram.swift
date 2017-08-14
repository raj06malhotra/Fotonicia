//
//  Instgram.swift
//  Fotonicia
//
//  Created by sawan on 18/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//
import UIKit
import Alamofire




class Instagram: UIViewController, UIWebViewDelegate {
    
   var loginWebView: UIWebView!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handledone))
        loginWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        loginWebView.allowsLinkPreview = true
        view.backgroundColor = UIColor.gray
        self.view.addSubview(loginWebView)
        
        loginWebView.delegate = self
 
        unSignedRequest()
        
    }
 
    
    func handledone(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
 
    //MARK: - unSignedRequest
    func unSignedRequest () {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [INSTAGRAM_IDS.INSTAGRAM_AUTHURL,INSTAGRAM_IDS.INSTAGRAM_CLIENT_ID,INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI, INSTAGRAM_IDS.INSTAGRAM_SCOPE ])
        let urlRequest =  URLRequest.init(url: URL.init(string: authURL)!)
        loginWebView.loadRequest(urlRequest)
    }
    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool {
        
        let requestURLString = (request.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
            return false;
        }
        return true
    }
    
    func handleAuth(authToken: String)  {
        
        UserDefaults.saveInsatgramAccessToken(token: authToken)
       
        self.dismiss(animated: true, completion: nil)

      
    }
    
    
    // MARK: - UIWebViewDelegate
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return checkRequestForCallbackURL(request: request)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
      startActivityIndicator()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
       stopActivityIndicator()
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        webViewDidFinishLoad(webView)
    }
    

    
 }





