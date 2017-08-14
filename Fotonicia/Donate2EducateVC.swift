//
//  Donate2EducateVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import UIFontComplete

class Donate2EducateVC:  UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.bgColor
        collectionView?.register(donate2eduateCell.self, forCellWithReuseIdentifier: "cell")
      
     
        navigationItem.title = "Donate 2 Educate "
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! donate2eduateCell
          cell.backgroundColor = UIColor.white

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return   CGSize(width: view.frame.width - 20, height: 300)
    }
    
    

}





class donate2eduateCell : UICollectionViewCell {
    

            
  
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
      
        setuplbl1()
        setupseperatorline()
        setupimage()
        setuplbl2()

    }

    
    
    let lbl1: UILabel = {
        let lineView = UILabel()
        lineView.text = "WHO ARE WE ?"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        
        let font = UIFont.fontAwesome(ofSize: 16)
        lineView.font = font
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplbl1(){
        addSubview(lbl1)
        lbl1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl1.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        lbl1.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        lbl1.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    let seperatorline: UIView = {
        let back = UIView()
        back.backgroundColor = UIColor.red
        back.layer.cornerRadius = 2.6
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupseperatorline(){
        addSubview(seperatorline)
        seperatorline.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        seperatorline.topAnchor.constraint(equalTo: lbl1.bottomAnchor,constant: 7).isActive = true
        seperatorline.widthAnchor.constraint(equalToConstant: 30).isActive = true
        seperatorline.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    
    let image: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleToFill
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupimage(){
        addSubview(image)
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: seperatorline.bottomAnchor, constant: 22).isActive = true
        image.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    let lbl2: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func setuplbl2(){
        addSubview(lbl2)
        lbl2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl2.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 7).isActive = true
        lbl2.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        lbl2.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    
}
