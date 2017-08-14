//
//  BookVideoGrapherVC.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Eureka

class BookBulkOrderVC: FormViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Book Bulk  Order"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(handlesubmit))
        
        //
        //        let continents = ["Africa", "Antarctica", "Asia", "Australia", "Europe", "North America"]
        //
        //        form +++ SelectableSection<ImageCheckRow<String>>() { section in
        //            section.header = HeaderFooterView(title: "Where do you live?")
        //        }
        //
        //
        //        for option in continents {
        //            form.last! <<< ImageCheckRow<String>(option){ lrow in
        //                lrow.title = option
        //                lrow.selectableValue = option
        //                lrow.value = option
        //            }
        //        }
        //
        
        //    func valueHasBeenChanged(for row: BaseRow, oldValue: Any?, newValue: Any?) {
        //        if row.section === form[0] {
        //            print("Single Selection:\((row.section as! SelectableSection<ImageCheckRow<String>>).selectedRow()?.baseValue ?? "No row selected")")
        //        }
        //
        //    }
        
        
        
        
        
        form   +++ Section("Fill the below fields and we will get back to you with quotation. Greater the quantity required, better the discount will be.")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = "Enter Your name"
            }
            <<< PhoneRow(){
                $0.title = "Phone Number"
                $0.placeholder = "Enter your number"
            }
            
            <<< EmailRow () { row in
                
                row.title = "Email "
                row.placeholder = "Enter Your email id"
                
            }
            
         
            
            +++ Section("Design assistance required:")
            <<< CheckRow(){
                $0.title = "Yes"
            }
            <<< CheckRow(){
                $0.title = "No"
            }
          
            
            
            
            +++ Section("")
            <<< DateRow(){
                $0.title = "Date of Requirement"
                
            }
            <<< TextAreaRow(){ row in
                row.title = "Any Message"
                row.placeholder = "Your message"
        }
        
        
        
        
        
    }
    
    
    func handlesubmit(){
        
        print(123)
    }
    
    
}
