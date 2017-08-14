//
//  CreateTableviewController.swift
//  Personalisation
//
//  Created by shadman Alam on 17/07/17.
//  Copyright © 2017 FOTONICIA. All rights reserved.
//

import Foundation
import UIKit

class CreateTableViewController: UITableViewController {
    
    var id : String?
   
   
    
    var array = [creation_details]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let key = id else {return}
        getAPI(id: key)
       
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(customcreateTableCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.buttoncolor
        tableView.separatorColor = UIColor.white
        tableView.separatorStyle = .singleLine
        
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
    
}



extension CreateTableViewController {
    
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count > 0 ? array.count : 0
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customcreateTableCell
        
        cell.pointlbl.text = array[indexPath.item].rewardpoints_earn
        cell.pricelbl.text =  array[indexPath.item].price
        cell.sizelbl.text = array[indexPath.item].item_name
        cell.backgroundColor = UIColor.buttoncolor
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = LayoutViewController()
        new.id = array[indexPath.row].item_id
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let customheaderViewe = customheaderview(frame: CGRect(x: 0, y: 10, width: view.frame.size.width, height: 30))
        customheaderViewe.backgroundColor = UIColor.clear
        
        customheaderViewe.szielbl.text = "SIZE"
        customheaderViewe.pricelbl.text = "PRICE"
        customheaderViewe.pointslbl.text = "POINTS"
        return customheaderViewe
    }
    
    
}


class customheaderview: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
        setupszielbl()
        setpricelbl()
        setpointslbl()
    }
    
    
    //MARK: Size label
    
    let szielbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "SIZE"
        lineView.textColor = UIColor.white
        lineView.textAlignment = .left
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupszielbl(){
        addSubview(szielbl)
        szielbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        szielbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        szielbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        szielbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    

    
    let pricelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "SIZE"
        lineView.textColor = UIColor.white
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setpricelbl(){
        addSubview(pricelbl)
        pricelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pricelbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pricelbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        pricelbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
    
    let pointslbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "SIZE"
        lineView.textColor = UIColor.white
        lineView.textAlignment = .right
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setpointslbl(){
        addSubview(pointslbl)
        pointslbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        pointslbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pointslbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        pointslbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
}


class customcreateTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupload()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupload(){
        
        setupsizelbl()
        setuppricelbl()
        setuppointlbl()
    }
    
    let sizelbl: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "text"
        lb.textAlignment = .left
        lb.textColor = UIColor.white
        return lb
    }()
    
    
   func setupsizelbl(){
    
    addSubview(sizelbl)
    
    sizelbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
    sizelbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    sizelbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
    sizelbl.heightAnchor.constraint(equalToConstant: 16).isActive = true

    
    
    }
    
    
    let pricelbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Rs. 3900"
        lb.textAlignment = .center
        lb.textColor = UIColor.white
        return lb
    }()
    
    
    func setuppricelbl(){
        
        addSubview(pricelbl)
        
        pricelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pricelbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pricelbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        pricelbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        
    }
    

    let pointlbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "10 pints"
        lb.textColor = UIColor.white
     lb.textAlignment = .right
        return lb
    }()
    
    
    func setuppointlbl(){
        
        addSubview(pointlbl)
        
        
        pointlbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        pointlbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pointlbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        pointlbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        

        
        
        
    }
    
    
}








