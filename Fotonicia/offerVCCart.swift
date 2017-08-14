//
//  offerVCCart.swift
//  Fotonicia
//
//  Created by shadman Alam on 03/08/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit


class offerVCCart:  UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    
    var array = [offer_detailed]()
    var selectedlbl = String()
    var slected = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getAPIOffer()
        
        collectionView?.backgroundColor = UIColor.bgColor
        collectionView?.register(offersCell1.self, forCellWithReuseIdentifier: "cell")
        navigationItem.title = "Offers"
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! offersCell1
        cell.backgroundColor = UIColor.white
        
        cell.lbl1.text = array[indexPath.item].offer_title
        cell.lbl2.text = array[indexPath.item].offer_description
        cell.lbl3.text = "Use coupon code \(array[indexPath.item].offer_coupon!) during checkout."
        let img = URL(string: array[indexPath.item].offer_coupon_image!)
        cell.image.kf.setImage(with: img, placeholder: UIImage(named: "placeholder"))
        
        cell.lbl4.text = array[indexPath.item].to_date
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return   CGSize(width: view.frame.width - 20, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        slected = indexPath.row
        selectedlbl = array[indexPath.row].offer_coupon!
        //self.performSegue(withIdentifier: "cartVC", sender: self)
         let back = cartVC()
    
        
        
    }
}

func prepare(for segue: UIStoryboardSegue, sender: Any?){

   
}



class offersCell1 : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
        setupimage()
        setuplbl1()
        setuplbl2()
        setuplbl3()
        setuplbl4()
    }
    
    
    
    let image: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.backgroundColor = UIColor.clear
        back.layer.cornerRadius = 2.6
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupimage(){
        addSubview(image)
        image.leftAnchor.constraint(equalTo: self.leftAnchor,constant:7).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 76).isActive = true
        image.heightAnchor.constraint(equalToConstant: 86).isActive = true
    }
    
    
    let lbl1: UILabel = {
        let lineView = UILabel()
        lineView.text = "Buy one get one free"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplbl1(){
        addSubview(lbl1)
        lbl1.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 7).isActive = true
        lbl1.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        lbl1.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        lbl1.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    let lbl2: UILabel = {
        let lineView = UILabel()
        lineView.text = "Buy one get one free"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 10)
        
        lineView.numberOfLines = 0
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplbl2(){
        addSubview(lbl2)
        lbl2.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 7).isActive = true
        lbl2.topAnchor.constraint(equalTo: lbl1.bottomAnchor, constant: 7).isActive = true
        lbl2.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        lbl2.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    
    
    let lbl3: UILabel = {
        let lineView = UILabel()
        lineView.text = "Valid till : NA"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 10)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplbl3(){
        addSubview(lbl3)
        lbl3.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 7).isActive = true
        lbl3.topAnchor.constraint(equalTo: lbl2.bottomAnchor, constant: 7).isActive = true
        lbl3.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        lbl3.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let lbl4: UILabel = {
        let lineView = UILabel()
        lineView.text = "Valid till"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplbl4(){
        addSubview(lbl4)
        lbl4.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 7).isActive = true
        lbl4.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        lbl4.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
        lbl4.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
}
