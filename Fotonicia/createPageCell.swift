//
//  createPageCell.swift
//  Fotonicia
//
//  Created by sawan on 19/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit



class createPageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setuploadviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setuploadviews(){
        
        setupfillerimg()
        
    }
    
    let img: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupfillerimg(){
        addSubview(img)
        
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        img.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        img.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    
    
}
