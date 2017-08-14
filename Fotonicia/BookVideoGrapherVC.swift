//
//  BookVideoGrapherVC.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Eureka

class BookVideoGrapherVC: FormViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Book Videographer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(handlesubmit))

        
         form  +++ Section("Checkout our latest work")
            <<< ButtonRow(){
                $0.title = "Photos"
            }
            <<< ButtonRow(){
                $0.title = "Videos"
            }
            
         
            
            +++ Section("")
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
                $0.title = "Photographer"
            }
            <<< CheckRow(){
                $0.title = "Videographer"
            }
            <<< CheckRow(){
                $0.title = "Both"
            }
         
            
    
            +++ Section("Select type of event")
            <<< CheckRow(){
                $0.title = "Wedding"
            }
            <<< CheckRow(){
                $0.title = "Family Event"
            }
            <<< CheckRow(){
                $0.title = "Special Event"
            }
            <<< CheckRow(){
                $0.title = "Catalogue Shoot"
            }
            <<< CheckRow(){
                $0.title = "Portfolio Shoot"
            }
            <<< CheckRow(){
                $0.title = "Corporate Event"
          }
        
        
            +++ Section("Expected No. of People")
            <<< CheckRow(){
                $0.title = "01 - 25"
            }
            <<< CheckRow(){
                $0.title = " 25 - 75"
            }
            <<< CheckRow(){
                $0.title = "75 - 200"
            }
            <<< CheckRow(){
                $0.title = "200 - 500"
            }
            <<< CheckRow(){
                $0.title = "Above 500"
            }
        
        
            +++ Section("")
            <<< TextRow(){ row in
                row.title = "Event Location"
                row.placeholder = "Location"
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
