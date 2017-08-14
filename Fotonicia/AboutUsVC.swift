//
//  AboutUsVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

import UIFontComplete

import SwiftyJSON



class aboutVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var array = [cms_element_details]()
    
    var myResponse  : JSON = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getAboutAPI()
        navigationItem.title = "About Us"
        collectionView?.backgroundColor = UIColor.bgColor
        collectionView?.register(donate2eduateCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
 
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count > 0 ? array.count : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! donate2eduateCell
        cell.backgroundColor = UIColor.white
        cell.applyBottomShadow()
        
        if let title = array[indexPath.item].title {
            cell.lbl1.text = title
        }
        if let desc = array[indexPath.item].description1 {
            cell.lbl2.text = desc
        }
        
        if let url = URL(string: array[indexPath.item].image!){
            cell.image.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = array[indexPath.item].description1 {
            
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width - 10, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight: CGFloat = 212
            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 24)
        }
        
        
        return   CGSize(width: view.frame.width - 10, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    

}

























