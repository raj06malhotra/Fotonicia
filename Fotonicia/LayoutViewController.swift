//
//  LayoutViewController.swift
//  Personalisation
//
//  Created by shadman Alam on 16/07/17.
//  Copyright © 2017 FOTONICIA. All rights reserved.
//

import Foundation
import UIKit


class LayoutViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,layoutSelectDelegate2  {
   

  

    var id :String?
    var parentcollectionview: UICollectionView!
    var arrayCategory = [Layout_category_details]()
    var childCategory = [layout_details]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = UIColor.bgColor
       
        getAPI(id: id!)
     
        
        navigationItem.title = "Select Layout"

        setupparentcollectionview()
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch)), UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleSearch)), UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleSearch))]
    }
    
    func handleSearch(){
        
        
    }
    

    
    func setupparentcollectionview(){
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        parentcollectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        parentcollectionview.backgroundColor = UIColor.bgColor
        parentcollectionview.showsVerticalScrollIndicator = false
        flowlayout.scrollDirection = .vertical
      
        flowlayout.minimumLineSpacing = 2
        flowlayout.minimumInteritemSpacing = 2
        parentcollectionview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(parentcollectionview)
        parentcollectionview.register(ChildCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        parentcollectionview.dataSource = self
        parentcollectionview.delegate = self
        
        
        parentcollectionview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        parentcollectionview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        parentcollectionview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        parentcollectionview.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        
    }
    
   
    func sendlayout(cell: ChildCollectionViewCell, img: String,layout_id:String ) {
        
        get_layout_API(id: layout_id)
        
      
    }
    
    
}

extension LayoutViewController {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        
        return arrayCategory.count > 0 ? arrayCategory.count : 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ChildCollectionViewCell
        cell.lblproduct.text = arrayCategory[indexPath.item].category_name
        cell.array = childCategory
        
        cell.delegate = self
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        
        return CGSize(width: view.frame.width, height: 170)
    }
    
    
    
}
