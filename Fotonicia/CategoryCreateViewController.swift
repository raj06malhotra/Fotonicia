//
//  CategoryCreateViewController.swift
//  Personalisation
//
//  Created by shadman Alam on 17/07/17.
//  Copyright © 2017 FOTONICIA. All rights reserved.
//


import UIKit
import Cosmos
import SCLAlertView

class CategoryCreateViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
     var id : String?
     var collectionview: UICollectionView!
     var array = [Category_create_item_images]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
       if let key = id {
        print(key)
            getAPI(id: key)
        }
        
        view.backgroundColor = UIColor.bgColor
       
        setupNavigationtitleSubtitle()
        setupcollectionview()
        setuptagview()
       
        setupvoteimageview()
        setuplikeimageview()
        setupshareimageview()
        setuptageimageview()
        setstarbgView()
        setupratingbgView()
        setupsubmitreviewslbl()
        setupmorebtnbtn()
        setupcreatebtn()
        setupmoreView()
        setupcancelbtn()
        let img = UIImage(named: "youtube")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(handleyoutube))
        
    }
    
    
    func handleyoutube(){
        
        let cont = YoutubePlayerVC()
    
        self.navigationController?.pushViewController(cont, animated: true)
    }
    
    
    func setupNavigationtitleSubtitle(){
        
        
        let titleBgView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        titleBgView.backgroundColor = UIColor.clear
        
        
        
        let titlename = UILabel(frame: CGRect(x: 0, y: 2, width: 200, height: 24))
        titlename.text = "THANK YOU INDIAN ARMY"
        titlename.textColor = UIColor.white
        titlename.textAlignment = .center
        
        titlename.font = UIFont.systemFont(ofSize: 15)
        navigationItem.titleView = titleBgView
        
        let titlesubtitle = UILabel()
        titlesubtitle.text = "Purchase and earn 10 points"
        titlesubtitle.textColor = UIColor.white
        titlesubtitle.font = UIFont.systemFont(ofSize: 12)
        titlesubtitle.textAlignment = .center
        titlesubtitle.translatesAutoresizingMaskIntoConstraints = false
        titleBgView.addSubview(titlename)
        titleBgView.addSubview(titlesubtitle)
        titlesubtitle.centerXAnchor.constraint(equalTo: titleBgView.centerXAnchor).isActive = true
        titlesubtitle.topAnchor.constraint(equalTo: titlename.bottomAnchor,constant: 1).isActive = true
        titlesubtitle.widthAnchor.constraint(equalToConstant: 160).isActive = true
        titlesubtitle.heightAnchor.constraint(equalTo: titlesubtitle.heightAnchor).isActive = true
        
       
    }
    
    
    
    func setupcollectionview(){
        
        let flowlayout = UICollectionViewFlowLayout()
        
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.backgroundColor = UIColor.bgColor
        collectionview.showsVerticalScrollIndicator = false
        collectionview.showsHorizontalScrollIndicator = true
        collectionview.isUserInteractionEnabled = true
        
        flowlayout.scrollDirection = .horizontal
        flowlayout.minimumLineSpacing = 2
        flowlayout.minimumInteritemSpacing = 2
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionview)
        collectionview.register(createPageCell.self, forCellWithReuseIdentifier: "cell")
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.isPrefetchingEnabled = true
        collectionview.isPagingEnabled = true
        
        collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
    }
    

    let moreView: UIView = {
       let view = UIView()
        view.isHidden = true
          view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    func setupmoreView(){
        view.addSubview(moreView)
        
        moreView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        moreView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        moreView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        moreView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      
    }
    
    
    lazy var cancelbtn: UIImageView = {
        let view = UIImageView()
        view.isHidden = false
        view.isUserInteractionEnabled = true
        view.image = UIImage(named: "cancel")
        view.contentMode = .scaleAspectFit
        let tap = UITapGestureRecognizer(target: self, action: #selector(handlecancel))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    func setupcancelbtn(){
        moreView.addSubview(cancelbtn)
        
        cancelbtn.leadingAnchor.constraint(equalTo: moreView.leadingAnchor,constant: 7).isActive = true
        cancelbtn.topAnchor.constraint(equalTo: moreView.topAnchor,constant: 7).isActive = true
        cancelbtn.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cancelbtn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    func handlecancel(){
        
        if moreView.isHidden == false{
            moreView.isHidden = true
        }
    }
    
    
    let tagview:UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = UILayoutConstraintAxis.horizontal
        stackView.distribution  = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor.blue
        stackView.spacing   = 1.0
        return stackView
    }()
    
   
    
    
    func setuptagview(){
        view.addSubview(tagview)
        
        tagview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tagview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tagview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tagview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    
    lazy var upvotemageview:UIImageView = {
        let imagev = UIImageView()
       
        imagev.layer.masksToBounds = true
        imagev.image = UIImage(named: "wish2")
        imagev.contentMode = .scaleAspectFit
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesction))
        tap.numberOfTapsRequired = 1
        imagev.addGestureRecognizer(tap)

        return imagev
    }()
    
    
    func gesturesction(_ sender: UIPanGestureRecognizer){
    
    if upvotemageview.image == UIImage(named: "wish")
        
    {
        upvotemageview.image = UIImage(named: "wish2")
        
        print(id)
        
        let a = myWishlistVC(collectionViewLayout: UICollectionViewFlowLayout())
        
        a.getAPI()
        
        print("TEST \(a)")
    
        
        }
    else if upvotemageview.image == UIImage(named: "wish2") {
        
        
        upvotemageview.image = UIImage(named: "wish")
        let b = myWishlistVC(collectionViewLayout: UICollectionViewFlowLayout())
        b.getRemoveWishlishtAPI(user_id: "282", wishlist_id: "")
        
        print("XYZ")
    
        
        }
    
    }
    
    
    
    
    
    func setupvoteimageview(){
        tagview.addArrangedSubview(upvotemageview)
        
        upvotemageview.leftAnchor.constraint(equalTo: tagview.leftAnchor).isActive = true
        upvotemageview.centerYAnchor.constraint(equalTo: tagview.centerYAnchor).isActive = true
        upvotemageview.heightAnchor.constraint(equalToConstant: 24).isActive = true
        upvotemageview.widthAnchor.constraint(equalTo: tagview.widthAnchor, multiplier: 1/4).isActive = true
        
        
        
    }
    
    
    
    
    lazy var likeimageview:UIImageView = {
        
        
        let imagev = UIImageView()
        
        imagev.image = UIImage(named: "thumb")
        imagev.layer.masksToBounds = true
        imagev.contentMode = .scaleAspectFit
        
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesctionlike))
        tap.numberOfTapsRequired = 1
        imagev.addGestureRecognizer(tap)
        return imagev
    }()
    
    
    
    func gesturesctionlike(_ sender : UIPanGestureRecognizer){
    
    
        if likeimageview.image == UIImage(named: "thumb")
            
        {
            print("hjkuilo98")
            likeimageview.image = UIImage(named: "thumb-1")
            
          
            
        }
        else if likeimageview.image == UIImage(named: "thumb-1") {
            
            
            likeimageview.image = UIImage(named: "thumb")
          
            
            print("XYZ")
            
            
        }
        

    
    
    
    }
    
    
    
    func setuplikeimageview(){
        tagview.addArrangedSubview(likeimageview)
        
        likeimageview.leftAnchor.constraint(equalTo: upvotemageview.rightAnchor).isActive = true
        likeimageview.centerYAnchor.constraint(equalTo: tagview.centerYAnchor).isActive = true
        likeimageview.heightAnchor.constraint(equalToConstant: 24).isActive = true
        likeimageview.widthAnchor.constraint(equalTo: tagview.widthAnchor, multiplier: 1/4).isActive = true
        
        
        
    }

    
    
    
    
    
    lazy var shareimageview:UIImageView = {
        let imagev = UIImageView()
        imagev.layer.masksToBounds = true
        imagev.image = UIImage(named: "share")
        imagev.contentMode = .scaleAspectFit
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureactionshare))
        tap.numberOfTapsRequired = 1
        imagev.addGestureRecognizer(tap)
        
        return imagev
    }()
    
    
    
    func gestureactionshare(_ sender: UIPanGestureRecognizer){
    
        print("KJLOMK")
        let activity = UIActivityViewController(activityItems: [], applicationActivities: nil)
    
        self.present(activity, animated: true, completion: nil)
    }
    
    func setupshareimageview(){
        
        tagview.addArrangedSubview(shareimageview)
        
        shareimageview.leftAnchor.constraint(equalTo: likeimageview.rightAnchor).isActive = true
          shareimageview.centerYAnchor.constraint(equalTo: tagview.centerYAnchor).isActive = true
        shareimageview.heightAnchor.constraint(equalToConstant: 24).isActive = true
        shareimageview.widthAnchor.constraint(equalTo: tagview.widthAnchor, multiplier: 1/4).isActive = true
        
    }
    
    
    
    
    lazy var tagimageview:UIImageView = {
        let imagev = UIImageView()
        imagev.layer.masksToBounds = true
        imagev.image = UIImage(named: "tag")
        imagev.contentMode = .scaleAspectFit
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesctiontag))
        tap.numberOfTapsRequired = 1
        imagev.addGestureRecognizer(tap)

        
        return imagev
    }()
    
    
    
    func gesturesctiontag(_ sender: UIPanGestureRecognizer){
        
        
        
        let title = "TAG ITEM"
        let message =  "Write your tag here"
        
        let alert = SCLAlertView()
        let txt = alert.addTextField("Write Your Tag")
        alert.addButton("SUBMIT")
        {
            
//            self.getpassword(txt: txt)
        }
        alert.showEdit(title, subTitle: message)
        

     
        
    
    }
    
    
    func setuptageimageview(){
        
        tagview.addArrangedSubview(tagimageview)
        
        tagimageview.leftAnchor.constraint(equalTo: shareimageview.rightAnchor).isActive = true
        tagimageview.centerYAnchor.constraint(equalTo: tagview.centerYAnchor).isActive = true
        tagimageview.heightAnchor.constraint(equalToConstant: 24).isActive = true
        tagimageview.widthAnchor.constraint(equalTo: tagview.widthAnchor, multiplier: 1/4).isActive = true
        
    }
    
    
    let starbgView:CosmosView = {
        let view = CosmosView()
        view.settings.filledBorderColor = UIColor.yellow
        view.settings.filledColor = UIColor.yellow
        view.settings.starMargin = 5
        view.settings.fillMode = .full
        view.settings.starSize = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setstarbgView(){
        view.addSubview(starbgView)
        
        starbgView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        starbgView.topAnchor.constraint(equalTo: tagview.bottomAnchor, constant: 10).isActive = true
        
        starbgView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        starbgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }

    
    let reviewslbl: UILabel = {
        let view = UILabel()
        view.text = "0 Reviews"
        view.textColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setupratingbgView(){
        view.addSubview(reviewslbl)
        
        
        reviewslbl.leftAnchor.constraint(equalTo: starbgView.rightAnchor, constant: 60).isActive = true
        reviewslbl.topAnchor.constraint(equalTo: tagview.bottomAnchor, constant: 10).isActive = true
        
        reviewslbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        reviewslbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    
    let submitreviewslbl: UILabel = {
        let view = UILabel()
        view.text = "Submit your reviews and earn 20 points"
        view.textColor = UIColor.white
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setupsubmitreviewslbl(){
        view.addSubview(submitreviewslbl)
        
        
        submitreviewslbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitreviewslbl.topAnchor.constraint(equalTo: starbgView.bottomAnchor, constant: 10).isActive = true
        
        submitreviewslbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        submitreviewslbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    
    
      lazy var morebutton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.setTitle("MORE", for: UIControlState.normal)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = UIColor.clear
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(moreactionbutton), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    func moreactionbutton(){
    
        if moreView.isHidden {
            moreView.isHidden = false
          
        } else {
            moreView.isHidden = true
            morebutton.setTitle("MORE", for: UIControlState.normal)
        }
       
    
    }
    
    
    func setupmorebtnbtn(){
        view.addSubview(morebutton)
        
        morebutton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        morebutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        morebutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        morebutton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/2.3).isActive = true

        
        
    }
    
    
    
    lazy var createbutton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.setTitle("CREATE", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.textColor = UIColor.black
        btn.layer.cornerRadius = 25
        btn.backgroundColor = UIColor.white
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.addTarget(self, action: #selector(createbtnaction), for: UIControlEvents.touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
  
    func createbtnaction(){
    
        let new = CreateTableViewController()
            new.id = id
        self.navigationController?.pushViewController(new, animated: true)
        
        
    
    }
    
    
    func setupcreatebtn(){
        view.addSubview(createbutton)
        
        createbutton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        createbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        createbutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createbutton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/2.3).isActive = true
        
        
    }
    
    
    
    
    
    
}



extension CategoryCreateViewController {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count > 0 ? array.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! createPageCell
        
        
        if  let img = array[indexPath.item].item_image {
           
            let url = URL(string: img)
            cell.img.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        
    }
    
    
}
