//
//  myReviewsVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Cosmos

class myReviewsVC: UITableViewController {

    
   
     var array = [reviews_details]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
        navigationItem.title = "My Reviews"
        view.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(myreviewsCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        self.tableView.tableHeaderView  = headerView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleprofile))
    }
   
    
    func handleprofile(){
        
        let new = editProfileVC()
        self.navigationController?.pushViewController(new, animated: true)
        
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableView.tableHeaderView as! headerView
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return array.count > 0 ? array.count : 0
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! myreviewsCell
        cell.datetimelbl.text = array[indexPath.item].review_date
        cell.productdiscriptionlbl.text = array[indexPath.item].review_description
        cell.productnamelbl.text = array[indexPath.item].product_name
        cell.ratingview.rating = Double(array[indexPath.item].review_rate!)!
        cell.selectionStyle = .none
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

   
    
 
   
    
  }






class myreviewsCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    func setupviews(){
        setupdatetimelbl()
        setupproductnamelbl()
        setupratingviewbg()
        setupproductdiscriptionlbl()
        
    }
    
    
    
    
    // MARK Date and Time  Label
    
    let datetimelbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "20 July 2017 01:20 P.M"
        namelbl.font = UIFont.boldSystemFont(ofSize: 8)
        namelbl.textColor = UIColor.black
        namelbl.textAlignment = .center
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupdatetimelbl(){
        addSubview(datetimelbl)
        datetimelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        datetimelbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        datetimelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30).isActive = true
        datetimelbl.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    // MARK Product Name  Label
    
    let productnamelbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "Retro Prints"
        namelbl.textAlignment = .center
        namelbl.font = UIFont.boldSystemFont(ofSize: 16)
        namelbl.textColor = UIColor.black
        
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupproductnamelbl(){
        addSubview(productnamelbl)
        productnamelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        productnamelbl.topAnchor.constraint(equalTo: datetimelbl.bottomAnchor, constant: 15).isActive = true
        productnamelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30).isActive = true
        productnamelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    
    let ratingviewbg: UIView = {
        
        let rview = UIView()
        rview.backgroundColor = UIColor.clear
        rview.translatesAutoresizingMaskIntoConstraints = false
        return rview
        
        
        
    }()
    
    
    func setupratingviewbg(){
        addSubview(ratingviewbg)
        setupratingview()
        ratingviewbg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ratingviewbg.topAnchor.constraint(equalTo: productnamelbl.bottomAnchor, constant: 15).isActive = true
        ratingviewbg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ratingviewbg.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        
        
    }
    
    // Mark Rating View
    
    let ratingview: CosmosView = {
        let rview = CosmosView()
        rview.settings.fillMode = .full
        rview.isUserInteractionEnabled = false
        rview.settings.emptyBorderColor = UIColor.gray
        rview.settings.filledBorderColor = UIColor.yellow
        rview.translatesAutoresizingMaskIntoConstraints = false
        return rview
        
        
        
    }()
    
    
    func setupratingview(){
        ratingviewbg.addSubview(ratingview)
        ratingview.centerXAnchor.constraint(equalTo: ratingviewbg.centerXAnchor).isActive = true
        ratingview.centerYAnchor.constraint(equalTo: ratingviewbg.centerYAnchor).isActive = true
        ratingview.heightAnchor.constraint(equalTo: ratingviewbg.heightAnchor).isActive = true
        ratingview.widthAnchor.constraint(equalTo: ratingviewbg.widthAnchor).isActive = true
        
        
    }
    
    
    
    // MARK Product Discription  Label
    
    let productdiscriptionlbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "The print as well as products quality was excellet. Will order again."
        namelbl.font = UIFont.systemFont(ofSize: 13)
        namelbl.textAlignment = .center
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        namelbl.textAlignment = .center
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupproductdiscriptionlbl(){
        addSubview(productdiscriptionlbl)
        productdiscriptionlbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        productdiscriptionlbl.topAnchor.constraint(equalTo: ratingviewbg.bottomAnchor, constant: 15).isActive = true
        productdiscriptionlbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30).isActive = true
        productdiscriptionlbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    
}

