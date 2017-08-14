//
//  featuredCategoryDetailCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.


import UIKit



class photoPrintCell: UICollectionViewCell {
    
    
    
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
        setuptextview()
        setupphototypelbll()
        setuppricelbl()
        
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
        
        itemimg.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        itemimg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemimg.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        itemimg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    
    let textview: UIView = {
        let lineView = UIView()
        
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptextview(){
        itemimg.addSubview(textview)
        
        textview.centerXAnchor.constraint(equalTo: itemimg.centerXAnchor).isActive = true
        textview.centerYAnchor.constraint(equalTo: itemimg.centerYAnchor).isActive = true
        textview.widthAnchor.constraint(equalTo: itemimg.widthAnchor, multiplier: 1/2).isActive = true
        textview.heightAnchor.constraint(equalTo: itemimg.heightAnchor, multiplier: 1/2).isActive = true
    }
    let phototypelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "CLASSIC"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        
        lineView.lineBreakMode = .byWordWrapping
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupphototypelbll(){
        textview.addSubview(phototypelbl)
        phototypelbl.centerXAnchor.constraint(equalTo: textview.centerXAnchor).isActive = true
        phototypelbl.centerYAnchor.constraint(equalTo: textview.centerYAnchor).isActive = true
        phototypelbl.widthAnchor.constraint(equalTo: textview.widthAnchor, multiplier: 1/2).isActive = true
        phototypelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let pricelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Price Starting at Rs. 200"
        lineView.font = UIFont.boldSystemFont(ofSize: 12)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        
        lineView.lineBreakMode = .byWordWrapping
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuppricelbl(){
        textview.addSubview(pricelbl)
        pricelbl.centerXAnchor.constraint(equalTo: textview.centerXAnchor).isActive = true
        pricelbl.topAnchor.constraint(equalTo: phototypelbl.bottomAnchor, constant: 7).isActive = true
        pricelbl.widthAnchor.constraint(equalTo: textview.widthAnchor, constant: -5).isActive = true
        pricelbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
}
