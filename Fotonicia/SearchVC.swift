//
//  SearchVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import SwiftyJSON



class SearchVC: UITableViewController, UISearchResultsUpdating, UISearchDisplayDelegate, UISearchBarDelegate {

    var myResponse  : JSON = []
    var searcharray = [searc_tag_details]()
    
    var filterdata = [searc_tag_details]()
    
    var tag_name: String?
    
    var resultsController = UITableViewController(style: .grouped)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchAPI()
        //aferSearchAPI()
        


        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Search Catalog"
        
        tableView.register(searchcell.self, forCellReuseIdentifier: "Cell")
        self.resultsController.tableView?.dataSource = self
        self.resultsController.tableView?.delegate = self
        view.addSubview(searchController.searchBar)
        searchController.searchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchController.searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchController.searchBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        searchController.searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.definesPresentationContext = true
        
    }


    
    lazy var searchController : UISearchController = {
        
        var a = UISearchController()
        a = UISearchController(searchResultsController: nil)
        a.searchResultsUpdater = self
        a.dimsBackgroundDuringPresentation = false
        a.hidesNavigationBarDuringPresentation = true
       // a.searchBar.sizeToFit()
        
        
        return a
    }()
    
    func hanldesearch(){
        
       
        self.resultsController.tableView?.dataSource = self
        self.resultsController.tableView?.delegate = self
        
        self.searchController = UISearchController(searchResultsController: nil)
        navigationItem.titleView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.searchController.hidesNavigationBarDuringPresentation = false
        
        
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        
        
        
        
        self.filterdata = self.searcharray.filter{ (data: searc_tag_details) -> Bool in
            
            if (data.tagname?.lowercased().contains(self.searchController.searchBar.text!.lowercased()))!{
            
                return true
                
            }
            
          else {
                
                return false
            }
            
        }
        self.tableView?.reloadData()
        
        

        
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        if searchController.isActive {
        
        return filterdata.count
        }
        
        else
        {
        return searcharray.count
        
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! searchcell
        
        
            if searchController.isActive {
                
            cell.sizelbl.text = filterdata[indexPath.row].tagname
            
            return cell
        }
        else
        {
        cell.sizelbl.text = searcharray[indexPath.row].tagname
            
        return cell
        }
        
       
        
    }
    
    
    

    
}

class searchcell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupsizelbl()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
     
    }
    
    
    let sizelbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "text"
        lb.textColor = UIColor.black
        return lb
    }()
    
    
    func setupsizelbl(){
        
        addSubview(sizelbl)
        sizelbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sizelbl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sizelbl.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        sizelbl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }

    
    
    
}
