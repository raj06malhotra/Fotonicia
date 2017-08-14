//
//  myFanVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import SwiftyJSON


class myFanVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionview: UICollectionView!
    var collectionview1: UICollectionView!

    var myResponse  : JSON = []
    var array1 = [fan_image_details]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = UIColor.bgColor
     navigationItem.title = "OUR FANS"
        
//        collectionview1.isHidden = true
//        collectionview.isHidden = true
        
        setuptoplbl()
        setupPhotosbutton()
        setupVideosButton()
        setupcollectionview()
//        setupcollectionview1()
//    
        
       
        collectionview?.register(imagecell.self, forCellWithReuseIdentifier: "cell")
        collectionview1?.register(photovediocell.self, forCellWithReuseIdentifier: "cell1")
    
    }

    
    
    // MARK: Label Top
    
    let toplbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Let us know the exact details so we can come back to you rightvbudget and timelines"
        lineView.textColor = UIColor(red:0.40, green:0.79, blue:0.80, alpha:1.0)
        lineView.textAlignment = .center
        lineView.numberOfLines = 2
        
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptoplbl(){
        view.addSubview(toplbl)
        toplbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toplbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        toplbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        toplbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    
    // MARK : PHOTOS BUtton
    
    lazy var photosbtn: UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("PHOTOS", for: UIControlState.normal)
        btn.backgroundColor = UIColor.buttoncolor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(photosbtnaction), for: UIControlEvents.touchUpInside)
        
        
        return btn
        
    }()
    
    func photosbtnaction(){
        
        
        if collectionview.isHidden {
            
            collectionview.isHidden = false
            
        }
        else
        {
            collectionview.isHidden = true
            
        }
        
        fansImageApi()
        
        
    }
    
    func setupPhotosbutton(){
        
        view.addSubview(photosbtn)
        photosbtn.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        photosbtn.topAnchor.constraint(equalTo: toplbl.bottomAnchor).isActive = true
        photosbtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        photosbtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        
    }
    
    
    //MARK Videos Button
    lazy var videosbtn: UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("VIDEOS", for: UIControlState.normal)
        btn.backgroundColor = UIColor.buttoncolor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(videosbtnaction), for: UIControlEvents.touchUpInside)
        
        
        return btn
        
    }()
    
    func videosbtnaction(){
        
        if collectionview1.isHidden {
        
        collectionview1.isHidden = false
        
        }
        else
        {
        collectionview1.isHidden = true
        
        }
        
        
        fansVideoApi()
    }
    
    func setupVideosButton(){
        
        view.addSubview(videosbtn)
        videosbtn.leftAnchor.constraint(equalTo: photosbtn.rightAnchor).isActive = true
        videosbtn.topAnchor.constraint(equalTo: toplbl.bottomAnchor).isActive = true
        videosbtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        videosbtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        
    }

    
    func setupcollectionview(){
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.backgroundColor = UIColor.bgColor
        collectionview.showsVerticalScrollIndicator = false
        collectionview.showsHorizontalScrollIndicator = true
        collectionview.isUserInteractionEnabled = true
        
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 2
        flowlayout.minimumInteritemSpacing = 2
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionview)
        collectionview.register(imagecell.self, forCellWithReuseIdentifier: "cell")
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.isPrefetchingEnabled = true
        collectionview.isPagingEnabled = true
        
        collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionview.topAnchor.constraint(equalTo: photosbtn.bottomAnchor).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
    }

    
    
    
    
//    
//    func setupcollectionview1(){
//        
//        let flowlayout = UICollectionViewFlowLayout()
//        
//        
//        collectionview1 = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
//        collectionview1.backgroundColor = UIColor.bgColor
//        collectionview1.showsVerticalScrollIndicator = false
//        collectionview1.showsHorizontalScrollIndicator = true
//        collectionview1.isUserInteractionEnabled = true
//        
//        flowlayout.scrollDirection = .vertical
//        flowlayout.minimumLineSpacing = 2
//        flowlayout.minimumInteritemSpacing = 2
//        collectionview1.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(collectionview1)
//        collectionview1.register(photovediocell.self, forCellWithReuseIdentifier: "cell1")
//        collectionview1.dataSource = self
//        collectionview1.delegate = self
//        collectionview1.isPrefetchingEnabled = true
//        collectionview1.isPagingEnabled = true
//        
//        collectionview1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        collectionview1.topAnchor.constraint(equalTo: photosbtn.bottomAnchor).isActive = true
//        collectionview1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        collectionview1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        
//        
//        
//    }

    
    
    
    
}


extension myFanVC{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
            
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imagecell
            
            
            //        let url = URL(string: array1[indexPath.item].image_url!)
            //        cell.imageview.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))
            
            cell.imageview.image = UIImage(named: "2")
            
            cell.backgroundColor = UIColor.brown
            return cell
            
            
        
        
//        else{
//        
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! photovediocell
//            
//            
//            //        let url = URL(string: array1[indexPath.item].image_url!)
//            //        cell.imageview.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))
//            
//            cell.imageview.image = UIImage(named: "2")
//            
//            cell.backgroundColor = UIColor.brown
//            return cell
//
//        
//        
//        }
//        
 
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 150)
        
    }










}


class imagecell: UICollectionViewCell {
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setuploadviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuploadviews(){
    setimageview()
    
    
    }

    
    
    let imageview : UIImageView = {
    
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
        
    let img = UIImage(named: "2")
       image.image = img
    
    
    return image
    }()
    
    func setimageview(){
    
        addSubview(imageview)
        imageview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageview.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    
    }
    
    
}


class photovediocell: UICollectionViewCell {
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setuploadviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuploadviews(){
        setimageview()
        
        
    }
    
    
    
    let imageview : UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let img = UIImage(named: "2")
        image.image = img
        
        
        return image
    }()
    
    func setimageview(){
        
        addSubview(imageview)
        imageview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageview.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    
}
