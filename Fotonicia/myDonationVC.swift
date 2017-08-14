//
//  myDonationVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class myDonationVC: UITableViewController {

    
     var array = [donationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        navigationItem.title = "My Reviews"
        view.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(mydonationcell.self, forCellReuseIdentifier: "reuseIdentifier")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! mydonationcell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        if let eran = array[indexPath.row].rewardpoints_earn {
        cell.crediteranlbl.text = "Credit Earned: \(eran) Points"
        }
        
        if let num = array[indexPath.row].no_of_donations {
            cell.donationslbl.text = "Total Number Of Donations: \(num) "
        }
        
        if let value = array[indexPath.row].donation_amount {
            cell.valuedonationslbl.text = "Total value Of Donations: Rs \(value)"
        }
       
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
}




}



class mydonationcell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
       
        setupcrediteranlbl()
        setupdonationslbl()
        setupvaluedonationslbl()
        setupbottomimage()
        setupbottomlbl()
        setupthankulbl()
        
    }
    
    
    
    
    //MARK: Credit Earned label
    
    let crediteranlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Credit Earned: 2 Points"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcrediteranlbl(){
        addSubview(crediteranlbl)
        crediteranlbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        crediteranlbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        crediteranlbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        crediteranlbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
    
    //MARK: Total No of Donations label
    
    let donationslbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Total Number Of Donations: 1"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupdonationslbl(){
        addSubview(donationslbl)
        donationslbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        donationslbl.topAnchor.constraint(equalTo: crediteranlbl.bottomAnchor, constant: 15).isActive = true
        donationslbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        donationslbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
    
    //MARK: Total Value of Donations label
    
    let valuedonationslbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Total value Of Donations: Rs 5"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupvaluedonationslbl(){
        addSubview(valuedonationslbl)
        
        valuedonationslbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        valuedonationslbl.topAnchor.constraint(equalTo: donationslbl.bottomAnchor, constant: 5).isActive = true
        valuedonationslbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        valuedonationslbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
    
    //MARK: Bottom ImageView
    
    
    
    let bottomimage: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleToFill
        back.image = UIImage(named: "demoimg")
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupbottomimage(){
        
        addSubview(bottomimage)
        bottomimage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomimage.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        bottomimage.topAnchor.constraint(equalTo: valuedonationslbl.bottomAnchor, constant: 15).isActive = true
        bottomimage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    
    // MARK: Label Below Bottom ImageView
    
    let bottomlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Tap on image to checkout how your donations are helping under priviliged/street children education"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.numberOfLines = 0
        
        lineView.font = UIFont.systemFont(ofSize: 12)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupbottomlbl(){
        addSubview(bottomlbl)
        bottomlbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomlbl.topAnchor.constraint(equalTo: bottomimage.bottomAnchor, constant: 7).isActive = true
        bottomlbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        bottomlbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: THANK YOU LABEL
    
    
    let thankulbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "THANK YOU FOR YOUR SUPPORT"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupthankulbl(){
        addSubview(thankulbl)
        thankulbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thankulbl.topAnchor.constraint(equalTo: bottomlbl.bottomAnchor, constant: 7).isActive = true
        thankulbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        thankulbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    
    
}
