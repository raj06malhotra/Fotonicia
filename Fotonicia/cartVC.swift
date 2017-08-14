//
//  cartVC.swift
//  Fotonicia
//
//  Created by sawan on 27/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import GMStepper
import SwiftyJSON
import Alamofire
import Kingfisher
import SCLAlertView
import Presentr
import BEMCheckBox





private let reuseIdentifier = "Cell"
private let resuseIdentity = "cell1"





class cartVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, customalertdelegate {

     var myResponse  : JSON = []
    var array = [product_details]()
//    var array1 = [cart_summary]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupbutton()
        setpromoview()
       
        setpromolbl()
        setviewofferlbl()
        setofferbottomview()
         setmoreorder()
        getCartAPI()
        
        print(" TESTING\(array)")
       view.backgroundColor = UIColor.bgColor
       setupNavigationtitleSubtitle()
        
        collectionView?.backgroundColor = UIColor.bgColor
        self.collectionView!.register(cartCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(cartCell1.self, forCellWithReuseIdentifier: resuseIdentity)
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        
        
        
    }
    
    lazy var deliverybtn : UIButton = {
    
    let btn = UIButton()
    
    btn.isUserInteractionEnabled = true
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle("SELECT DELIVERY ADDRESS", for: UIControlState.normal)
    btn.backgroundColor = UIColor.buttoncolor

    
    
    btn.addTarget(self, action: #selector(btnaction), for: UIControlEvents.touchUpInside)
    return btn
    
    
    }()
    
    
    func btnaction(){
        
        let success = addTextVC()
        self.navigationController?.pushViewController(success, animated: true)
    
//    let address = myAddressVC()
//        
//    self.navigationController?.pushViewController(address, animated: true)
    
    
    
    }
    
    func setupbutton(){
    view.addSubview(deliverybtn)
    deliverybtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    deliverybtn.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    deliverybtn.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    deliverybtn.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    
    
    }
    
    
    
    let promoview : UIView = {
    
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.translatesAutoresizingMaskIntoConstraints = false
        
    return view
    
    }()
    
    
    func setpromoview(){
    
    
    view.addSubview(promoview)
   // promoview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    promoview.bottomAnchor.constraint(equalTo: deliverybtn.topAnchor).isActive = true
    promoview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    promoview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    promoview.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    
    
    }
    
    
    lazy var promocodelbl: UILabel = {
    
    let lbl = UILabel()
    lbl.isUserInteractionEnabled = true
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.text = "Have a promocode?"
    lbl.textColor = UIColor.buttoncolor
        
   let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesction))
   tap.numberOfTapsRequired = 1
   lbl.addGestureRecognizer(tap)

        
   return lbl
    }()
    
    
    
    func gesturesction(_ sender: UIPanGestureRecognizer){
    
    
    
        let title = "HAVE A PROMOCODE?"
    let message =  ""
        
        let alert = SCLAlertView()
      
        let text = alert.addTextField("Enter your promocode")
        alert.addButton("Submit") { 
            
        
            
        }
     
        alert.showEdit(title, subTitle: message)
        
        

    
    
    
    
    }
    
    
    
    func setpromolbl(){
    promoview.addSubview(promocodelbl)
    promocodelbl.leftAnchor.constraint(equalTo: promoview.leftAnchor, constant: 10).isActive = true
    promocodelbl.topAnchor.constraint(equalTo: promoview.topAnchor, constant : 5).isActive = true
    promocodelbl.bottomAnchor.constraint(equalTo: promoview.bottomAnchor).isActive = true
    promocodelbl.heightAnchor.constraint(equalToConstant: 30)
    
    }
    
    

    lazy var viewofferlbl: UILabel = {
        
        let lbl = UILabel()
        lbl.isUserInteractionEnabled = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "View All Offers"
        lbl.textColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesction1))
        tap.numberOfTapsRequired = 1
        lbl.addGestureRecognizer(tap)
        
        return lbl
        
        
        
    }()
    
    
    func gesturesction1(_ sender: UIPanGestureRecognizer){
    
    let offer = offerVCCart(collectionViewLayout: UICollectionViewFlowLayout())
        
   // offer.collectionView(<#T##collectionView: UICollectionView##UICollectionView#>, didSelectItemAt: <#T##IndexPath#>)
        
    self.navigationController?.pushViewController(offer, animated: true)
    
    
    }
    
    
    func setviewofferlbl(){
        promoview.addSubview(viewofferlbl)
        viewofferlbl.rightAnchor.constraint(equalTo: promoview.rightAnchor, constant: -10).isActive = true
        viewofferlbl.topAnchor.constraint(equalTo: promoview.topAnchor, constant : 5).isActive = true
        viewofferlbl.bottomAnchor.constraint(equalTo: promoview.bottomAnchor).isActive = true
        viewofferlbl.heightAnchor.constraint(equalToConstant: 30)
        
    }
    
    
    
    
    
    let offerbottomview : UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    
    func setofferbottomview(){
        
        
        promoview.addSubview(offerbottomview)
        offerbottomview.rightAnchor.constraint(equalTo: promoview.rightAnchor, constant: -10).isActive = true
        offerbottomview.topAnchor.constraint(equalTo: viewofferlbl.bottomAnchor,  constant : 5).isActive = true
        offerbottomview.bottomAnchor.constraint(equalTo: promoview.bottomAnchor).isActive = true
        offerbottomview.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }

    
    
    
    lazy var moreorder : UIButton = {
        
        let btn = UIButton()
        
        btn.isUserInteractionEnabled = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Continue Shopping", for: UIControlState.normal)
        btn.backgroundColor = UIColor.buttoncolor
        btn.titleLabel?.font = UIFont(name: "System Font", size: 15)
        btn.addTarget(self, action: #selector(btmoreorder), for: UIControlEvents.touchUpInside)
        return btn
        
        
    }()
    
    
    func btmoreorder(){
        
        let success = TabBarVC()
        
      self.present(success, animated: true, completion: nil)
     
        
        
    }
    
    func setmoreorder(){
        view.addSubview(moreorder)
        moreorder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moreorder.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        moreorder.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        moreorder.bottomAnchor.constraint(equalTo: promoview.topAnchor).isActive = true
        
        
        
    }

    
    
    

    func setupNavigationtitleSubtitle(){
        
        
        let titleBgView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        titleBgView.backgroundColor = UIColor.clear
        
        
        
        let titlename = UILabel(frame: CGRect(x: 0, y: 2, width: 200, height: 24))
        titlename.text = "My Shopping Bag"
        titlename.textColor = UIColor.black
        titlename.textAlignment = .center
        
        titlename.font = UIFont.systemFont(ofSize: 15)
        navigationItem.titleView = titleBgView
        
        let titlesubtitle = UILabel()
       
        
        titlesubtitle.text = "Earn \(cart_summary.total_reward_point_earn) points on order of these \(cart_summary.item_count)  items"
        titlesubtitle.textColor = UIColor.darkGray
        titlesubtitle.font = UIFont.systemFont(ofSize: 12)
        titlesubtitle.textAlignment = .center
        titlesubtitle.translatesAutoresizingMaskIntoConstraints = false
        titleBgView.addSubview(titlename)
        titleBgView.addSubview(titlesubtitle)
        titlesubtitle.centerXAnchor.constraint(equalTo: titleBgView.centerXAnchor).isActive = true
        titlesubtitle.topAnchor.constraint(equalTo: titlename.bottomAnchor,constant: 1).isActive = true
        
        titlesubtitle.widthAnchor.constraint(equalToConstant: 280).isActive = true
        titlesubtitle.heightAnchor.constraint(equalTo: titlesubtitle.heightAnchor).isActive = true
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return array.count
        case 1:
            
            return 2
        default:
            break
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! cartCell
            cell.backgroundColor = UIColor.white
           // cell.applyShadow()
            cell.isUserInteractionEnabled = true
            
            
            let img = URL(string: array[indexPath.item].parent_image!)
            cell.itemImg.kf.setImage(with: img, placeholder: UIImage(named: "placeholder"))
            cell.posterlbl.text = array[indexPath.item].parent_item_name
            cell.pointslbl.text = "Purchase and earn \(array[indexPath.item].rewardpoints_earn!) credit points"
            cell.pricelbl.text = "RS. \(array[indexPath.item].total_item_rate!)"
            cell.sizelbl.text = "\(array[indexPath.item].child_item_name! +  " : "  + array[indexPath.item].item_rate!)"
            cell.numberlbl.text = "Total Layout Price : \(array[indexPath.item].total_layout_price!)"
            return cell
            
        
        }
        
        if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentity, for: indexPath) as! cartCell1
            cell.backgroundColor = UIColor.black
            cell.applyShadow()
            cell.isUserInteractionEnabled = true
            cell.subtotallbl1.text = cart_summary.sub_total
            cell.shippinglbl1.text = cart_summary.shipping_price
            cell.discountlbl1.text = cart_summary.total_discount
            cell.totallbl1.text = cart_summary.total_price
            cell.creditearnedlbl1.text = cart_summary.credit_point_discount
            cell.promocodelbl1.text = cart_summary.promo_discount
            cell.donationlbl1.text = cart_summary.total_donation
            cell.donattoeducatelbl1.text = cart_summary.donation
            cell.delegate = self
           // cell.contentView.isHidden = true
            
            return cell
            
            
        }
        
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.section == 0{
            return CGSize(width: self.view.frame.size.width, height: 300)

        
        }
        
        
        if indexPath.section == 1{
            return CGSize(width: self.view.frame.size.width, height: 400)
            
            
        }
        
        
        return CGSize()
        
            }
    
    
    
    
    
    func alertcustom1(){

         let p = Presentr(presentationType: PresentationType.custom(width: ModalSize.half, height: ModalSize.half, center: ModalCenterPosition.center))
        
        
    
 let viewc = customview()
        
    customPresentViewController(p, viewController: viewc, animated: true, completion: nil)
    
 
    
    }
    
    
    
    
    func alertcustom(){
    
        let p = Presentr(presentationType: PresentationType.custom(width: ModalSize.default, height: ModalSize.half, center: ModalCenterPosition.center))
        
                let title = "CHEERS !!"
        
                let body = "DISCOUNT OF Rs.\(cart_summary.total_discount!) \n AUTOMATICALLY APPLIED. \n TOTAL CREDIT  POINTS =\(cart_summary.credit_point_discount!)\n \(cart_summary.point!) POINT = Rs.\(cart_summary.money_against_points!)"
        
                 let okAction = AlertAction(title: "MAXIMUM POINTS SPEND LIMIT PER ORDER = \(cart_summary.max_points_per_order!)", style: .custom(textColor: .black), handler: nil)
                let controller = Presentr.alertViewController(title: title, body: body)
                controller.addAction(okAction)
               var presenter = Presentr(presentationType: .popup)
        
                    presenter = p
                customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)

    
    }
    
    func customaalertv(cell: cartCell1) {
        print("NMKLOP")
        alertcustom()
    }
    
    
    func donatepr(cell: cartCell1) {
        
    let donate1 = Donate2EducateVC(collectionViewLayout: UICollectionViewLayout())
    self.navigationController?.pushViewController(donate1, animated: true)
    
    }
    
    func customalertview(cell: cartCell1) {
        
        alertcustom1()
        
        
    }
    
    
    
}



