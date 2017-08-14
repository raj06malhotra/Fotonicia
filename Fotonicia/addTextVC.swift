//
//  addTextVC.swift
//  Fotonicia
//
//  Created by shadman Alam on 08/08/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SMSwipeableTabView


class addTextVC: UIViewController, SMSwipeableTabViewControllerDelegate {
    
    var array1 = [text_history]()
    var array2 = [text_details]()
    
    var viewControllerDataSourceCollection = [["BNM","jkl","jkkla","ajhsh"],["BNM","jkl","jkkla","ajhsh"],["BNM","jkl","jkkla","ajhsh"]]
    var us = ["BNM","jkl","jkkla"]
    
    let customize = false
    let showImageOnButton = true
    let swipeableView = SMSwipeableTabViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         textAPI()
        let convert1 = array1.description
        
        let x = [convert1]
        swipeableView.titleBarDataSource = x
        swipeableView.delegate = self
        swipeableView.viewFrame = CGRect(x: 0.0, y: 180, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 180)
        testcustomize()
        
        
        //print(" DEMO \(String(describing: array1))")
        view.backgroundColor = UIColor.bgColor
        
        setviewtop()
        setupaddyourtitleview()
        setupaaddyoursubtitleview()
        setupsearchbar()
        
       
        self.addChildViewController(swipeableView)
        self.view.addSubview(swipeableView.view)
        swipeableView.didMove(toParentViewController: self)

       
        print(" DEMO \(array1.count)")
       
    print("\(array1)")
    print("\(array2)")
        
      

        
        

        
    }
    
    
    func testcustomize(){
    
        if customize {
            swipeableView.segmentBarAttributes = [SMBackgroundColorAttribute : UIColor.white]
            swipeableView.selectionBarAttributes = [
                SMBackgroundColorAttribute : UIColor.black,
                SMAlphaAttribute : 0.8 as AnyObject
            ]
            if (!showImageOnButton) {
                swipeableView.buttonAttributes = [
                    SMBackgroundColorAttribute : UIColor.clear,
                    SMAlphaAttribute : 0.8 as AnyObject,
                    SMFontAttribute : UIFont(name: "HelveticaNeue-Medium", size: 13.0)!,
                    SMForegroundColorAttribute : UIColor.green
                ]
                swipeableView.selectionBarHeight = 3.0 //For thin line
                swipeableView.segementBarHeight = 50.0 //Default is 44.0
                swipeableView.buttonPadding = 10.0 //Default is 8.0
                swipeableView.buttonWidth = 80.0
            }
            else {
                swipeableView.buttonAttributes = [
                    SMBackgroundColorAttribute : UIColor.red,
                    SMAlphaAttribute : 0.8 as AnyObject,
                    SMButtonHideTitleAttribute : true as AnyObject,
                    SMButtonNormalImagesAttribute : ["ic_call_made", "ic_call_missed", "ic_call_received", "ic_chat" , "ic_contacts"] as [String] as AnyObject,
                    SMButtonHighlightedImagesAttribute : ["ic_call_made", "ic_call_missed", "ic_call_received", "ic_chat" , "ic_contacts"] as [String] as AnyObject
                ]
                swipeableView.selectionBarHeight = 3.0 //For thin line
                swipeableView.segementBarHeight = 40.0 //Default is 44.0
                swipeableView.buttonPadding = 10.0 //Default is 8.0
                swipeableView.buttonWidth = 50.0
            }
        }
    }
    
    
    
    let viewtop: UIView = {
    
    let viewd = UIView()
    viewd.translatesAutoresizingMaskIntoConstraints = false
    viewd.isUserInteractionEnabled = true
    viewd.backgroundColor = UIColor.gray

    return viewd
    }()
    
    
    func setviewtop(){
        view.addSubview(viewtop)
        viewtop.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewtop.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewtop.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        viewtop.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    
    let addyourtitleview: UITextField = {
        let view = UITextField()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor.lightGray
        view.placeholder = "Tap here to add your tittle"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setupaddyourtitleview(){
        viewtop.addSubview(addyourtitleview)
        addyourtitleview.topAnchor.constraint(equalTo: viewtop.topAnchor, constant: 15).isActive = true
        addyourtitleview.leftAnchor.constraint(equalTo: viewtop.leftAnchor, constant: 10).isActive = true
        addyourtitleview.widthAnchor.constraint(equalTo: viewtop.widthAnchor, constant: -20).isActive = true
        addyourtitleview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    
    
    
    
    let addyoursubtitleview: UITextField = {
        let view = UITextField()
        
        view.backgroundColor = UIColor.lightGray
        view.placeholder = "Tap here to add your sub-tittle"
        view.isUserInteractionEnabled = true
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setupaaddyoursubtitleview(){
        viewtop.addSubview(addyoursubtitleview)
        
        addyoursubtitleview.leftAnchor.constraint(equalTo: viewtop.leftAnchor,  constant: 10).isActive = true
        addyoursubtitleview.topAnchor.constraint(equalTo: addyourtitleview.bottomAnchor, constant: 5).isActive = true
        addyoursubtitleview.widthAnchor.constraint(equalTo: viewtop.widthAnchor, constant: -20).isActive = true
        addyoursubtitleview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    let searchbar: UISearchBar = {
        let view = UISearchBar()
        
        view.backgroundColor = UIColor.clear
        view.isUserInteractionEnabled = true
        view.placeholder = "Search more subtitles"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setupsearchbar(){
        viewtop.addSubview(searchbar)
        searchbar.leftAnchor.constraint(equalTo: viewtop.leftAnchor, constant: 10).isActive = true
        searchbar.topAnchor.constraint(equalTo: addyoursubtitleview.bottomAnchor, constant: 5).isActive = true
        searchbar.widthAnchor.constraint(equalTo: viewtop.widthAnchor, constant: -20).isActive = true
        searchbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    
    
    
    func didLoadViewControllerAtIndex(_ index: Int) -> UIViewController {
        switch index {
        case 0:
            let listVC = SMSimpleListViewController()
            listVC.dataSource = viewControllerDataSourceCollection[index] as  [AnyObject]?
            return listVC
        case 1:
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.red
            return vc
        case 2:
            let listVC = SMSimpleListViewController()
            listVC.dataSource = viewControllerDataSourceCollection[index] as [AnyObject]?
            return listVC
        case 3:
            let listVC = SMSimpleListViewController()
            listVC.dataSource = viewControllerDataSourceCollection[index] as [AnyObject]?
            return listVC
        case 5:
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.brown
            return vc
        default:
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.green
            return vc
        }
    }
    
    
}

open class SMSimpleListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource: [AnyObject]?
    var pageIndex = 0
    var buttonDataSource: [String]?
    
    @IBOutlet var mainTableView: UITableView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        self.view.addSubview(mainTableView)
        mainTableView?.reloadData()
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellIdentifier")
            cell?.separatorInset = UIEdgeInsets.zero
        }
        if let data = dataSource {
            cell!.textLabel?.text = data[indexPath.row] as? String
            cell?.separatorInset = UIEdgeInsets.zero
        }
        cell?.separatorInset = UIEdgeInsets.zero
        return cell!
    }
}
