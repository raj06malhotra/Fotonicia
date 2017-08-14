//
//  offersVc.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class orderHistoryVC:  UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    var aaray = [order_details]()
    var history = [order_history]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.bgColor
        collectionView?.register(orderhistoryCell.self, forCellWithReuseIdentifier: "cell")
         collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
         collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
         navigationItem.title = "My Order History"
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        getAPI()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return aaray.count > 0 ? aaray.count : 0
        default:
            break
        }
        return 0
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
        switch indexPath.section {
        case 0:
            switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
                return cell
            default:
                break
            }
            
        case 1:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! orderhistoryCell
            cell.backgroundColor = UIColor.white
            cell.pricelbl.text = "Rs. \(aaray[indexPath.item].order_amount)"
            cell.orderlbl.text = "Order No. \(aaray[indexPath.item].order_number)"
            cell.creditlbl.text = "Credit Earned : \(aaray[indexPath.item].rewardpoints_earn)"
            cell.timelbl.text = "Date: \(aaray[indexPath.item].order_date)"
            cell.orderstatuslbl.text = "Your order is \(aaray[indexPath.item].order_status)"
            
            return cell
        default:
            break
        }
        
        return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return   CGSize(width: view.frame.width - 20, height: 200)
    }
    
   
}





class orderhistoryCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
     
        setuppricelbl()
        setupcreditlbl()
        setuporderlbl()
        setuptimelbl()
        setuporderstatuslbl()
        setupcancelorderbtn()
        setupreorderbtn()
        setupsharebtn()
        
    }
    
    
    let profileImage: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "account")
        back.layer.cornerRadius = 14
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupprofileImage(){
        addSubview(profileImage)
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 85).isActive = true
        profileImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
  
    
    let pricelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "$ 24,000.00"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuppricelbl(){
        addSubview(pricelbl)
        pricelbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        pricelbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        pricelbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true

        pricelbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
    let creditlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Credits Earned : 0"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcreditlbl(){
        addSubview(creditlbl)
        creditlbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        creditlbl.topAnchor.constraint(equalTo: pricelbl.bottomAnchor, constant: 7).isActive = true
        creditlbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true

        creditlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    let orderlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Order No. : 10002030"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.numberOfLines = 0
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuporderlbl(){
        addSubview(orderlbl)
        orderlbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
        orderlbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        orderlbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        orderlbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    let timelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "2017-06-17"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptimelbl(){
        addSubview(timelbl)
        timelbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
        timelbl.topAnchor.constraint(equalTo: orderlbl.bottomAnchor, constant: 7).isActive = true
        timelbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true

        timelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let orderstatuslbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Your order is successfully delivered."
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuporderstatuslbl(){
        addSubview(orderstatuslbl)
        orderstatuslbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        orderstatuslbl.topAnchor.constraint(equalTo: timelbl.bottomAnchor, constant: 10).isActive = true
        orderstatuslbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        
        orderstatuslbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let cancelorderbtn: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("Cancel", for: .normal)
        lineView.setTitleColor(UIColor.black, for: .normal)
        lineView.layer.borderColor = UIColor.black.cgColor
        lineView.layer.borderWidth = 1
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcancelorderbtn(){
        addSubview(cancelorderbtn)
        cancelorderbtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        cancelorderbtn.topAnchor.constraint(equalTo: orderstatuslbl.bottomAnchor, constant: 21).isActive = true
        cancelorderbtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
        
        cancelorderbtn.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    
    
    let reorderbtn: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("Re-Order", for: .normal)
        lineView.setTitleColor(UIColor.black, for: .normal)
        lineView.layer.borderColor = UIColor.black.cgColor
        lineView.layer.borderWidth = 1
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupreorderbtn(){
        addSubview(reorderbtn)
        reorderbtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        reorderbtn.topAnchor.constraint(equalTo: orderstatuslbl.bottomAnchor, constant: 21).isActive = true
        reorderbtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
        
        reorderbtn.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    

    let sharebtn: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "share2")
        back.layer.cornerRadius = 2.6
        back.layer.borderColor = UIColor.black.cgColor
        back.layer.borderWidth = 1
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    func setupsharebtn(){
        addSubview(sharebtn)
        sharebtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        sharebtn.topAnchor.constraint(equalTo: orderstatuslbl.bottomAnchor, constant: 21).isActive = true
        sharebtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
        
        sharebtn.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    

    
}



















