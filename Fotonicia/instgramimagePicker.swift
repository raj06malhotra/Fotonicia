//
//  instgramimagePicker.swift
//  Fotonicia
//
//  Created by sawan on 18/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit


class instgramimagePickerVC:  UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var token:String?
     var instaimgArray = [instgramImageModel]()
    
    var selectedInstaImage = [instgramImageModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView?.backgroundColor = UIColor.bgColor
        navigationItem.title = "Instagram Gallery"
        collectionView?.register(selectPhotoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.allowsMultipleSelection = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handledone))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPhotos(token: token!)
    }
    
    func handledone(){
        self.dismiss(animated: true, completion: nil)
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return instaimgArray.count > 0 ? instaimgArray.count : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! selectPhotoCell
       
       
        let url = URL(string:  instaimgArray[indexPath.item].img!)
        cell.itemimg.kf.indicatorType = .activity
        cell.itemimg.kf.setImage(with: url)
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 5.0, height: self.view.frame.size.width / 5.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        if let selectedItems = collectionView.indexPathsForSelectedItems {
           
          
            if selectedItems.contains(indexPath) {
                collectionView.deselectItem(at: indexPath, animated: true)
                return false
            }
        }
        return true
    }
    
  
}
