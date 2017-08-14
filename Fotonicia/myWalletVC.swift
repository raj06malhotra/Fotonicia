//
//  myWalletVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class myWalletVC: UITableViewController {
    
    
     var arrayPoints = [walletPoints]()
    var rewardHistory = [rewar_history_walletModel]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
        navigationItem.title = "My Wallet"
        view.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: tableView.frame, style: .grouped)
       
         tableView.register(mywalletCell.self, forCellReuseIdentifier: "cell")
        
        
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
        
  
        return rewardHistory.count > 0 ? rewardHistory.count : 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mywalletCell
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
    
        cell.datetimelbl.text = rewardHistory[indexPath.row].reward_date
        cell.earnpointlbl.text = rewardHistory[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 100
    }
    
    //MARK: HEADER
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let customView = myWalletFooterView(frame: CGRect(x: 0, y: 10, width: view.frame.size.width, height: 100))
        
        customView.backgroundColor = UIColor.clear
      
        if let a = arrayPoints.first?.referral_code{
            
            customView.crediteranlbl.text = "YOUR REFERAL CODE: \(a)"
        }
        
        if let a = arrayPoints.first?.total_point_amount{
            
            customView.donationslbl.text = "TOTAL CREDIT EARNED: \(a) POINTS"
        }
        
        
       
        return customView
        
    }
    
    
    // MARK: FOOTER
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let customView = myWalletFooterView(frame: CGRect(x: 0, y: 10, width: view.frame.size.width, height: 100))
       
        customView.backgroundColor = UIColor.clear
        customView.crediteranlbl.text = "INVITE"
        customView.donationslbl.text = "On every successful registration using referal code, \nwe will give you and the other person 500 points"
        return customView
        
    }
    
}


class mywalletCell: UITableViewCell {
    
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
    
    
    let earnpointlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "You earned 50 points on order of INR 450"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupearnpointlbl(){
        addSubview(earnpointlbl)
        earnpointlbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        earnpointlbl.topAnchor.constraint(equalTo: datetimelbl.bottomAnchor, constant: 7).isActive = true
        earnpointlbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        earnpointlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    
    
}

class myWalletFooterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupviews(){
        
        setupcrediteranlbl()
        setupdonationslbl()
      
        
    }
    
    
    
    
    //MARK: Credit Earned label
    
    let crediteranlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "YOUR REFERAL CODE: VIJAY007"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.font = UIFont.systemFont(ofSize: 14)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcrediteranlbl(){
        addSubview(crediteranlbl)
        crediteranlbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        crediteranlbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        crediteranlbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        crediteranlbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    
    
    //MARK: Total No of Donations label
    
    let donationslbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "TOTAL CREDIT EARNED: 500 POINTS"
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
    
    
    
    
    
    
}


