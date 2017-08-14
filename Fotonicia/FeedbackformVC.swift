//
//  FeedbackformVC.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Eureka
import BEMCheckBox


class FeedbackformVC: UITableViewController {

    
    var questionArray = ["How would you rate your overall experience with our services?","How satisfied are you with the comphrehensiveness of our offer?","How you are rate our prices?","How satisfied are you with the timelines of order delivery?","How satisfied are you with the customer support?","Would you recommend our product/service to other people?","How satisfied are you with our design option?","Are you able to follow the order process easily?","Which product we should introduce next?","What should we change in order to live upto your expectations?"]
    
    var answerArray = [["Very Good","Good","Fair","Poor","Very Poor"],["Very Good","Good","Fair","Poor","Very Poor"],["Very High","High","Reasonable","Low","Very Low"],["Very Good","Good","Fair","Poor","Very Poor"],["Very Good","Good","Fair","Poor","Very Poor"],["Yes","No"],["Very Good","Good","Fair","Poor","Very Poor"],["Very Good","Good","Fair","Poor","Very Poor"],[""],[""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedbackAPI(userid: "282", Question1: "Good", Question2: "Very Good", Question3: "Bad", Question4: "Ver bad", Question5: "Bd", Question6: "Gd", Question7: "uj", Question8: "jklj", Question9: "qewryi", Question10: "iklo")

        navigationItem.title = "Feedback Form"
        setupDesign()
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(feebackcell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(handleSubmit))
        
        tableView.tableHeaderView = feedbackheader.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        
    }

    
    func handleSubmit(){
        
        print(123)
    }

    
    func setupDesign(){
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return questionArray.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerArray[section].count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! feebackcell
        cell.labeltext.text = answerArray[indexPath.section][indexPath.row]
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return questionArray[section].description
    }
 }


class feebackcell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupload()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupload(){
    
        setselectedRadio()
        setlabelext()
        
        
    }
    
    let selectradio: UIView = {
    
        let radio = BEMCheckBox(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radio.isUserInteractionEnabled = true
        radio.translatesAutoresizingMaskIntoConstraints = false
        
        radio.on = false
    
      return radio
    }()
    
    
    func setselectedRadio(){
    addSubview(selectradio)
    selectradio.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    selectradio.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
    selectradio.widthAnchor.constraint(equalToConstant: 20).isActive = true
    selectradio.heightAnchor.constraint(equalToConstant: 20)
    
    
    }
    
    
    let labeltext : UILabel = {
    
        let lbl = UILabel()
        lbl.isUserInteractionEnabled = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Very Good"
        return lbl
    
    }()
    
    func setlabelext(){
    addSubview(labeltext)
    labeltext.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    labeltext.leftAnchor.constraint(equalTo: selectradio.rightAnchor, constant: 20).isActive = true
    labeltext.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
    labeltext.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    }
    
}




class feedbackheader: UIView {
    
    var heightLayoutConstraint = NSLayoutConstraint()
    var bottomLayoutConstraint = NSLayoutConstraint()
    
    var containerView = UIView()
    var containerLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(containerView)
   
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        containerLayoutConstraint = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraint(containerLayoutConstraint)
     
        
        
        let namelbl: UILabel = UILabel.init()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        
        namelbl.textColor = UIColor.gray
        namelbl.font = UIFont.systemFont(ofSize: 13)
        namelbl.clipsToBounds = true
        namelbl.textAlignment = .center
        namelbl.numberOfLines  = 0
        namelbl.text = "Please take few minutes to gives us feedback about our service by filling in this short Customer Feedback form. We are conducting this research in order to measure your level of satification with the quality of our service."
        containerView.addSubview(namelbl)
        namelbl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        namelbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        namelbl.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10).isActive = true
        namelbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerLayoutConstraint.constant = scrollView.contentInset.top;
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top);
        containerView.clipsToBounds = offsetY <= 0
        bottomLayoutConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
        heightLayoutConstraint.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
    
}













