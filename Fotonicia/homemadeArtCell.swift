//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Kingfisher
class homemadeArtCell: UICollectionViewCell  {
    
    var delegate : homeMadeArtDelegate?
    var index :Int?
    var sub_categoryarray = [sub_category]()
    
    var collectioView: UICollectionView?
    
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
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        collectioView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectioView?.backgroundColor = .clear
        
        
        flowlayout.scrollDirection = .horizontal
        collectioView?.showsHorizontalScrollIndicator = false
        collectioView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectioView!)
        collectioView?.register(innerhomemadeArtCell.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.isPagingEnabled = true
        flowlayout.minimumInteritemSpacing = 5
        flowlayout.minimumLineSpacing = 5
        collectioView?.topAnchor.constraint(equalTo: categorytitle.bottomAnchor, constant: 25).isActive = true
        collectioView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectioView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectioView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
    
   
    
    func handleViewAll(sender: UIButton){
        
        delegate?.viewall_hma_BtnDidTap(cell: self)
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
        lineView.text = "Home Made Art"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .left
        lineView.textColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcategorytitle(){
        addSubview(categorytitle)
        categorytitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        categorytitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        categorytitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        categorytitle.heightAnchor.constraint(equalToConstant: 24).isActive = true
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



extension homemadeArtCell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sub_categoryarray.count > 0 ? sub_categoryarray.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! innerhomemadeArtCell
        cell.layer.cornerRadius = 2.6
        cell.layer.masksToBounds = true
        
       
            let img = sub_categoryarray[indexPath.item].image_url
            let url = URL(string: img!)
           let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.itemimg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
        
   
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 10, height: self.frame.height - 10)
    }
    
   
}






class innerhomemadeArtCell: UICollectionViewCell {
    
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
       

        setupitemimg()
        
    }
    

 
    
    
    let itemimg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds =  true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemimg(){
        addSubview(itemimg)
        
        itemimg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        itemimg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemimg.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        itemimg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
}



}












