//
//  featuredDetailCategoryVC.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class featuredDetailCategoryVC: UIViewController {

    var collectioView: UICollectionView?
    var newtitle : String?
    
   var array = [sub_category__details]()
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = newtitle ?? ""
        view.backgroundColor = UIColor.bgColor
        setuptopimg()
        setupCollectionView()
       
        if let indexo = index {
            
        getDashboard(index: indexo)
            
        }
        
        setupnavigationbackbtn()
        
        
     
    }

    func setupnavigationbackbtn(){
        
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
    }

    
    let topimg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptopimg(){
        view.addSubview(topimg)
        
        topimg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topimg.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        topimg.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -10).isActive = true
        topimg.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }


    
    func setupCollectionView(){
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        collectioView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectioView?.backgroundColor = UIColor.white
        
        
        flowlayout.scrollDirection = .vertical
        collectioView?.showsVerticalScrollIndicator = false
        collectioView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectioView!)
        collectioView?.register(featuredCategoryDetailCell_odd.self, forCellWithReuseIdentifier: "cell1")
         collectioView?.register(featuredCategoryDetailCell_even.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
        collectioView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectioView?.topAnchor.constraint(equalTo: topimg.bottomAnchor).isActive = true
        collectioView?.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        collectioView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
}




extension featuredDetailCategoryVC : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count > 0 ? array.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
   
       if indexPath.item % 2 == 1 {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! featuredCategoryDetailCell_odd
            cell.applyBottomShadow()
            
             let name = array[indexPath.item].name ?? ""
                cell.itemlbl.text = name
        
             let img = array[indexPath.item].image_url
                let url = URL(string: img!)
                cell.itemimg.kf.setImage(with: url)
        
            

            
            return cell
        }
       else {
        
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! featuredCategoryDetailCell_even
            cell.applyBottomShadow()
        let name = array[indexPath.item].name ?? ""
        cell.itemlbl.text = name
        
        let img = array[indexPath.item].image_url
        let url = URL(string: img!)
        cell.itemimg.kf.setImage(with: url)
        

        
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width - 10, height: 175)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let new = photoPrintVC()
        
        new.hidesBottomBarWhenPushed = true
        new.id = array[indexPath.item].entity_id
        new.newtitle = array[indexPath.item].name
        self.navigationController?.pushViewController(new, animated: true)
    }
}











