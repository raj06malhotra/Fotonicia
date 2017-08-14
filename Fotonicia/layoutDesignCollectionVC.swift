//
//  layoutDesignCollectionVC.swift
//  Fotonicia
//
//  Created by sawan on 21/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class layoutDesignCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var array = [tier_element]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(array.count)
        collectionView?.backgroundColor = UIColor.bgColor
        self.collectionView!.register(personalisationCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView?.reloadData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count > 0 ? array.count : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! personalisationCell
        cell.backgroundColor = UIColor.white
        cell.applyShadow()
        print(array[indexPath.item].height)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 300)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let new = PersonalisationVC()
        self.navigationController?.pushViewController(new, animated: true)
    }
    

   }





class personalisationCell : UICollectionViewCell {
    
    
    
    let width = UIScreen.main.bounds.width
    let framImg = UIImageView()
    var elements = [UIView]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupload()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupload(){
       
        let baseimg = UIImage(named: "Base Layout")
        let basaeimg_Width = 3600
        let basaeimg_Height = 2400
        
        setupframImg(width: CGFloat(basaeimg_Width), height: CGFloat(basaeimg_Height), img: baseimg!)
        
        setupbgView()
        setupeditIcon()
        setupframeView()
        
  
        
    }
    
    
    
    let editIcon: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.image = UIImage(named: "edit-1")
        lineView.contentMode = .scaleAspectFit
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupeditIcon(){
        bgView.addSubview(editIcon)
        
        editIcon.rightAnchor.constraint(equalTo: bgView.rightAnchor,constant: -15).isActive = true
        editIcon.topAnchor.constraint(equalTo: bgView.topAnchor,constant: 5).isActive = true
        editIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        editIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func setupframImg(width:CGFloat, height:CGFloat, img:UIImage){
        
        var numberOfElementArray = [[118.11, 118.14, 2250.30, 1058.22],[2415.75, 118.11, 1066.14, 1058.25],[118.11, 1223.64, 1066.14, 1058.25],[1231.50, 1223.64, 2250.39, 1058.25]]
        
        if width > height {
            
            let newWidth = screenwidth
            let newHeight = (screenwidth / width) * height
            
            
            framImg.isUserInteractionEnabled = true
            framImg.image = img
            framImg.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(framImg)
            framImg.centerXAnchor.constraint(equalTo: frameView.centerXAnchor).isActive = true
            framImg.centerYAnchor.constraint(equalTo: frameView.centerYAnchor).isActive = true
            framImg.widthAnchor.constraint(equalToConstant: newWidth).isActive = true
            framImg.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
            
            
            for j in 0..<numberOfElementArray.count {
                
                print(numberOfElementArray[j].description)
                
                
                
                setupElemetView(x: CGFloat(numberOfElementArray[j][0]), y:  CGFloat(numberOfElementArray[j][1]), width: CGFloat(numberOfElementArray[j][2]), height: CGFloat(numberOfElementArray[j][3]), newBaseLayout_Width: newWidth, oldBaseLayout_Width: width, newBaseLayout_Height: newHeight, oldBaseLayout_Height: height)
                
            }
            
            
            
        }
        
        if width < height {
            
            let newWidth = ((screenheight / 2)  /  height) * width
            let newHeight = (screenheight / 2)
            
            
            framImg.isUserInteractionEnabled = true
            framImg.image = img
            framImg.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(framImg)
            framImg.centerXAnchor.constraint(equalTo: frameView.centerXAnchor).isActive = true
            framImg.centerYAnchor.constraint(equalTo: frameView.centerYAnchor).isActive = true
            framImg.widthAnchor.constraint(equalToConstant: newWidth).isActive = true
            framImg.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
            
            for j in 0..<numberOfElementArray.count {
                
                print(numberOfElementArray[j].description)
                
                
                
                setupElemetView(x: CGFloat(numberOfElementArray[j][0]), y:  CGFloat(numberOfElementArray[j][1]), width: CGFloat(numberOfElementArray[j][2]), height: CGFloat(numberOfElementArray[j][3]), newBaseLayout_Width: newWidth, oldBaseLayout_Width: width, newBaseLayout_Height: newHeight, oldBaseLayout_Height: height)
                
            }
            
        }
        
    }
    
    
    func setupElemetView(x: CGFloat, y: CGFloat, width:CGFloat, height:CGFloat,newBaseLayout_Width:CGFloat, oldBaseLayout_Width:CGFloat, newBaseLayout_Height:CGFloat, oldBaseLayout_Height:CGFloat){
        
        
        let ratio_Width = (newBaseLayout_Width / oldBaseLayout_Width)
        let ratio_Height = (newBaseLayout_Height / oldBaseLayout_Height)
        
        let newX = x * ratio_Width
        let newY = y * ratio_Height
        
        let newWidth = width * ratio_Width
        let newHeight = height * ratio_Height
        
        
        let elementView = UIView()
        elementView.frame  = CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
        elementView.isUserInteractionEnabled = true
        elementView.backgroundColor = UIColor.green
        framImg.addSubview(elementView)
        elements.append(elementView)
        
    }
    
    func setupChoosenImage(width:CGFloat, height:CGFloat){
        
        // if width < height {
        
        //            let newWidth = ElementWidth
        //            let newHeight =
        //
        
        let img = UIImageView()
        img.frame  = CGRect(x: 0 , y: 0, width: width, height:height)
        img.isUserInteractionEnabled = true
        img.backgroundColor = UIColor.red
        elements[0].addSubview(img)
        
        
        //}
        
        
    }
    
    
    
    
    let frameView: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupframeView(){
        bgView.addSubview(frameView)
        
        frameView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor).isActive = true
        frameView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        frameView.widthAnchor.constraint(equalTo: bgView.widthAnchor).isActive = true
        frameView.heightAnchor.constraint(equalTo: bgView.heightAnchor).isActive = true
    }
    
    
    
    let bgView: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.bgColor
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupbgView(){
        addSubview(bgView)
        
        bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bgView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    

    
}
