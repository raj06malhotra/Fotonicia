//
//  FBAlbum.swift
//  FBImagePicker
//
//  Created by Stephen Radford on 31/01/2017.
//  Copyright © 2017 Cocoon Development Ltd. All rights reserved.
//

import Foundation
import Alamofire
import FBSDKCoreKit

/// Represents an album on Facebook
open class FBAlbum {
    
    /// The display name of the album
    public let name: String
    
    /// The ID of the Facebook album
    public let id: String
    
    /// The URL of cover photo for the album
    public var coverURL: String {
        guard let token = FBSDKAccessToken.current()?.tokenString else { return "" }
        return "https://graph.facebook.com/v2.8/\(id)/picture?type=thumbnail&access_token=\(token)"
    }
    
    /// A cached cover image
    public var coverImage: UIImage?
    
    /// Endpoint that's used to fetch photos for the album
    private var photosURL: String {
        return "\(id)/photos"
    }
    
    /// The next page to load
    private var nextPage: String?
    
    /// Construct a new Facebook album from JSON retreived from the API
    ///
    /// - Parameter json: The JSON object received from the API
    init(json: [String:Any]) {
        name = json["name"] as? String ?? ""
        id = json["id"] as? String ?? ""
    }
    
    /// Get photos for the album from the Graph API
    ///
    /// - Parameter completionHandler: The response handler
    func getPhotos(completionHandler: @escaping ([FBImage], Error?) -> Void) {
        
        guard let token = FBSDKAccessToken.current()?.tokenString else {
            completionHandler([], FBImagePickerError.badToken)
            return
        }
        
        FBSDKGraphRequest(graphPath: photosURL, parameters: ["fields": ""], httpMethod: "GET")
            .start { request, result, error in
                if let error = error {
                    completionHandler([], error)
                }
                
                guard let dict = result as? [String:Any], let photos = dict["data"] as? [[String:Any]] else {
                    completionHandler([], FBImagePickerError.parseJSON)
                    return
                }
                
                self.nextPage = (dict["paging"] as? [String:Any])?["next"] as? String
                
                let mapped = photos.map { json in
                    return FBImage(url: "https://graph.facebook.com/v2.8/\(json["id"] as! String)/picture?access_token=\(token)")
                }
                
                completionHandler(mapped, nil)
        }
        
    }
    
    /// Get the next page if there is one
    ///
    /// - Parameter completionHandler: The response handler
    func getNextPage(completionHandler: @escaping ([FBImage], Error?) -> Void) {
        
        guard let token = FBSDKAccessToken.current()?.tokenString else {
            completionHandler([], FBImagePickerError.badToken)
            return
        }
        
        guard let next = nextPage else {
            completionHandler([], FBImagePickerError.lastPage)
            return
        }
        
        Alamofire.request(next)
            .responseJSON { [unowned self] response in
                
                if let error = response.result.error {
                    completionHandler([], error)
                    return
                }
                
                guard let dict = response.result.value as? [String:Any], let photos = dict["data"] as? [[String:Any]] else { return }
                self.nextPage = (dict["paging"] as? [String:Any])?["next"] as? String
                
                let mapped = photos.map { json in
                    return FBImage(url: "https://graph.facebook.com/v2.8/\(json["id"] as! String)/picture?access_token=\(token)")
                }
                
                completionHandler(mapped, nil)
        }
        
    }
    
    /// Load the cover image from Facebook
    ///
    /// - Parameter completionHandler: The response handler
    public func getCoverImage(completionHandler: @escaping (UIImage?) -> Void) {
        guard coverImage == nil else {
            completionHandler(coverImage)
            return
        }
        
        Alamofire.request(coverURL)
            .responseData { [unowned self] response in
                guard let data = response.value else { return }
                self.coverImage = UIImage(data: data)
                completionHandler(self.coverImage)
        }
    }
    
}
