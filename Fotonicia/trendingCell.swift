//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Kingfisher
class trendingCell: UICollectionViewCell {
    
    
    var collectioView: UICollectionView?
      var trendingArray = [array_trending_items]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        setupbgImg()
        setupcategorytitle()
      
        setupCollectionView()
        
    }
 
    
    
    func setupCollectionView(){
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        collectioView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectioView?.backgroundColor = UIColor.clear
     
        flowlayout.scrollDirection = .horizontal
        collectioView?.showsHorizontalScrollIndicator = false
        collectioView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectioView!)
        collectioView?.register(innertrendingCell.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectioView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collectioView?.topAnchor.constraint(equalTo: categorytitle.bottomAnchor,constant: 50).isActive = true
        collectioView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectioView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        
        
    }
    
    
    let bgImg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupbgImg(){
        addSubview(bgImg)
        
        bgImg.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bgImg.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bgImg.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bgImg.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    let categorytitle: UILabel = {
        let lineView = UILabel()
        lineView.text = "Featured Category"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .left
        lineView.textColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcategorytitle(){
        addSubview(categorytitle)
        categorytitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        categorytitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        categorytitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        categorytitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    

 
    
}



extension trendingCell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingArray.count > 0 ? trendingArray.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! innertrendingCell
        
           let img = trendingArray[indexPath.item].item_image
            let url = URL(string: img!)
            let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.formImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 450)
    }
    
}






class innertrendingCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        backgroundView = bgImg
        setupcategorytitle()
        setupformImg()
        
    }
    
    
    let bgImg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.image = UIImage(named: "demoimg")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupbgImg(){
        addSubview(bgImg)
        
        bgImg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bgImg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bgImg.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bgImg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    
    let categorytitle: UILabel = {
        let lineView = UILabel()
        lineView.text = "Trending Category"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .left
        lineView.textColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcategorytitle(){
        addSubview(categorytitle)
        categorytitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        categorytitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        categorytitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        categorytitle.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    
    let formImg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupformImg(){
        addSubview(formImg)
        
        formImg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        formImg.topAnchor.constraint(equalTo: categorytitle.bottomAnchor, constant: 50 ).isActive = true
        formImg.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        formImg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
}

















