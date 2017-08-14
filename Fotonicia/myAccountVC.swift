//
//  myAccountVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FBSDKLoginKit
import Toast_Swift
import SCLAlertView

class myAccountVC: UITableViewController, signoutDelegate{

    
     var menus = ["Order History", "My Donation", "My Wallet", "My Reviews", "My Wishlist", "My Address", "My Tags","My Fans", "Change Password"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "My Account"
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      
        tableView.register(myaccountfooterCell.self, forCellReuseIdentifier: "customfooterCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleeditProfile))
        
        self.tableView.tableHeaderView  = headerView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
       
        
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableView.tableHeaderView as! headerView
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menus[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    

    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "customfooterCell") as! myaccountfooterCell
        headerCell.delegate = self
        return headerCell
    }
    
    func handleeditProfile(){
        
        
        let new = editProfileVC()
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let new = orderHistoryVC(collectionViewLayout: UICollectionViewFlowLayout())
            self.navigationController?.pushViewController(new, animated: true)
        case 1:
            let new =  myDonationVC()
            self.navigationController?.pushViewController(new, animated: true)

        case 2:
            let new =  myWalletVC()
            self.navigationController?.pushViewController(new, animated: true)
        case 3:
            let new = myReviewsVC()
            self.navigationController?.pushViewController(new, animated: true)
        case 4:
            let new = myWishlistVC(collectionViewLayout: UICollectionViewFlowLayout())
            self.navigationController?.pushViewController(new, animated: true)
        case 5:
            let new = myAddressVC()
            self.navigationController?.pushViewController(new, animated: true)
        case 6:
            let new = myTagVC()
            self.navigationController?.pushViewController(new, animated: true)

        case 7:
           let new = myFanVC()
            self.navigationController?.pushViewController(new, animated: true)
        case 8:
            handleChangePassword()
            
        default:
            break
        }
    }
    
    func handleChangePassword(){
        
        let title = "Change Password"
        let message =  "Enter your old and new password to change password"
        
        let alert = SCLAlertView()
        let oldtxt = alert.addTextField("Old Password")
        let newtxt = alert.addTextField("New Password")
        alert.addButton("Submit") {
            
            self.handleChangePassword(old: oldtxt.text, new: newtxt.text)
        }
        alert.showEdit(title, subTitle: message)
        
   
    }
    
    
    func callSignout(cell: myaccountfooterCell) {
        
        
        let alertController = UIAlertController(title: "Secure your Account.", message: "", preferredStyle: .actionSheet)
        
        let Google = UIAlertAction(title: "Sign out from Google", style: .default, handler: { (action) -> Void in
            
        
            
            GIDSignIn.sharedInstance().signOut()
            UserDefaults.removeUserLoginStatus()
            self.view.makeToast("You have sucessfully sign out from Google...")
            
        })
        
        let  Facebook = UIAlertAction(title: "Sign out from Facebook", style: .default, handler: { (action) -> Void in
           
            
            let loginManager = FBSDKLoginManager()
            loginManager.logOut()
            UserDefaults.removeUserLoginStatus()
            self.view.makeToast("You have sucessfully sign out from Facebook...")
            
            
        })
        
        
        let  Instagram = UIAlertAction(title: "Sign out from Instagram", style: .default, handler: { (action) -> Void in
             UserDefaults.removeUserLoginStatus()
            self.view.makeToast("You have sucessfully sign out from Instagram...")
        })
        
        let  Fotonicia = UIAlertAction(title: "Sign out from Fotonicia", style: .default, handler: { (action) -> Void in
            
            UserDefaults.removeUserLoginStatus()
            self.view.makeToast("You have sucessfully sign out from Fotonicia...")
        })
        
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        
        alertController.addAction(Google)
        alertController.addAction(Facebook)
        alertController.addAction(Instagram)
        alertController.addAction(Fotonicia)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
   
    
    
    }
    
    
   }



class myaccountfooterCell: UITableViewCell {
     var delegate : signoutDelegate?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setuploadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuploadView(){
        
        setuplogoutbtn()
        
    }
    
    lazy var logoutbtn: UIButton = {
        let back = UIButton()
        back.setTitle("Sign out", for: .normal)
        back.titleLabel?.font = .boldSystemFont(ofSize: 24)
        back.setTitleColor(UIColor.red, for: .normal)
        back.addTarget(self, action: #selector(handleSigout), for: .touchUpInside)
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    func handleSigout(){
        
        delegate?.callSignout(cell: self)
  
    }
    
    
    func setuplogoutbtn(){
        contentView.addSubview(logoutbtn)
        logoutbtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        logoutbtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        logoutbtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutbtn.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
    
}
