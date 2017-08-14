//
//  topCategoryCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class fillerCell: UICollectionViewCell {
    
    
    
    var collectioView: UICollectionView?
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        
     setupfillerimg()
        
        
    }
    
  

    
    let fillerimg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupfillerimg(){
        addSubview(fillerimg)
        
        fillerimg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fillerimg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        fillerimg.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -10).isActive = true
        fillerimg.heightAnchor.constraint(equalTo: self.heightAnchor,constant: -10).isActive = true
    }

    
    
    
}

























