//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Kingfisher
class couponcell: UICollectionViewCell , ImageZoomInDelegate{
    
    var delegate : ImageZoomInDelegate2?
    var collectioView: UICollectionView?
    var couponArray = [array_coupons]()
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
        collectioView?.register(innercouponCell.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectioView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collectioView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collectioView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectioView?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    
    
    
    
    
}



extension couponcell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return couponArray.count > 0 ? couponArray.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! innercouponCell
        let img = couponArray[indexPath.item].coupon_image
        cell.delegate = self
        let url = URL(string: img!)
        let resource = ImageResource(downloadURL: url!, cacheKey: img)
        cell.formImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 70, height: 200)
    }
    
    func popUpImage(image: UIImageView) {
        delegate?.popUpImage(image: image)
    }
   
}






class innercouponCell: UICollectionViewCell {
    
    var delegate : ImageZoomInDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        backgroundColor = UIColor.white
        
        setupformImg()
    }
    
    
    
    
    lazy var formImg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.image = UIImage(named: "demoimg")
        lineView.contentMode = .scaleToFill
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleImage))
        tap.numberOfTapsRequired = 1
        lineView.addGestureRecognizer(tap)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupformImg(){
        addSubview(formImg)
        
        formImg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        formImg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        formImg.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        formImg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func handleImage(){
        
       delegate?.popUpImage(image: formImg)
    }
    
    
}

















