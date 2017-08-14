//
//  ImageViewVC.swift
//  Fotonicia
//
//  Created by sawan on 21/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class ImageViewVC: UIViewController {
   
    
    var layoutArray = [tier_element]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Layout View"
        view.backgroundColor = UIColor.bgColor
        setupitemimg()
        
    }

    lazy var  itemimg: UIImageView = {
        let lineView = UIImageView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleSelectPhoto))
        tap.numberOfTapsRequired = 1
        lineView.addGestureRecognizer(tap)
        lineView.isUserInteractionEnabled = true
   
        lineView.contentMode = .scaleAspectFit
        lineView.backgroundColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemimg(){
        view.addSubview(itemimg)
        
        itemimg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        itemimg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        itemimg.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        itemimg.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -20).isActive = true
    }
    
    
    func handleSelectPhoto(){
        
        let new = selectPhotoVC(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(new, animated: true)
    }
}
