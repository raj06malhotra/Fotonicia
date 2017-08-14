//
//  selectPhotoCell.swift
//  Fotonicia
//
//  Created by sawan on 18/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit



class selectPhotoCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 3.0
            self.layer.borderColor = isSelected ? UIColor.black.cgColor : UIColor.clear.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        backgroundColor = UIColor.bgColor
        
       
        setupitemimg()
        
        
        
    }
    
    
    
    let itemimg: UIImageView = {
        let lineView = UIImageView()
        
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
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

