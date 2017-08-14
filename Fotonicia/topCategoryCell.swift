//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Kingfisher
class topCategoryCell: UICollectionViewCell {

    var delegate : topCategoryCell2Delegate?
    var topCategory = [array_category_details]()
    var collectioView: UICollectionView?
    var index :Int?
     let urlstring = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         setupviews()
        
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        
        setupCollectionView()
     
        
    }
    

    
    
    func setupCollectionView(){
    
    let flowlayout = UICollectionViewFlowLayout()
    
    
    collectioView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    collectioView?.backgroundColor = UIColor.white
    
    
    flowlayout.scrollDirection = .horizontal
    collectioView?.showsHorizontalScrollIndicator = false
    collectioView?.translatesAutoresizingMaskIntoConstraints = false
    addSubview(collectioView!)
    collectioView?.register(innertopCategoryCell.self, forCellWithReuseIdentifier: "cell")
    collectioView?.dataSource = self
    collectioView?.delegate = self
    collectioView?.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    collectioView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    collectioView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    collectioView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    collectioView?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
       
    }
    
    
    

    

    
}



extension topCategoryCell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topCategory.count > 0 ? topCategory.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! innertopCategoryCell
      
     
        if  let img = topCategory[indexPath.item].category_image {
            let url = URL(string: img)
            let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
        }
        
        if  let name = topCategory[indexPath.item].category_name {
            cell.categorylbl.text = name
        }
        
        
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
      print(print(indexPath.item))
    
    }
   
}






class innertopCategoryCell: UICollectionViewCell {
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        backgroundColor = UIColor.clear
      
       
        setupformImg()
        setupcategorylbl()
    }
    
    let categorylbl: UILabel = {
        let lineView = UILabel()
       
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.white
        lineView.numberOfLines = 0
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcategorylbl(){
        bgImg.addSubview(categorylbl)
        categorylbl.centerXAnchor.constraint(equalTo: bgImg.centerXAnchor).isActive = true
        categorylbl.centerYAnchor.constraint(equalTo: bgImg.centerYAnchor).isActive = true
        categorylbl.widthAnchor.constraint(equalTo: bgImg.widthAnchor, constant: -10).isActive = true
        categorylbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    
    let bgImg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.contentMode = .scaleToFill
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupformImg(){
        addSubview(bgImg)
        
        bgImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        bgImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bgImg.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        bgImg.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }

}

















