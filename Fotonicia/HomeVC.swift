//
//  ViewController.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import SideMenu
import FontAwesome_swift
import Kingfisher


let screensize = UIScreen.main.bounds

class HomeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, featuredCategoryDelegate, homeMadeArtDelegate, topCategoryCell2Delegate , formCellDelegate{

     let urlstring = Constant.BaseUrl.url + kAPI + Constant.APIEndPoints.GetDashboard
    
    var dashboardArray = [array_category]()
    var fillersArray = [array_fillers]()
    var receivedData : [array_category] = []
    
    
    let zoomImageView = UIImageView()
    let blackBackgroundView = UIView()
    let navBarCoverView = UIView()
    let tabBarCoverView = UIView()
    
    var statusImageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        collectionView?.backgroundColor = UIColor.bgColor
        
        collectionView?.contentInset = UIEdgeInsets(top: 2.5, left: 0, bottom: 48, right: 0)
        setupnavigationItem()
        
        registerCell()
    
       
       self.dashboardArray = receivedData
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         getDashboard()
        
    }
    
    


    
    func registerCell(){
        
    collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    collectionView?.register(topCategoryCell.self, forCellWithReuseIdentifier: "topCategory")
    collectionView?.register(formCell.self, forCellWithReuseIdentifier: "cell2")
    collectionView?.register(couponcell.self, forCellWithReuseIdentifier: "cell3")
    collectionView?.register(trendingCell.self, forCellWithReuseIdentifier: "cell4")
    collectionView?.register(featuredCell.self, forCellWithReuseIdentifier: "cell5")
    collectionView?.register(homemadeArtCell.self, forCellWithReuseIdentifier: "cell6")
    collectionView?.register(fillerCell.self, forCellWithReuseIdentifier: "cell7")
    collectionView?.register(featuredCell.self, forCellWithReuseIdentifier: "cell8")
    collectionView?.register(homemadeArtCell.self, forCellWithReuseIdentifier: "cell9")
    collectionView?.register(fillerCell.self, forCellWithReuseIdentifier: "cell10")
       
    collectionView?.register(featuredCell.self, forCellWithReuseIdentifier: "cell11")
    collectionView?.register(homemadeArtCell.self, forCellWithReuseIdentifier: "cell12")
    collectionView?.register(fillerCell.self, forCellWithReuseIdentifier: "cell13")
   
    collectionView?.register(featuredCell.self, forCellWithReuseIdentifier: "cell14")
    collectionView?.register(homemadeArtCell.self, forCellWithReuseIdentifier: "cell15")
    collectionView?.register(fillerCell.self, forCellWithReuseIdentifier: "cell16")
   
    collectionView?.register(featuredCell.self, forCellWithReuseIdentifier: "cell17")
    collectionView?.register(homemadeArtCell.self, forCellWithReuseIdentifier: "cell18")
   
        
   
    
    }
    
    
    func setupnavigationItem(){
        navigationItem.title = "Fotonicia"
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: leftmenuVC())
        menuLeftNavigationController.leftSide = true
        
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.menuLeftNavigationController?.navigationBar.isHidden = true
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuPresentMode = .viewSlideInOut
        SideMenuManager.menuPushStyle = .popWhenPossible
        SideMenuManager.menuWidth = max(round(min((screensize.width), (screensize.height)) * 0.75), 240)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"Oval"), style: .done, target: self, action: #selector(handlemenu))
        
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
        let cart = UIBarButtonItem(image: UIImage(named:"cart"), style: .done, target: self, action: #selector(handlecart))
        navigationItem.rightBarButtonItems = [cart, search]
    }
    
    func handlemenu(){
        
         present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        
    }
    
    func handleSearch(){
        
        let new = SearchVC()
        new.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(new, animated: true)
    }
    
   
    
    func handlecart(){
        
        let new = cartVC(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(new, animated: true)
      
        
    }
    
    func viewallBtnDidTap(cell: featuredCell) {
       
        let new = featuredDetailCategoryVC()
        new.hidesBottomBarWhenPushed = true
        new.index = cell.index
        print(cell.index)
        new.newtitle = cell.categorytitle.text
    
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    
    func viewall_hma_BtnDidTap(cell: homemadeArtCell) {
        let new = featuredDetailCategoryVC()
        new.hidesBottomBarWhenPushed = true
        new.index = cell.index
        new.newtitle = cell.categorytitle.text
        self.navigationController?.pushViewController(new, animated: true)
    }
 
    
    func BtnDidTap(cell: topCategoryCell, titletxt: String) {
        
        let new = featuredDetailCategoryVC()
        new.hidesBottomBarWhenPushed = true
        new.index = cell.index
        self.navigationController?.pushViewController(new, animated: true)

    }
    
    func BtnDidTap(cell: formCell, indexpath: Int) {
        
        switch indexpath {
        case 0:
            let new = BookVideoGrapherVC()
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
        case 1:
            let new = BookInteriorDesignerVC()
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
        case 2:
            let new = BookBulkOrderVC()
            new.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(new, animated: true)
           
        default:
            break
        }
      

    }
    
    
  }




extension HomeVC:  ImageZoomInDelegate2{
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 14
    }
   
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
       
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCategory", for: indexPath) as! topCategoryCell
            cell.applyBottomShadow()
            cell.delegate = self
            
            cell.getDashboard()
          
            return cell
        case 1:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! formCell
          
            cell.delegate = self
           
            cell.applyBottomShadow()
            cell.getDashboard()
            
            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! couponcell
            cell.delegate = self
            cell.applyShadow()
            cell.getDashboard()
            
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! trendingCell
            
           
            cell.applyBottomShadow()
            cell.getDashboard()
            
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath) as! featuredCell
 
            cell.applyBottomShadow()
            
            cell.getDashboard(index: 0)
            cell.index = 0
            
            if let url = URL(string: dashboardArray[0].image_url!) {
                let img = dashboardArray[0].image_url!
                 let resource = ImageResource(downloadURL: url, cacheKey: img)
                cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            }
            if let name = dashboardArray[0].name {
                cell.categorytitle.text =  name
            }
            
            
           
          
            
                cell.delegate = self
            
            
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell6", for: indexPath) as! homemadeArtCell
            cell.delegate = self
            
            cell.applyBottomShadow()

            cell.index = 1
            cell.getDashboard(index: 1)
            let url = URL(string: dashboardArray[1].image_url!)
             let img = dashboardArray[1].image_url!
               let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
           
            cell.categorytitle.text = dashboardArray[1].name ?? ""
            
            
            
           
        
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell7", for: indexPath) as! fillerCell
           
            
            cell.applyShadow()
            let url = URL(string: fillersArray[0].filler_image!)
             let img = fillersArray[0].filler_image!
            let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.fillerimg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            
           
            
            return cell
        case 7:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell8", for: indexPath) as! featuredCell
            cell.delegate = self
            cell.applyBottomShadow()
            
            cell.index = 2
            cell.getDashboard(index: 2)
            let url = URL(string: dashboardArray[2].image_url!)
              let img = dashboardArray[2].image_url!
             let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
           
            cell.categorytitle.text = dashboardArray[2].name ?? ""
          
            
            
            return cell
        case 8:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell9", for: indexPath) as! homemadeArtCell
           
            cell.applyBottomShadow()
            cell.getDashboard(index: 3)
            let url = URL(string: dashboardArray[3].image_url!)
             let img = dashboardArray[3].image_url!
             let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            cell.index = 3
            cell.categorytitle.text = dashboardArray[3].name ?? ""
            
            cell.delegate = self
            return cell
        case 9:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell10", for: indexPath) as! fillerCell

            cell.applyShadow()
            let url = URL(string: fillersArray[1].filler_image!)
             let img = fillersArray[1].filler_image!
              let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.fillerimg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            return cell
     
        
        case 10:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell11", for: indexPath) as! featuredCell
            cell.delegate = self
            cell.applyBottomShadow()
            cell.index = 4
            cell.getDashboard(index: 4)
            let url = URL(string: dashboardArray[4].image_url!)
            let img = dashboardArray[4].image_url!
             let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            cell.categorytitle.text = dashboardArray[4].name ?? ""
            
            
            
            return cell
        case 11:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell12", for: indexPath) as! homemadeArtCell
 
            cell.applyBottomShadow()
            cell.getDashboard(index: 5)
            let url = URL(string: dashboardArray[5].image_url!)
             let img = dashboardArray[5].image_url!
             let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            cell.index = 5
            cell.categorytitle.text = dashboardArray[5].name ?? ""
            
            cell.delegate = self
            return cell
        case 12:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell13", for: indexPath) as! fillerCell
          
            cell.applyShadow()
            
            let url = URL(string: fillersArray[2].filler_image!)
               let img = fillersArray[2].filler_image!
             let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.fillerimg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            
            return cell
     
        case 13:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell14", for: indexPath) as! featuredCell
             cell.delegate = self
            
            cell.applyBottomShadow()
            cell.index = 6
            let url = URL(string: dashboardArray[6].image_url!)
            let img =  dashboardArray[6].image_url!
              let resource = ImageResource(downloadURL: url!, cacheKey: img)
            cell.bgImg.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"))
            cell.getDashboard(index: 6)
            cell.categorytitle.text = dashboardArray[6].name ?? ""
            
            

            return cell
       
            
        default:
            break
        }
      return cell
        

   
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        switch indexPath.item {
        case 0:
            return CGSize(width: view.frame.width, height: 100)
        case 1:
            return CGSize(width: view.frame.width, height: 100)
        case 2:
            return CGSize(width: view.frame.width, height: 200)
        case 3:
            return CGSize(width: view.frame.width, height: 500)
        case 4:
            return CGSize(width: view.frame.width, height: 500)
        case 5:
            return CGSize(width: view.frame.width, height: 250)
        case 6:
            return CGSize(width: view.frame.width, height: 150)
        case 7:
            return CGSize(width: view.frame.width, height: 500)
        case 8:
            return CGSize(width: view.frame.width, height: 250)
        case 9:
            return CGSize(width: view.frame.width, height: 150)
            
        case 10:
            return CGSize(width: view.frame.width, height: 500)
        case 11:
            return CGSize(width: view.frame.width, height: 250)
        case 12:
            return CGSize(width: view.frame.width, height: 150)
            
        case 13:
            return CGSize(width: view.frame.width, height: 500)
        case 14:
            return CGSize(width: view.frame.width, height: 250)
        case 15:
            return CGSize(width: view.frame.width, height: 150)
            
        case 16:
            return CGSize(width: view.frame.width, height: 500)
        case 17:
            return CGSize(width: view.frame.width, height: 250)
        
            
       
        default:
            break
        }
        return CGSize(width: view.frame.width, height: 0)

    }
    

 
    
    func popUpImage(image: UIImageView) {
       self.animateImageView(image)
    }
    
    
   }







