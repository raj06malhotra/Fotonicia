//
//  myWishlistVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import SwiftyJSON

private let reuseIdentifier = "Cell"

class myWishlistVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, removewishlishtdelegate {
    
    var array = [wishlist_details]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getAPI()
        
        collectionView?.backgroundColor = UIColor.bgColor
        navigationItem.title = "My Wishlist"
        self.collectionView!.register(wishlistCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return array.count > 0 ? array.count : 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! wishlistCell
        cell.delegate = self
        let url = URL(string: array[indexPath.item].item_image!)
        cell.itemimg.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))
        cell.pricelbl.text = "Price Starting at Rs. \(array[indexPath.item].item_starting_price!)"
        cell.phototypelbl.text = array[indexPath.item].item_name
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    
    func removewish(cell: wishlistCell){
        
        print("1234566")
        //getRemoveWishlishtAPI()
        
     print(UserDefaults.getWishlist_ID())
    }

}





class wishlistCell: UICollectionViewCell {
    var delegate: removewishlishtdelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadViews(){
        
        setupitemimg()
        setuptextview()
        setupphototypelbll()
        setuppricelbl()
        setuplblview()
        setupwishlistbgview()
    }
    
    
    
    let itemimg: UIImageView = {
        let lineView = UIImageView()
        lineView.contentMode = .scaleToFill
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemimg(){
        addSubview(itemimg)
        
        itemimg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        itemimg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemimg.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        itemimg.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    
    let textview: UIView = {
        let lineView = UIView()
        
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptextview(){
        itemimg.addSubview(textview)
        
        textview.centerXAnchor.constraint(equalTo: itemimg.centerXAnchor).isActive = true
        textview.centerYAnchor.constraint(equalTo: itemimg.centerYAnchor).isActive = true
        textview.widthAnchor.constraint(equalTo: itemimg.widthAnchor, multiplier: 1/2).isActive = true
        textview.heightAnchor.constraint(equalTo: itemimg.heightAnchor, multiplier: 1/2).isActive = true
    }
    let phototypelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "CLASSIC"
        lineView.font = UIFont.boldSystemFont(ofSize: 16)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        
        lineView.lineBreakMode = .byWordWrapping
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupphototypelbll(){
        textview.addSubview(phototypelbl)
        phototypelbl.centerXAnchor.constraint(equalTo: textview.centerXAnchor).isActive = true
        phototypelbl.centerYAnchor.constraint(equalTo: textview.centerYAnchor, constant: -10).isActive = true
        phototypelbl.widthAnchor.constraint(equalTo: textview.widthAnchor, multiplier: 1/2).isActive = true
        phototypelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let pricelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Price Starting at Rs. 200"
        lineView.font = UIFont.boldSystemFont(ofSize: 12)
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.numberOfLines = 0
        
        lineView.lineBreakMode = .byWordWrapping
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuppricelbl(){
        textview.addSubview(pricelbl)
        pricelbl.centerXAnchor.constraint(equalTo: textview.centerXAnchor).isActive = true
        pricelbl.topAnchor.constraint(equalTo: phototypelbl.bottomAnchor, constant: 7).isActive = true
        pricelbl.widthAnchor.constraint(equalTo: textview.widthAnchor, constant: -5).isActive = true
        pricelbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
    //MARK  Top View on lbl
    
    let lblview: UIView = {
        
        let viewlb = UIView()
        viewlb.backgroundColor = UIColor(white: 1, alpha: 0.5)
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        
        return viewlb
        
        
    }()
    
    func setuplblview(){
        
        itemimg.addSubview(lblview)
        setupearnpointlbl()
        lblview.centerXAnchor.constraint(equalTo: itemimg.centerXAnchor).isActive = true
        lblview.bottomAnchor.constraint(equalTo: textview.topAnchor, constant: -7).isActive = true
        lblview.widthAnchor.constraint(equalTo: itemimg.widthAnchor, constant: -30).isActive = true
        lblview.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
    }
    
    //MARK LBL on view
    
    let earnpointlbl: UILabel = {
        
        let viewlb = UILabel()
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        viewlb.font = UIFont.systemFont(ofSize: 12)
        viewlb.textAlignment = .center
        viewlb.textColor = UIColor.white
        viewlb.text = "You will earn 140 points by puchasing this products"
        return viewlb
        
        
    }()
    
    func setupearnpointlbl(){
        
        lblview.addSubview(earnpointlbl)
        earnpointlbl.centerXAnchor.constraint(equalTo: lblview.centerXAnchor).isActive = true
        earnpointlbl.centerYAnchor.constraint(equalTo: lblview.centerYAnchor).isActive = true
        earnpointlbl.widthAnchor.constraint(equalTo: lblview.widthAnchor, constant: -10).isActive = true
        earnpointlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
      
    }

    
    
    // MARK WishList Bottom View
    
    let wishlistbgview: UIView = {
        
        let viewlb = UIView()
        viewlb.backgroundColor = UIColor.clear
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        
        
        return viewlb
        
        
    }()
    
    func setupwishlistbgview(){
        
        addSubview(wishlistbgview)
        
        setupwishlistImageview()
        setupshareview()
        
        wishlistbgview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        wishlistbgview.topAnchor.constraint(equalTo: itemimg.bottomAnchor).isActive = true
        wishlistbgview.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        wishlistbgview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }
    
    
    //MARk: Wishlist ImageView
    
    
    let wishlistImageview: UIView = {
        
        let viewlb = UIView()
        viewlb.backgroundColor = UIColor.white
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        return viewlb
        
        
    }()
    
    func setupwishlistImageview(){
        
        wishlistbgview.addSubview(wishlistImageview)
        setupwishimage()
        wishlistImageview.leftAnchor.constraint(equalTo: wishlistbgview.leftAnchor).isActive = true
        wishlistImageview.centerYAnchor.constraint(equalTo: wishlistbgview.centerYAnchor).isActive = true
        wishlistImageview.widthAnchor.constraint(equalTo: wishlistbgview.widthAnchor, multiplier: 1/2.2).isActive = true
        wishlistImageview.heightAnchor.constraint(equalTo: wishlistbgview.heightAnchor).isActive = true

       
        
        
        
    }
    
    lazy var wishimage: UIImageView = {
        
        let viewlb = UIImageView()
        viewlb.image = UIImage(named: "wish")
        viewlb.contentMode = .scaleAspectFit
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        viewlb.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureaction))
        tap.numberOfTapsRequired = 1
        
        viewlb.addGestureRecognizer(tap)
        return viewlb
        
        
    }()
    
    
    func gestureaction(_ sender: UIPanGestureRecognizer){
    
        
        delegate?.removewish(cell: self)
        
       // getRemoveWishlishtAPI()
    
    
    }
    
    func setupwishimage(){
        
        wishlistImageview.addSubview(wishimage)
        wishimage.centerXAnchor.constraint(equalTo: wishlistImageview.centerXAnchor).isActive = true
        wishimage.centerYAnchor.constraint(equalTo: wishlistImageview.centerYAnchor).isActive = true
        wishimage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        wishimage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
    }
    
    
    // MARK Share Bottom View
    
    let shareview: UIView = {
        
        let viewlb = UIView()
        viewlb.backgroundColor = UIColor.white
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        return viewlb
        
        
    }()
    
    func setupshareview(){
        
        
        wishlistbgview.addSubview(shareview)
        setuphareImageview()
        setuppointslbl()
        shareview.rightAnchor.constraint(equalTo: wishlistbgview.rightAnchor).isActive = true
        shareview.centerYAnchor.constraint(equalTo: wishlistbgview.centerYAnchor).isActive = true
        shareview.widthAnchor.constraint(equalTo: wishlistbgview.widthAnchor, multiplier: 1/2.2).isActive = true
        shareview.heightAnchor.constraint(equalTo: wishlistbgview.heightAnchor).isActive = true
        
        
        
    }
    
    
    //MARk: Share ImageView
    
    
    let shareImageview: UIImageView = {
        
        let viewlb = UIImageView()
        viewlb.image = UIImage(named: "share2")
        viewlb.contentMode = .scaleAspectFit
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        return viewlb
        
        
    }()
    
    func setuphareImageview(){
        
        shareview.addSubview(shareImageview)
        shareImageview.leftAnchor.constraint(equalTo: shareview.leftAnchor, constant: 7).isActive = true
        shareImageview.centerYAnchor.constraint(equalTo: shareview.centerYAnchor).isActive = true
        shareImageview.widthAnchor.constraint(equalToConstant: 25).isActive = true
        shareImageview.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
    }
    
    // MARK Label on ShareView
    
    let pointslbl: UILabel = {
        
        let viewlb = UILabel()
        viewlb.font = UIFont.systemFont(ofSize: 9)
        viewlb.text = "Earn 20 points"
        viewlb.translatesAutoresizingMaskIntoConstraints = false
        return viewlb
        
        
    }()
    
    func setuppointslbl(){
        
        shareview.addSubview(pointslbl)
        pointslbl.leftAnchor.constraint(equalTo: shareImageview.rightAnchor, constant: 7).isActive = true
        pointslbl.centerYAnchor.constraint(equalTo: shareview.centerYAnchor).isActive = true
        pointslbl.widthAnchor.constraint(equalToConstant: 125).isActive = true
        pointslbl.heightAnchor.constraint(equalToConstant: 25).isActive = true

        
        
        
    }

    
    
    
}
