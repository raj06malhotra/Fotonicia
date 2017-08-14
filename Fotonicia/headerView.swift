//
//  headerView.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class headerView: UIView {

    var heightLayoutConstraint = NSLayoutConstraint()
    var bottomLayoutConstraint = NSLayoutConstraint()
    
    var containerView = UIView()
    var containerLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
     
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.red
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        containerLayoutConstraint = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraint(containerLayoutConstraint)
        
        let imageView: UIImageView = UIImageView.init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "demoimg")
        containerView.addSubview(imageView)
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imageView" : imageView]))
        bottomLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        containerView.addConstraint(bottomLayoutConstraint)
        heightLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: containerView, attribute: .height, multiplier: 1.0, constant: 0.0)
        containerView.addConstraint(heightLayoutConstraint)
        
        
        
        
        let namelbl: UILabel = UILabel.init()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.backgroundColor = UIColor.clear
        namelbl.textColor = UIColor.white
        namelbl.font = UIFont.systemFont(ofSize: 16)
        namelbl.clipsToBounds = true
        namelbl.textAlignment = .center
        namelbl.text = "Alex O'neil"
        imageView.addSubview(namelbl)
        namelbl.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        namelbl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        namelbl.widthAnchor.constraint(equalTo: imageView.widthAnchor, constant: -40).isActive = true
        namelbl.heightAnchor.constraint(equalToConstant: 24).isActive = true

        
        
   
        
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




class leftMenuheaderView: UIView {
    
    var heightLayoutConstraint = NSLayoutConstraint()
    var bottomLayoutConstraint = NSLayoutConstraint()
    
    var containerView = UIView()
    var containerLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.white
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        containerLayoutConstraint = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraint(containerLayoutConstraint)
        
        let imageView: UIView = UIView.init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 3
        containerView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
       
        let first_name: UILabel = UILabel.init()
        first_name.translatesAutoresizingMaskIntoConstraints = false
        first_name.textColor = UIColor.black
        first_name.font = UIFont(font: .avenirBlack, size: 26)
        first_name.clipsToBounds = true
        first_name.textAlignment = .center
        if  let first = UserDefaults.getUserName_First() { first_name.text = String(describing: first) } else { first_name.text = "H" }
        imageView.addSubview(first_name)
        first_name.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        first_name.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -10).isActive = true
        first_name.widthAnchor.constraint(equalToConstant: 30).isActive = true
        first_name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let last_name: UILabel = UILabel.init()
        last_name.translatesAutoresizingMaskIntoConstraints = false
        last_name.textColor = UIColor.black
        last_name.font = UIFont(font: .avenirBlack, size: 26)
        last_name.clipsToBounds = true
        last_name.textAlignment = .center
        if  let last = UserDefaults.getUserName_First() { last_name.text = String(describing: last) } else { last_name.text = "G" }
        imageView.addSubview(last_name)
        last_name.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        last_name.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 10).isActive = true
        last_name.widthAnchor.constraint(equalToConstant: 30).isActive = true
        last_name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let namelbl: UILabel = UILabel.init()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.textColor = UIColor.black
        namelbl.font = UIFont(font: .avenirMedium, size: 16)
        namelbl.clipsToBounds = true
        namelbl.textAlignment = .center
        if  let name = UserDefaults.getUserName() { namelbl.text = String(describing: name) } else { namelbl.text = "Hello Guest" }
        containerView.addSubview(namelbl)
        namelbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        namelbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        namelbl.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -40).isActive = true
        namelbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        
        
        
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