extension HomeVC {
    

    
    func animateImageView(_ statusImageView: UIImageView) {
        self.statusImageView = statusImageView
        
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            
            statusImageView.alpha = 0
            
            blackBackgroundView.frame = self.view.frame
            blackBackgroundView.backgroundColor = UIColor.black
            blackBackgroundView.alpha = 0
            view.addSubview(blackBackgroundView)
            
            navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: 20 + 100)
            navBarCoverView.backgroundColor = UIColor.black
            navBarCoverView.alpha = 0
            
            
            
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(navBarCoverView)
                
                tabBarCoverView.frame = CGRect(x: 0, y: keyWindow.frame.height - 49, width: 1000, height: 49)
                tabBarCoverView.backgroundColor = UIColor.black
                tabBarCoverView.alpha = 0
                keyWindow.addSubview(tabBarCoverView)
            }
            
            zoomImageView.backgroundColor = UIColor.red
            zoomImageView.frame = startingFrame
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.image = statusImageView.image
            zoomImageView.contentMode = .scaleAspectFill
            zoomImageView.clipsToBounds = true
            view.addSubview(zoomImageView)
            
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeVC.zoomOut)))
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: { () -> Void in
                
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                
                let y = self.view.frame.height / 2 - height / 2
                
                self.zoomImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                
                self.blackBackgroundView.alpha = 1
                
                self.navBarCoverView.alpha = 1
                
                self.tabBarCoverView.alpha = 1
                
            }, completion: nil)
            
        }
    }
    
    func zoomOut() {
        if let startingFrame = statusImageView!.superview?.convert(statusImageView!.frame, to: nil) {
            
            UIView.animate(withDuration: 0.75, animations: { () -> Void in
                self.zoomImageView.frame = startingFrame
                
                self.blackBackgroundView.alpha = 0
                self.navBarCoverView.alpha = 0
                self.tabBarCoverView.alpha = 0
                
            }, completion: { (didComplete) -> Void in
                self.zoomImageView.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.navBarCoverView.removeFromSuperview()
                self.tabBarCoverView.removeFromSuperview()
                self.statusImageView?.alpha = 1
            })
            
        }
    }
    
    
}










