//
//  newAddressVC.swift
//  Fotonicia
//
//  Created by sawan on 20/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Eureka


class newAddressVC: FormViewController {

    
  //   var array = []()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.title = "New Address"
        view.backgroundColor = UIColor.bgColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handlesave))
        loadForm()
      
    }

    func handlesave(){
         AddAdressAPi(userid: "86", addressid: "2", prefix: "null", firstname: "dinesh", lastname: "gaur", city: "fsd", region: "Alaska", postcode: "45454", telephone: "45454589", street: "fdsfs", country_id: "US")
        
        
        
        
        
    }
    
    
 
    func loadForm(){
        
        form   +++ Section("")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = "Full name"
                
            }
          
            
            <<< TextRow(){ row in
                row.title = "Address 1"
                row.placeholder = " Company Name / House Name"
            }
        
            <<< TextRow(){ row in
                row.title = "Address 2"
                row.placeholder = " Colony / Street / Locality"
            }
        
            <<< TextRow(){ row in
                row.title = "Pincode"
                
                row.placeholder = "Pincode"
                
            }
            <<< TextRow(){ row in
                row.title = "City"
                row.placeholder = "City"
            }
            <<< TextRow(){ row in
                row.title = "State"
                row.placeholder = "State"
            }
            <<< TextRow(){ row in
                row.title = "Country"
                row.placeholder = "Country"
            }
            <<< PhoneRow(){ row in
                row.title = "Mobile No."
                row.placeholder = "Mobile No."
            }
        
            <<< TextRow(){ row in
                row.title = "Save as"
                row.placeholder = "Home / Office"
            }
      
        
           +++ SwitchRow("") { row in
            row.title = "Set as Default"
            }.onChange { row in
                row.title = (row.value ?? false) ? "Default Address" : "Set as Default"
                row.updateCell()
            }.cellSetup { cell, row in
                cell.backgroundColor = .white
            }.cellUpdate { cell, row in
                cell.textLabel?.font = .systemFont(ofSize: 18.0)
        }
        
    }
    

}
