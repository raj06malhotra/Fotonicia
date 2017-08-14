//
//  checkoutVC.swift
//  Fotonicia
//
//  Created by shadman Alam on 26/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit

class checkoutVC: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        
        
        
        
    }
    
    
    
    
    let orderlbl: UILabel = {
    
    
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "ORDER TOTAL :  RS-560"
        lbl.textColor = UIColor.white
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .center
        
    
    
    
    return lbl
    }()
    
    
    
    func setupdonationslbl(){
        view.addSubview(orderlbl)
        orderlbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderlbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        orderlbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        orderlbl.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }

    
}