class customview: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setcreditearnedlbl()
        setcreditearnedlbl1()
        
        
    }
    
    
    let creditearnedlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Credit Earned"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setcreditearnedlbl(){
    
        view.addSubview(creditearnedlbl)
        
        creditearnedlbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        creditearnedlbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        creditearnedlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        creditearnedlbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    
    let creditearnedlbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Credit Earned"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setcreditearnedlbl1(){
        
        view.addSubview(creditearnedlbl)
        
        creditearnedlbl.leftAnchor.constraint(equalTo: creditearnedlbl.rightAnchor).isActive = true
        creditearnedlbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        creditearnedlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        creditearnedlbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    let promocouponslbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Credit Earned"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setpromocouponslbl(){
        
        view.addSubview(promocouponslbl)
        
        promocouponslbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        promocouponslbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        promocouponslbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        promocouponslbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    let promocouponslbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Credit Earned"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setpromocouponslbl1(){
        
        view.addSubview(promocouponslbl1)
        
        promocouponslbl1.leftAnchor.constraint(equalTo: creditearnedlbl.rightAnchor).isActive = true
        promocouponslbl1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        promocouponslbl1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        promocouponslbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }


    
}




class cartCell:UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupload()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupload(){
        setupitemImg()
        setupstepper()
        setparentview()
        setposterlbl()
        setpointslbl()
        setpricelbl()
        setsizelbl()
        setnumberlbl()
    }
    
    let itemImg: UIImageView = {
        let lineView = UIImageView()
        lineView.isUserInteractionEnabled = true
        lineView.image = UIImage(named: "images")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupitemImg(){
        addSubview(itemImg)
        
        itemImg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        itemImg.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        itemImg.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        itemImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    
    lazy var stepper: GMStepper = {
        let lineView = GMStepper()
        lineView.value = 1
        lineView.maximumValue = 50
        lineView.stepValue = 1
        lineView.leftButtonText = "-"
        lineView.rightButtonText = "+"
        lineView.buttonsBackgroundColor = UIColor(red:0.21, green:0.5, blue:0.74, alpha:1)
        lineView.labelBackgroundColor = UIColor.white
        lineView.labelTextColor = UIColor.black
        lineView.autorepeat = true
        lineView.maximumValue = 10
        lineView.isUserInteractionEnabled = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.addTarget(self, action: #selector(stepperValueChanged(sender:)), for: .valueChanged)
        return lineView
    }()
    
    func stepperValueChanged(sender:UIStepper!)
    {
        
        
        
        
        print("It Works, Value is --&gt;\(Int(sender.value).description)")
    }
    
    func setupstepper(){
        
        itemImg.addSubview(stepper)
        
        stepper.rightAnchor.constraint(equalTo: itemImg.rightAnchor,constant: -7).isActive = true
        stepper.topAnchor.constraint(equalTo: itemImg.topAnchor, constant: 7).isActive = true
        stepper.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        stepper.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
    }
    
    
    
    let parentview: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    
    
    }()
    
    
    func setparentview(){
    
    itemImg.addSubview(parentview)
    parentview.leftAnchor.constraint(equalTo: itemImg.leftAnchor,constant: 10).isActive = true
    parentview.topAnchor.constraint(equalTo: itemImg.topAnchor, constant: 130).isActive = true
    parentview.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
    parentview.heightAnchor.constraint(equalToConstant: 35).isActive = true

        
    
    }
    
    
    
    let posterlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "POSTER"
        lbl.textAlignment = .center
        lbl.textColor = UIColor.black
        
        
        return lbl
        
    }()

    
    
    func setposterlbl(){
    
    parentview.addSubview(posterlbl)
    posterlbl.centerXAnchor.constraint(equalTo: parentview.centerXAnchor).isActive = true
    posterlbl.centerYAnchor.constraint(equalTo: parentview.centerYAnchor).isActive = true
    posterlbl.heightAnchor.constraint(equalTo: parentview.heightAnchor, constant : -10).isActive = true
    posterlbl.widthAnchor.constraint(equalTo: parentview.widthAnchor, constant : -10).isActive = true
    }
    
    
    let pointslbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Purchase and earn credit points"
        lbl.textAlignment = .center
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: "System Font", size: 10)
        
        
        return lbl
        
    }()

    
    func setpointslbl(){
        
        itemImg.addSubview(pointslbl)
        pointslbl.topAnchor.constraint(equalTo: parentview.bottomAnchor, constant: 5).isActive = true
        pointslbl.leftAnchor.constraint(equalTo: itemImg.leftAnchor,constant: 3).isActive = true
        pointslbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        pointslbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    let pricelbl: UILabel = {
    
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rs. 150.0"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: "System Font", size: 20)
        
        
        return lbl
        
    }()
    
    
    func setpricelbl(){
        
        itemImg.addSubview(pricelbl)
        pricelbl.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 80).isActive = true
        pricelbl.rightAnchor.constraint(equalTo: itemImg.rightAnchor,constant: -10).isActive = true
        pricelbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        pricelbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    
    
    
    
    
    
    
    let sizelbl: UILabel = {
    
        let sizelbl1 = UILabel()
        
        sizelbl1.translatesAutoresizingMaskIntoConstraints = false
        sizelbl1.text = "SIZE: 8 in: HJKLL"
        sizelbl1.numberOfLines = 0
        sizelbl1.textAlignment = .right
        sizelbl1.textColor = UIColor.black
        sizelbl1.font = UIFont(name: "System Font", size: 15)
        
        
        return sizelbl1
    
    }()
    
    
    func setsizelbl(){
        
        addSubview(sizelbl)
        sizelbl.topAnchor.constraint(equalTo: itemImg.bottomAnchor, constant: 8).isActive = true
        sizelbl.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15).isActive = true
        sizelbl.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        sizelbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    let numberlbl: UILabel = {
        
        let numberlbl1 = UILabel()
        
        numberlbl1.translatesAutoresizingMaskIntoConstraints = false
        numberlbl1.text = "SIZE: 8 in: "
        numberlbl1.textAlignment = .right
        numberlbl1.textColor = UIColor.black
        numberlbl1.font = UIFont(name: "System Font", size: 13)
        
        
        return numberlbl1
        
    }()
    
    
    
    func setnumberlbl(){
        
        addSubview(numberlbl)
        numberlbl.topAnchor.constraint(equalTo: sizelbl.bottomAnchor, constant: 4).isActive = true
        numberlbl.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15).isActive = true
        numberlbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        numberlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    
    
    
    
}



