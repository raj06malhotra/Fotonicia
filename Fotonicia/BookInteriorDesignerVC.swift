//
//  BookVideoGrapherVC.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Eureka

class BookInteriorDesignerVC: FormViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Book Interior Designer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(handlesubmit))
        

        
        
        
         form   +++ Section("Let us know the exact details so we can come back to you right budget and timelines.")
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
            
          
            
            
            +++ Section("Select anyone from below")
            <<< CheckRow(){
                $0.title = "Own House"
            }
            <<< CheckRow(){
                $0.title = "Corporate Office"
            }
            <<< CheckRow(){
                $0.title = "Other"
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
