//
//  myAddressVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import SwiftyJSON

class myAddressVC: UITableViewController {

    var myResponse  : JSON = []
    var array = [customeradress]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
        navigationItem.title = "My Address"
        view.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(addressCell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
    }

    func handleAdd(){
       
        let new = newAddressVC()
        self.navigationController?.pushViewController(new, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! addressCell
        
        cell.fullnamelbl.text = "\(array[indexPath.row].prefix! + "  " + array[indexPath.row].firstname! + "  " + array[indexPath.row].lastname!)"
        
        cell.address1lbl.text = "\(array[indexPath.row].street! + "  " + array[indexPath.row].region!)"
        cell.address2lbl.text = self.array[indexPath.row].street
        cell.state_countrylbl.text = "\(array[indexPath.row].city! + array[indexPath.row].country_id!) "
        cell.city_pincodelbl.text = self.array[indexPath.row].postcode
        cell.mobilenolbl.text = self.array[indexPath.row].telephone
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      
        if editingStyle == .delete {
          
            print("Deleted")
            
           
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}




class addressCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadviews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadviews(){
        setupfullnamelbl()
        setupaddress1lbl()
        setupaddress2lbl()
        setupcitylbl()
        setupstatelbl()
        setupmobilenolbl()
        
    }
    
    
    
    // MARK Full Name Label
    
    
    let fullnamelbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "Full Name"
        namelbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupfullnamelbl(){
        addSubview(fullnamelbl)
        fullnamelbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        fullnamelbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        fullnamelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        fullnamelbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    // MARK Address 1 Label
    let address1lbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "Address 1"
        namelbl.font = UIFont.boldSystemFont(ofSize: 14)
        
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupaddress1lbl(){
        addSubview(address1lbl)
        address1lbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        address1lbl.topAnchor.constraint(equalTo: fullnamelbl.bottomAnchor, constant: 7).isActive = true
        address1lbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        address1lbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    // MARK Address 2 Label
    let address2lbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "Address 2"
        namelbl.font = UIFont.boldSystemFont(ofSize: 14)
        
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupaddress2lbl(){
        addSubview(address2lbl)
        address2lbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant:10).isActive = true
        address2lbl.topAnchor.constraint(equalTo: address1lbl.bottomAnchor, constant: 7).isActive = true
        address2lbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        address2lbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    // MARK City Label
    
    let city_pincodelbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = " Delhi 110044"
        namelbl.font = UIFont.boldSystemFont(ofSize: 14)
        
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupcitylbl(){
        addSubview(city_pincodelbl)
        city_pincodelbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        city_pincodelbl.topAnchor.constraint(equalTo: address2lbl.bottomAnchor, constant: 7).isActive = true
        city_pincodelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        city_pincodelbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    

    
    // MARK State Label
    
    let state_countrylbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "Delhi, India"
        namelbl.font = UIFont.boldSystemFont(ofSize: 14)
        
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupstatelbl(){
        addSubview(state_countrylbl)
        state_countrylbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        state_countrylbl.topAnchor.constraint(equalTo: city_pincodelbl.bottomAnchor, constant: 7).isActive = true
        state_countrylbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        state_countrylbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    // MARK Mobile No Label
    
    let mobilenolbl: UILabel = {
        let namelbl = UILabel()
        namelbl.text = "Mobile: +91 8010153210"
        namelbl.font = UIFont.boldSystemFont(ofSize: 14)
        
        namelbl.textColor = UIColor.black
        namelbl.numberOfLines = 0
        
        namelbl.lineBreakMode = .byWordWrapping
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        return namelbl
    }()
    
    func setupmobilenolbl(){
        addSubview(mobilenolbl)
        mobilenolbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        mobilenolbl.topAnchor.constraint(equalTo: state_countrylbl.bottomAnchor, constant: 7).isActive = true
        mobilenolbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        mobilenolbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    
}
