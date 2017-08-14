//
//  myWalletVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import SwiftyJSON

class myTagVC: UITableViewController {
    
    var myResponse  : JSON = []
    var array = [tag_details_data]()
    var array2 = [mtag_response]()
    var array3 = [tag_response_data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        navigationItem.title = "My Tag"
        
        view.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
       
        tableView.register(mytagCell.self, forCellReuseIdentifier: "cell")
        
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return array3.count
            
        case 1:
            return array2.count
            
            
        default:
            break
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mytagCell
            cell.backgroundColor = UIColor.white
            cell.selectionStyle = .none
            
            cell.sizelbl.text = array3[indexPath.row].tag_count
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mytagCell
            cell.backgroundColor = UIColor.white
            cell.selectionStyle = .none
            
            cell.datetimelbl.text = array2[indexPath.row].created_time
            cell.sizelbl.text = array2[indexPath.row].productname
            cell.taglbl.text =   "\(array[indexPath.row].tagname! + ",") "
            
            print(" TEST\(cell.taglbl)")
            
        }
       
        
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        }
        if indexPath.section == 1 {
            return 100
        }
       
        
        return 0
    }
    
    
    
    
}


class mytagCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
        
        setupdatetimelbl()
        setupearnpointlbl()
        setuptaglbl()
        
    }
    
    
    
    // MARK: Label Below Bottom ImageView
    
    let datetimelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "01 may 2016 02:52 PM"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.numberOfLines = 0
        
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupdatetimelbl(){
        addSubview(datetimelbl)
        datetimelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        datetimelbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        datetimelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        datetimelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    // MARK: THANK YOU LABEL
    
    
    let sizelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "You earned 50 points on order of INR 450"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupearnpointlbl(){
        addSubview(sizelbl)
        sizelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sizelbl.topAnchor.constraint(equalTo: datetimelbl.bottomAnchor, constant: 7).isActive = true
        sizelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        sizelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    // MARK : TAG Label
    
    let taglbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "You earned 50 points on order of INR 450"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuptaglbl(){
        addSubview(taglbl)
        taglbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        taglbl.topAnchor.constraint(equalTo: sizelbl.bottomAnchor, constant: 7).isActive = true
        taglbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        taglbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
}





