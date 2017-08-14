//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Kingfisher

class formCell: UICollectionViewCell {
    
    var delegate : formCellDelegate?
    var formdata =  [array_forms]()
    var collectioView: UICollectionView?
    
   
    
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
        collectioView?.register(innerformCell.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectioView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collectioView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collectioView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectioView?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    


    
    
}



extension formCell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return formdata.count > 0 ? formdata.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! innerformCell
        
        cell.formImg.kf.indicatorType = .activity
        if  let img = formdata[indexPath.item].form_image{
            let url = URL(string: img)
            let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.formImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 70, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.BtnDidTap(cell: self, indexpath: indexPath.item)
        
        
    }
    
    
}






class innerformCell: UICollectionViewCell {
    
    
    
    
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
    
    
    
    
        let formImg: UIImageView = {
            let lineView = UIImageView()
            lineView.isUserInteractionEnabled = true
            lineView.backgroundColor = UIColor.black
            lineView.layer.cornerRadius = 2.6
            lineView.layer.masksToBounds = true
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
    
    
}

















