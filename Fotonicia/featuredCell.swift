//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Kingfisher

class featuredCell: UICollectionViewCell {
    
    var delegate : featuredCategoryDelegate?
    var collectioView: UICollectionView?
    var index :Int?
    var gridLayout: GridLayout!
    var sub_categoryArray = [sub_category]()
 
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
        setupviewallbtn()
        setupCollectionView()
     
      
        
    }

    

    
    func setupCollectionView(){
         gridLayout = GridLayout()

        collectioView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: gridLayout)
        collectioView?.backgroundColor = UIColor.white
        collectioView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectioView!)
        collectioView?.register(innerfeaturedcell.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.applyBottomShadow()
        collectioView?.layer.cornerRadius = 2.6
        collectioView?.layer.masksToBounds = true

        collectioView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        collectioView?.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
        collectioView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        collectioView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true

        
    }
    
    
    func handleViewAll(sender: UIButton){
        
        delegate?.viewallBtnDidTap(cell: self)
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
    
    
    
    lazy var viewallbtn: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("View All", for: .normal)
        lineView.setTitleColor(UIColor.black, for: .normal)
        lineView.backgroundColor = UIColor.bgColor
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds =  true
      
        lineView.titleLabel?.font = .systemFont(ofSize: 9, weight: 0.5)
        lineView.addTarget(self, action: #selector(handleViewAll), for: .touchUpInside)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupviewallbtn(){
        addSubview(viewallbtn)
        viewallbtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        viewallbtn.centerYAnchor.constraint(equalTo: categorytitle.centerYAnchor).isActive = true
        viewallbtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        viewallbtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    

    
}



extension featuredCell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sub_categoryArray.count > 0 ? sub_categoryArray.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! innerfeaturedcell
        
        
       
       let name = sub_categoryArray[indexPath.item].name ?? ""
            cell.itemlbl1.text = name
        
        let img = sub_categoryArray[indexPath.item].image_url
           let url = URL(string: img!)
         let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.itemimg1.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
     
   
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
     
        return CGSize(width: (screenWidth/2)-4, height: (screenWidth/2) - 25)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
}






class innerfeaturedcell: UICollectionViewCell {
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
        
       
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    func setupviews(){
        

        setupitemimg1()
       setupitemlbl1()
        

    }
    
    

    
    
    let itemimg1: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.green
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemimg1(){
        addSubview(itemimg1)
        
        itemimg1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        itemimg1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        itemimg1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        itemimg1.heightAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
    }
    
    let itemlbl1: UILabel = {
        let lineView = UILabel()
        lineView.text = "Text"
        lineView.font = UIFont.boldSystemFont(ofSize: 14)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemlbl1(){
        addSubview(itemlbl1)
        itemlbl1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        itemlbl1.topAnchor.constraint(equalTo: itemimg1.bottomAnchor, constant: 2).isActive = true
        itemlbl1.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -5).isActive = true
        itemlbl1.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    
      
}

















