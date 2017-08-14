//
//  ChildLayoutCollectionCell.swift
//  Personalisation
//
//  Created by shadman Alam on 16/07/17.
//  Copyright © 2017 FOTONICIA. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ChildCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , layoutSelectDelegate{
    
    var delegate : layoutSelectDelegate2?
    
    var childcollectionview: UICollectionView!
    var array = [layout_details]()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
      
        setupbottomview()
        setupproductlbl()
        setviews()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setviews(){
        setupCollectionView()
        self.childcollectionview.reloadData()
        
    }
    
    
    
    let lblproduct: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        lbl.text = "Classic"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 2
        return lbl
        
    }()
    
    func setupproductlbl(){
        bottomview.addSubview(lblproduct)
     
        lblproduct.leftAnchor.constraint(equalTo: bottomview.leftAnchor).isActive = true
        lblproduct.centerYAnchor.constraint(equalTo: bottomview.centerYAnchor).isActive = true
        lblproduct.widthAnchor.constraint(equalTo: lblproduct.widthAnchor).isActive = true
        lblproduct.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    
    // creating BottomView
    
    let bottomview:UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupbottomview(){
        addSubview(bottomview)
        
        bottomview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomview.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        bottomview.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        bottomview.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    
    
    func setupCollectionView(){
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        childcollectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        childcollectionview?.backgroundColor = UIColor.bgColor
        flowlayout.scrollDirection = .horizontal
       
        childcollectionview?.showsHorizontalScrollIndicator = false
        childcollectionview?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(childcollectionview!)
        childcollectionview?.register(childunderchildcell.self, forCellWithReuseIdentifier: "cell2")
        childcollectionview?.dataSource = self
        childcollectionview?.delegate = self
        childcollectionview?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        childcollectionview?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        childcollectionview?.topAnchor.constraint(equalTo: bottomview.bottomAnchor).isActive = true
        childcollectionview?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        childcollectionview?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
       
    }
    
    
}
extension ChildCollectionViewCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count > 0 ? array.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! childunderchildcell
        if let img = URL(string: array[indexPath.item].thumbnail!){
        cell.imageviewr.kf.setImage(with: img, placeholder: UIImage(named: "placeholder"))
        }
        
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
 
    func sendlayout(cell: childunderchildcell) {
       let indexPath = self.childcollectionview?.indexPathForItem(at: cell.center)
        delegate?.sendlayout(cell: self, img:  array[(indexPath?.item)!].thumbnail!, layout_id: array[(indexPath?.item)!].layout_id!)
    }
  
    
}

class childunderchildcell: UICollectionViewCell {
    
    
    var delegate:layoutSelectDelegate?
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        settt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func settt(){
        setupimage()
    }
    
    lazy var imageviewr: UIImageView = {
        let imagef = UIImageView()
        imagef.translatesAutoresizingMaskIntoConstraints = false
        imagef.image = UIImage(named: "demoimg")
        imagef.contentMode = .scaleToFill
        imagef.layer.cornerRadius = 2.6
        
        imagef.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleselect))
        tap.numberOfTapsRequired = 1
        imagef.addGestureRecognizer(tap)
        return imagef
        
    }()
    
    func handleselect(sender: UITapGestureRecognizer){
        
        delegate?.sendlayout(cell: self)
    }
    
    func setupimage(){
        addSubview(imageviewr)
        
        imageviewr.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageviewr.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageviewr.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageviewr.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        
       
        
    }
    
    
    
}

