//
//  selectPhotoVC.swift
//  Fotonicia
//
//  Created by sawan on 18/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import NohanaImagePicker
import Photos
import GBHFacebookImagePicker
import FBSDKCoreKit
import FBSDKLoginKit
import TRMosaicLayout

class selectPhotoVC: UICollectionViewController, UINavigationControllerDelegate, NohanaImagePickerControllerDelegate ,UIImagePickerControllerDelegate , GBHFacebookImagePickerDelegate{

    
    
     var imagearray = [AnyObject]()
     var layout_id :String?
    
     var photoNumber: Int?
    
    lazy var cellSize: CGSize = {
        return CGSize(width: self.view.bounds.width, height: 60)
    }()

    
    
    
fileprivate var imageModels = [GBHFacebookImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select Photo"
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.backgroundColor = UIColor.bgColor
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named:"next"), style: .plain, target: self, action: #selector(handlenext)),UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handlecamera)) ]
        setupblankmessagelbl()
        setupbottomView()
        setupgallerybtn()
        setupfacebookbtn()
        setupinstagrambtn()
        facebookimgaePickerCustomerization()
        
        
    }
    
    
    func handlenext(){
        
        let new = layoutDesignCollectionVC(collectionViewLayout: UICollectionViewFlowLayout())
        
        self.navigationController?.pushViewController(new, animated: true)
        
    }
    func checkPhotos(){
        
    }

    
    func handledismiss(){
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func handlecamera(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }

        
    }
    
    
    func facebookimgaePickerCustomerization(){
        
        GBHFacebookImagePicker.pickerConfig.allowMultipleSelection = true
        GBHFacebookImagePicker.pickerConfig.title = "Facebook Gallery"
        GBHFacebookImagePicker.pickerConfig.uiConfig.navBarTintColor = UIColor.white
        GBHFacebookImagePicker.pickerConfig.uiConfig.selectedBorderColor = UIColor.black
        GBHFacebookImagePicker.pickerConfig.uiConfig.selectedBorderWidth = 4.0
        GBHFacebookImagePicker.pickerConfig.maximumSelectedPictures = 12
        
        
    }
    
    
    func setupNavigationtitleSubtitle(){
        
        
        let titleBgView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        titleBgView.backgroundColor = UIColor.clear
        
        
        
        let titlename = UILabel(frame: CGRect(x: 0, y: 2, width: 200, height: 24))
        titlename.text = "Select Photo"
        titlename.textColor = UIColor.white
        titlename.textAlignment = .center
        
        titlename.font = UIFont.systemFont(ofSize: 16)
        navigationItem.titleView = titleBgView
        
         let a = photoNumber ?? 0
        let titlesubtitle = UILabel()
        titlesubtitle.text = "No. of selected photos: \(a)"
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
  
    lazy var blankmessagelbl: UILabel = {
        let btn = UILabel()
        btn.textColor = UIColor.lightGray
        btn.text = "No Image Found"
        btn.textAlignment = .center
        btn.isHidden = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupblankmessagelbl(){
        view.addSubview(blankmessagelbl)
        blankmessagelbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blankmessagelbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blankmessagelbl.widthAnchor.constraint(equalTo:  view.widthAnchor, constant: -30).isActive = true
        blankmessagelbl.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    
    let bottomView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupbottomView(){
        view.addSubview(bottomView)
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
   
    
    lazy var gallerybtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("Gallery", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(handlegallery), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupgallerybtn(){
        bottomView.addSubview(gallerybtn)
        gallerybtn.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        gallerybtn.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        gallerybtn.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        gallerybtn.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/3).isActive = true
        
    }
    
    
     lazy var facebookbtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Facebook", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
         btn.addTarget(self, action: #selector(handlefacebook), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupfacebookbtn(){
        bottomView.addSubview(facebookbtn)
        facebookbtn.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        facebookbtn.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        facebookbtn.heightAnchor.constraint(equalTo: bottomView.heightAnchor).isActive = true
        facebookbtn.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/3).isActive = true
        
    }
    
  
    
     lazy var instagrambtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Instagram", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(handleinstagram), for: .touchUpInside)
       
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupinstagrambtn(){
        bottomView.addSubview(instagrambtn)
        instagrambtn.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        instagrambtn.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        instagrambtn.heightAnchor.constraint(equalTo: bottomView.heightAnchor).isActive = true
        instagrambtn.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/3).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          checkPhotos()
          setupNavigationtitleSubtitle()
         // self.photoNumber = imageModels.count + imagearray.count
        
          //collectionView?.reloadData()
       
    }
    
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
 
        cell.backgroundColor = UIColor.red
        return cell
    }
    
   }









extension selectPhotoVC{
    
  
    
    
    func nohanaImagePickerDidCancel(_ picker: NohanaImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didFinishPickingPhotoKitAssets pickedAssts :[PHAsset]) {
        
        
        self.imagearray.append(pickedAssts as AnyObject)
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func handlegallery(){
        
        let picker = NohanaImagePickerController()
        picker.delegate = self
        picker.maximumNumberOfSelection = 3
        picker.numberOfColumnsInPortrait = 4
        picker.shouldShowEmptyAlbum = false
        picker.shouldShowMoment = false
        
        present(picker, animated: true, completion: nil)

    }
    
  
    
    func handlefacebook(){
       
        let picker = GBHFacebookImagePicker()
        picker.presentFacebookAlbumImagePicker(from: self, delegate: self)
        
    }
    
    
    
    
    func handleinstagram(){
        
        if  let token = UserDefaults.getInstgramAccessToken() {
           
            let new = instgramimagePickerVC(collectionViewLayout: UICollectionViewFlowLayout())
            new.token = token
            self.present(UINavigationController(rootViewController: new), animated: true, completion: nil)
            
      

        } else {
            
            let new = UINavigationController(rootViewController: Instagram())
            self.present(new, animated: true, completion: nil)
            
        }
        
        
        
        
    }
    

    
    
    func facebookImagePicker(imagePicker: UIViewController,
                             successImageModels: [GBHFacebookImage],
                             errorImageModels: [GBHFacebookImage],
                             errors: [Error?]) {
     
        
        self.imagearray.append(successImageModels as AnyObject)
    }
    
    func facebookImagePicker(imagePicker: UIViewController, didFailWithError error: Error?) {
     
        print(error.debugDescription)
    }
    
}



extension selectPhotoVC: TRMosaicLayoutDelegate {
  
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
        
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }

    
}











