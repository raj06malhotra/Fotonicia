//
//  leftmenuVC.swift
//  slideout menu
//
//  Created by sawan on 11/07/17.
//  Copyright © 2017 Sawan. All rights reserved.
//

import UIKit
import MessageUI
import UIFontComplete
class leftmenuVC: UITableViewController, MFMailComposeViewControllerDelegate {
  


     var menus = ["About Us",  "Donate to Educate", "Help & FAQ", "Like Us","Follow Us", "Rate Us", "Contact Us", "Feedback"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        view.backgroundColor = UIColor.white
        tableView.alwaysBounceVertical = false
       
        tableView.register(leftmenuCell.self, forCellReuseIdentifier: "menucell")
        self.tableView.tableHeaderView  = leftMenuheaderView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
    }

 
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menus.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menucell", for: indexPath) as! leftmenuCell
       
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.accessoryType = .disclosureIndicator
        cell.namelbl.text = menus[indexPath.row]
        
        return cell
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let new = aboutVC(collectionViewLayout: UICollectionViewFlowLayout())
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
            
     
        case 1:
            let new = Donate2EducateVC(collectionViewLayout: UICollectionViewFlowLayout())
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
        case 2:
            let new = help_FaqVC()
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
        case 3:
           
            handlelike()
        case 4:
           
            handlefollowus()
            
        case 5:
          
            handlerateus()
            
            
        case 6:
           
            handlecontactus()
            
        case 7:
            let new = FeedbackformVC()
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
        default:
            break
        }
        
    }

    
    func handlelike(){
        
        let url = URL(string: "https://www.facebook.com/fotonicia")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    func handlefollowus(){
        
        let url = URL(string: "https://www.instagram.com/fotonicia_app")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    func handlerateus(){
        
       rateApp(appId: "id959379869") { (success) in
        
        
        }
    }
    
    func handlecontactus(){
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["sawanmind@gmail.com"])
            mail.setSubject("Feedback from ios Fotonicia app!")
            mail.setMessageBody("Write your message", isHTML: false)
            
            
            present(mail, animated: true)
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

    
    func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
}






class leftmenuCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setuploadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuploadView(){
      
     
        setupnamelbl()
        
    }

    
    
    let namelbl:UILabel = {
        let name = UILabel()
        let myFont = Font.avenirNextRegular.of(size: 13.0)
        name.font = myFont
        name.textColor = UIColor.black
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    func setupnamelbl(){
        addSubview(namelbl)
        namelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        namelbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        namelbl.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        namelbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}