class cartCell1:UICollectionViewCell {
    
    var delegate: customalertdelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupload()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupload(){
        setorderlbl()
        setpartview()
        setsubtotallbl()
        setsubtotallbl1()
        setshippinglbl()
        setshippinglbl1()
        setdiscountlbl()
        setdiscountlbl1()
        setshowmorelbl()
        setpartview1()
        setcreditearnedlbl()
        setcreditearnedlbl1()
        setpromocodelbl()
        setpromocodelbl1()
        setknowmorelbl()
        setpartview2()
        setdonationlbl()
        setdonationlbl1()
        setpartview3()
        //setcheckbox()
        setdonattoeducatelbl()
        setdonattoeducatebelowlbl()
        setdonattoeducatelbl1()
        setknowmorelbl1()
        setpartview4()
        settotalview()
        settotallbl()
        settotallbl1()

}




    let orderlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Order Summary"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 20)
        
        
        return lbl
        
    }()
    
    
    func setorderlbl(){
        
        addSubview(orderlbl)
        orderlbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        orderlbl.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        orderlbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        orderlbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    



    
    let partview: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
      
        return view
        
        
    }()
    
    
    func setpartview(){
        
        addSubview(partview)
        partview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        partview.topAnchor.constraint(equalTo: orderlbl.bottomAnchor, constant: 5).isActive = true
        partview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        partview.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        

    }
    
    
    
    let subtotallbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subtotal"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 18)
        
        
        return lbl
        
    }()
    
    
    func setsubtotallbl(){
        
        addSubview(subtotallbl)
        subtotallbl.topAnchor.constraint(equalTo: partview.bottomAnchor, constant: 5).isActive = true
        subtotallbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        subtotallbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        subtotallbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    
    let subtotallbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "10000"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 18)
        
        
        return lbl
        
    }()
    
    
    func setsubtotallbl1(){
        
        addSubview(subtotallbl1)
        subtotallbl1.topAnchor.constraint(equalTo: partview.bottomAnchor, constant: 5).isActive = true
        subtotallbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        subtotallbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        subtotallbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    
    let shippinglbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Shipping"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 18)
        
        
        return lbl
        
    }()
    
    
    func setshippinglbl(){
        
        addSubview(shippinglbl)
        shippinglbl.topAnchor.constraint(equalTo: subtotallbl.bottomAnchor, constant: 5).isActive = true
        shippinglbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        shippinglbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        shippinglbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    let shippinglbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1209"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 18)
        
        
        return lbl
        
    }()
    
    
    func setshippinglbl1(){
        
        addSubview(shippinglbl1)
        shippinglbl1.topAnchor.constraint(equalTo: subtotallbl1.bottomAnchor, constant: 5).isActive = true
        shippinglbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        shippinglbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        shippinglbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    

    
    let discountlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Discount"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 18)
        
        
        return lbl
        
    }()
    
    
    func setdiscountlbl(){
        
        addSubview(discountlbl)
        discountlbl.topAnchor.constraint(equalTo: shippinglbl.bottomAnchor, constant: 5).isActive = true
        discountlbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        discountlbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        discountlbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    
    
    

    
    
    lazy var showmorelbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Show More"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 14)
        lbl.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesction))
        tap.numberOfTapsRequired = 1
        lbl.addGestureRecognizer(tap)
        
        return lbl
        
    }()
    
    func gesturesction(_sender : UIPanGestureRecognizer){
    
        delegate?.customalertview(cell: self)
    
    
    }
    
    
    
    func setshowmorelbl(){
        
        addSubview(showmorelbl)
        showmorelbl.topAnchor.constraint(equalTo: partview.bottomAnchor, constant: 75).isActive = true
        showmorelbl.leftAnchor.constraint(equalTo: discountlbl.rightAnchor, constant: 10).isActive = true
        showmorelbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        showmorelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    let discountlbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "09876"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 18)
        
        
        return lbl
        
    }()
    
    
    func setdiscountlbl1(){
        
        addSubview(discountlbl1)
        discountlbl1.topAnchor.constraint(equalTo: shippinglbl1.bottomAnchor, constant: 5).isActive = true
        discountlbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        discountlbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        discountlbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    
    
    
    
    
    let partview1: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
        
        
    }()
    
    
    func setpartview1(){
        
        addSubview(partview1)
        partview1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partview1.topAnchor.constraint(equalTo: discountlbl.bottomAnchor, constant: 5).isActive = true
        partview1.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        partview1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
    }
    
    
    
    let creditearnedlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Credit Earned"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setcreditearnedlbl(){
        
        addSubview(creditearnedlbl)
        creditearnedlbl.topAnchor.constraint(equalTo: partview1.bottomAnchor, constant: 5).isActive = true
        creditearnedlbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3).isActive = true
        creditearnedlbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/3).isActive = true
        creditearnedlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    
    
    
    let creditearnedlbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "290"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setcreditearnedlbl1(){
        
        addSubview(creditearnedlbl1)
        creditearnedlbl1.topAnchor.constraint(equalTo: partview1.bottomAnchor, constant: 5).isActive = true
        creditearnedlbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        creditearnedlbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        creditearnedlbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    
    
    
    let promocodelbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Promo Coupons"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setpromocodelbl(){
        
        addSubview(promocodelbl)
        promocodelbl.topAnchor.constraint(equalTo: creditearnedlbl.bottomAnchor, constant: 5).isActive = true
        promocodelbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        promocodelbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/3).isActive = true
        promocodelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    let promocodelbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "190"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setpromocodelbl1(){
        
        addSubview(promocodelbl1)
        promocodelbl1.topAnchor.constraint(equalTo: creditearnedlbl1.bottomAnchor, constant: -6).isActive = true
        promocodelbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        promocodelbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        promocodelbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    
    
    
    
    
    
    let partview2: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
        
        
    }()
    
    
    func setpartview2(){
        
        addSubview(partview2)
        partview2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partview2.topAnchor.constraint(equalTo: promocodelbl.bottomAnchor, constant: 5).isActive = true
        partview2.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        partview2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
    }
    
    
    
    lazy var knowmore: UILabel = {
    
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Know more"
        lbl.textAlignment = .center
        lbl.isUserInteractionEnabled = true
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureknowmoreaction))
        tap.numberOfTapsRequired = 1
        lbl.addGestureRecognizer(tap)
        
        return lbl
    }()
    
    
    
    func gestureknowmoreaction(_ sender: UIPanGestureRecognizer){
        
            delegate?.customaalertv(cell: self)
        
    }
    
    
    
    func setknowmorelbl(){
    
    
        addSubview(knowmore)
        knowmore.topAnchor.constraint(equalTo: partview1.topAnchor, constant: 15).isActive = true
        knowmore.leftAnchor.constraint(equalTo: creditearnedlbl.rightAnchor, constant: 20).isActive = true
        knowmore.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        knowmore.heightAnchor.constraint(equalToConstant: 20).isActive = true

    
    
    
    }
    
    
    
    
    let donationlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Donations"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setdonationlbl(){
        
        addSubview(donationlbl)
        donationlbl.topAnchor.constraint(equalTo: partview2.bottomAnchor, constant: 4).isActive = true
        donationlbl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        donationlbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        donationlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    let donationlbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "890"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setdonationlbl1(){
        
        addSubview(donationlbl1)
        donationlbl1.topAnchor.constraint(equalTo: partview2.bottomAnchor, constant: 0).isActive = true
        donationlbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        donationlbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        donationlbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    

    
    
    
    let partview3: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
        
        
    }()
    
    
    func setpartview3(){
        
        addSubview(partview3)
        partview3.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partview3.topAnchor.constraint(equalTo: donationlbl.bottomAnchor, constant: 3).isActive = true
        partview3.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        partview3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
    }
    
    let checkbox : UIView = {
        
        
        let view = BEMCheckBox(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.onCheckColor = UIColor.black
        view.onFillColor = UIColor.gray
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleToFill
        return view
    }()
    
    
    func setcheckbox(){
    
    addSubview(checkbox)
    checkbox.topAnchor.constraint(equalTo: partview3.bottomAnchor, constant: 4).isActive = true
    checkbox.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
    checkbox.widthAnchor.constraint(equalToConstant: 10).isActive = true
    checkbox.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    
    }
    
    
    let donattoeducatelbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Donate2Educate"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setdonattoeducatelbl(){
        
        addSubview(donattoeducatelbl)
        donattoeducatelbl.topAnchor.constraint(equalTo: partview3.bottomAnchor, constant: 4).isActive = true
        donattoeducatelbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        donattoeducatelbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/3).isActive = true
        donattoeducatelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
    
    let donattoeducatebelowlbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "(Rs. 5 per order)"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 8)
        
        
        return lbl
        
    }()
    
    
    func setdonattoeducatebelowlbl(){
        
        addSubview(donattoeducatebelowlbl)
        donattoeducatebelowlbl.topAnchor.constraint(equalTo: donattoeducatelbl.bottomAnchor, constant: 4).isActive = true
        donattoeducatebelowlbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
//       donattoeducatebelowlbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
       donattoeducatebelowlbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        donattoeducatebelowlbl.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    

    
    
    
    
    let donattoeducatelbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "670"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 15)
        
        
        return lbl
        
    }()
    
    
    func setdonattoeducatelbl1(){
        
        addSubview(donattoeducatelbl1)
        donattoeducatelbl1.topAnchor.constraint(equalTo: partview3.bottomAnchor, constant: 0).isActive = true
        donattoeducatelbl1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        donattoeducatelbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        donattoeducatelbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true    }
    
    
    
    lazy var knowmorelbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Show More"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System Font", size: 14)
        lbl.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesturesctionknowmore1))
        tap.numberOfTapsRequired = 1
        lbl.addGestureRecognizer(tap)
        
        return lbl
        
    }()
    
    func gesturesctionknowmore1(_sender : UIPanGestureRecognizer){
        
       
        
        delegate?.donatepr(cell: self)
        
        
        
    }
    
    
    
    func setknowmorelbl1(){
        
        addSubview(knowmorelbl1)
        knowmorelbl1.topAnchor.constraint(equalTo: partview3.bottomAnchor, constant: 5).isActive = true
        knowmorelbl1.leftAnchor.constraint(equalTo: donattoeducatelbl.rightAnchor, constant: 20).isActive = true
        knowmorelbl1.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        knowmorelbl1.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    

    
    
    
    
    
    
    
    
    
    
    
    let partview4: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
        
        
    }()
    
    
    func setpartview4(){
        
        addSubview(partview4)
        partview4.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partview4.topAnchor.constraint(equalTo: donattoeducatebelowlbl.bottomAnchor, constant: 3).isActive = true
        partview4.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        partview4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
    }
    
    
    
    let totalview: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
        
        
    }()
    
    
    func settotalview(){
        
        addSubview(totalview)
        totalview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        totalview.topAnchor.constraint(equalTo: partview4.bottomAnchor, constant: 8).isActive = true
        totalview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        totalview.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        
    }
    
    
    let totallbl: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "TOTAL"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: "System Font", size: 25)
        
        
        return lbl
        
    }()
    
    
    func settotallbl(){
        
        totalview.addSubview(totallbl)
        totallbl.topAnchor.constraint(equalTo: totalview.topAnchor, constant: 20).isActive = true
        totallbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        totallbl.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4).isActive = true
        totallbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
    
    
    let totallbl1: UILabel = {
        
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "09876"
        lbl.textAlignment = .right
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: "System Font", size: 25)
        
        
        return lbl
        
    }()
    
    
    func settotallbl1(){
        
        totalview.addSubview(totallbl1)
        totallbl1.topAnchor.constraint(equalTo: totalview.topAnchor, constant: 20).isActive = true
        totallbl1.rightAnchor.constraint(equalTo: totalview.rightAnchor, constant: -10).isActive = true
        totallbl1.widthAnchor.constraint(equalTo: totalview.widthAnchor,multiplier: 1/4).isActive = true
        totallbl1.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

    
    
    

}







