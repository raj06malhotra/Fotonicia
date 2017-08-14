//
//  featuredCategoryDetailCell.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.


import UIKit



class featuredCategoryDetailCell_odd: UICollectionViewCell {
    
   
    
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
        setupitemlbl()
        
        
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
        itemimg.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/1.5).isActive = true
        itemimg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    
    let textview: UIView = {
        let lineView = UIView()
        
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptextview(){
        addSubview(textview)
        
        textview.leftAnchor.constraint(equalTo: itemimg.rightAnchor).isActive = true
        textview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textview.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:1/2.5).isActive = true
        textview.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    let itemlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Dummy Text"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        
        lineView.lineBreakMode = .byWordWrapping
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemlbl(){
        textview.addSubview(itemlbl)
        itemlbl.leftAnchor.constraint(equalTo: textview.leftAnchor, constant: 5).isActive = true
        itemlbl.centerYAnchor.constraint(equalTo: textview.centerYAnchor).isActive = true
        itemlbl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        itemlbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
   }





class featuredCategoryDetailCell_even: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews(){
        backgroundColor = UIColor.bgColor
        
        setuptextview()
        setupitemimg()
    
        setupitemlbl()
        
        
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
        
        itemimg.leftAnchor.constraint(equalTo: textview.rightAnchor).isActive = true
        itemimg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemimg.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/1.5).isActive = true
        itemimg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    
    let textview: UIView = {
        let lineView = UIView()
        
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptextview(){
        addSubview(textview)
        
        textview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textview.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:1/2.5).isActive = true
        textview.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    let itemlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Dummy Text"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        
        lineView.lineBreakMode = .byWordWrapping
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemlbl(){
        textview.addSubview(itemlbl)
        itemlbl.centerXAnchor.constraint(equalTo: textview.centerXAnchor, constant: 0).isActive = true
        itemlbl.centerYAnchor.constraint(equalTo: textview.centerYAnchor).isActive = true
        itemlbl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        itemlbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
}
