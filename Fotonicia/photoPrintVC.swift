//
//  featuredDetailCategoryVC.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class photoPrintVC: UIViewController {
    
    var collectioView: UICollectionView?
    var id:String?
    var array = [category_item]()
    var categoryitemArray = [category_items]()
    var newtitle :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = newtitle ?? ""
        view.backgroundColor = UIColor.bgColor
        setuptopimg()
        setupCollectionView()
        
        guard let key = id else {return}
        
        getAPI(id: key)
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
        topimg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
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
        collectioView?.register(photoPrintCell.self, forCellWithReuseIdentifier: "cell2")
        collectioView?.dataSource = self
        collectioView?.delegate = self
        collectioView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
        collectioView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectioView?.topAnchor.constraint(equalTo: topimg.bottomAnchor).isActive = true
        collectioView?.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        collectioView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
}




extension photoPrintVC : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryitemArray.count > 0 ? categoryitemArray.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! photoPrintCell
        
        let name = categoryitemArray[indexPath.item].item_name
        cell.phototypelbl.text = name
        
        let img = categoryitemArray[indexPath.item].item_image
        let url = URL(string: img)
        cell.itemimg.kf.setImage(with: url)
        
        let price = categoryitemArray[indexPath.item].item_starting_price
        cell.pricelbl.text = "Price starting at Rs. \(price)"
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let new = CategoryCreateViewController()
        new.id = categoryitemArray[indexPath.item].item_id
        print(categoryitemArray[indexPath.item].item_id)
        new.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(new, animated: true)
    }
    
}











