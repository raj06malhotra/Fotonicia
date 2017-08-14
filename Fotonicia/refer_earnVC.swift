//
//  refer_earnVC.swift
//  Fotonicia
//
//  Created by sawan on 12/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

class refer_earnVC: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = UIColor.bgColor
        setupNavigationtitleSubtitle()
        
        setupScrollView()
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 100)
        scrollView.addSubview(viewOnScroll)
        setupviewOnScroll()

        
        
        
        
        setuptopdesclbl()
        setupshareblock1()
        setupshareblock2()
        setupshareblock3()
    }

    func setupNavigationtitleSubtitle(){
        
        
        
        let titleBgView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        navigationItem.titleView = titleBgView
        
        let titlename = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 24))
        titlename.text = "Refer & Earn"
        titlename.textColor = UIColor.black
        titlename.textAlignment = .center
        titlename.font = UIFont.boldSystemFont(ofSize: 15)
        titleBgView.addSubview(titlename)
        
        let titlesubtitle = UILabel()
        
        titlesubtitle.textColor = UIColor.black
        titlesubtitle.font = UIFont.systemFont(ofSize: 12)
        titlesubtitle.textAlignment = .center
        titlesubtitle.text = "Best way to buy products free!!"
        titlesubtitle.translatesAutoresizingMaskIntoConstraints = false
        titleBgView.addSubview(titlesubtitle)
        titlesubtitle.centerXAnchor.constraint(equalTo: titleBgView.centerXAnchor).isActive = true
        titlesubtitle.topAnchor.constraint(equalTo: titlename.bottomAnchor,constant: 1).isActive = true
        titlesubtitle.widthAnchor.constraint(equalToConstant: 260).isActive = true
        titlesubtitle.heightAnchor.constraint(equalTo: titlesubtitle.heightAnchor).isActive = true
      
        
    }
    

    
    //MARK: Scroll View
    
    lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.clear
        scroll.delegate = self
        scroll.isScrollEnabled = true
        scroll.isUserInteractionEnabled = true
        scroll.alwaysBounceVertical = false
        scroll.showsVerticalScrollIndicator = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
        
    }()
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: view on scroll
    
    let viewOnScroll:UIView = {
        let viewTop = UIView()
        viewTop.backgroundColor = UIColor.clear
        viewTop.translatesAutoresizingMaskIntoConstraints = false
        return viewTop
        
    }()
    
    func setupviewOnScroll(){
        
        viewOnScroll.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        viewOnScroll.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        viewOnScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        viewOnScroll.heightAnchor.constraint(equalToConstant: 1100).isActive = true
    }
    
    
    
    
    let topdesclbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "You can share your link or coupon with your friends quickly by using our strong online marketing tool such as email, facebook, twitter etc."
        lineView.numberOfLines = 0
        lineView.textAlignment = .center
        lineView.textColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    
    func setuptopdesclbl(){
        viewOnScroll.addSubview(topdesclbl)
        topdesclbl.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        topdesclbl.topAnchor.constraint(equalTo: viewOnScroll.topAnchor,constant: 74).isActive = true
        topdesclbl.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor, constant: -10).isActive = true
        topdesclbl.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    
    
    let shareblock1: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupshareblock1(){
        viewOnScroll.addSubview(shareblock1)
        setuplinklbl()
        setupcustomlinklbl()
        setupcheckboximg()
        setuplinktextfld()
        setuplinksharebtn()
        shareblock1.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        shareblock1.topAnchor.constraint(equalTo: topdesclbl.bottomAnchor, constant: 10).isActive = true
        shareblock1.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor, constant: -10).isActive = true
        shareblock1.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
  
    let linklbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Link"
        lineView.textColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplinklbl(){
        shareblock1.addSubview(linklbl)
        linklbl.leftAnchor.constraint(equalTo: shareblock1.leftAnchor, constant: 30).isActive = true
        linklbl.topAnchor.constraint(equalTo: shareblock1.topAnchor, constant: 7).isActive = true
        linklbl.widthAnchor.constraint(equalTo: shareblock1.widthAnchor, multiplier: 1/3).isActive = true
        linklbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    let customlinklbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Want Custom Link"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .right
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcustomlinklbl(){
        shareblock1.addSubview(customlinklbl)
        customlinklbl.rightAnchor.constraint(equalTo: shareblock1.rightAnchor, constant: -30).isActive = true
        customlinklbl.topAnchor.constraint(equalTo: shareblock1.topAnchor, constant: 7).isActive = true
        customlinklbl.widthAnchor.constraint(equalTo: customlinklbl.widthAnchor).isActive = true
        customlinklbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    let checkboximg: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "square_uncheck")
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupcheckboximg(){
        shareblock1.addSubview(checkboximg)
        checkboximg.rightAnchor.constraint(equalTo: customlinklbl.leftAnchor,constant: -5).isActive = true
        checkboximg.centerYAnchor.constraint(equalTo: customlinklbl.centerYAnchor).isActive = true
        checkboximg.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkboximg.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    let linktextfld: UITextField = {
        let lineView = UITextField()
        lineView.placeholder = "Enter the link here"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.borderStyle = .roundedRect
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplinktextfld(){
        shareblock1.addSubview(linktextfld)
        linktextfld.centerXAnchor.constraint(equalTo: shareblock1.centerXAnchor).isActive = true
        linktextfld.topAnchor.constraint(equalTo: linklbl.bottomAnchor, constant: 7).isActive = true
        linktextfld.widthAnchor.constraint(equalTo: shareblock1.widthAnchor, constant: -60).isActive = true
        linktextfld.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    let linksharebtn: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("Share", for: .normal)
        lineView.setTitleColor(UIColor.white, for: .normal)
        lineView.backgroundColor = UIColor.btnColor
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds =  true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplinksharebtn(){
        shareblock1.addSubview(linksharebtn)
        linksharebtn.centerXAnchor.constraint(equalTo: shareblock1.centerXAnchor).isActive = true
        linksharebtn.topAnchor.constraint(equalTo: linktextfld.bottomAnchor, constant: 15).isActive = true
        linksharebtn.widthAnchor.constraint(equalTo: shareblock1.widthAnchor, constant: -60).isActive = true
        linksharebtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    
    
    
    
    let shareblock2: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupshareblock2(){
        viewOnScroll.addSubview(shareblock2)
        setuplinklbl2()
        setupcustomlinklbl2()
        setupcheckboximg2()
        setuplinktextfld2()
        setuplinksharebtn2()
        shareblock2.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        shareblock2.topAnchor.constraint(equalTo: shareblock1.bottomAnchor, constant: 10).isActive = true
        shareblock2.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor, constant: -10).isActive = true
        shareblock2.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    
    
    let linklbl2: UILabel = {
        let lineView = UILabel()
        lineView.text = "Link"
        lineView.textColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplinklbl2(){
        shareblock2.addSubview(linklbl2)
        linklbl2.leftAnchor.constraint(equalTo: shareblock2.leftAnchor, constant: 30).isActive = true
        linklbl2.topAnchor.constraint(equalTo: shareblock2.topAnchor, constant: 7).isActive = true
        linklbl2.widthAnchor.constraint(equalTo: shareblock2.widthAnchor, multiplier: 1/3).isActive = true
        linklbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    let customlinklbl2: UILabel = {
        let lineView = UILabel()
        lineView.text = "Want Custom code"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .right
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupcustomlinklbl2(){
        shareblock2.addSubview(customlinklbl2)
        customlinklbl2.rightAnchor.constraint(equalTo: shareblock2.rightAnchor, constant: -30).isActive = true
        customlinklbl2.topAnchor.constraint(equalTo: shareblock2.topAnchor, constant: 7).isActive = true
        customlinklbl2.widthAnchor.constraint(equalTo: customlinklbl2.widthAnchor).isActive = true
        customlinklbl2.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
    
    let checkboximg2: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "square_uncheck")
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupcheckboximg2(){
        shareblock2.addSubview(checkboximg2)
        checkboximg2.rightAnchor.constraint(equalTo: customlinklbl2.leftAnchor,constant: -5).isActive = true
        checkboximg2.centerYAnchor.constraint(equalTo: customlinklbl2.centerYAnchor).isActive = true
        checkboximg2.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkboximg2.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    
    
    let linktextfld2: UITextField = {
        let lineView = UITextField()
        lineView.placeholder = "Enter the coupon code here"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.borderStyle = .roundedRect
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplinktextfld2(){
        shareblock2.addSubview(linktextfld2)
        linktextfld2.centerXAnchor.constraint(equalTo: shareblock2.centerXAnchor).isActive = true
        linktextfld2.topAnchor.constraint(equalTo: linklbl2.bottomAnchor, constant: 15).isActive = true
        linktextfld2.widthAnchor.constraint(equalTo: shareblock2.widthAnchor, constant: -60).isActive = true
        linktextfld2.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    
    
    let linksharebtn2: UIButton = {
        let lineView = UIButton()
        lineView.setTitle("Share", for: .normal)
        lineView.setTitleColor(UIColor.white, for: .normal)
        lineView.backgroundColor = UIColor.btnColor
        lineView.layer.cornerRadius = 2.6
        lineView.layer.masksToBounds =  true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setuplinksharebtn2(){
        shareblock2.addSubview(linksharebtn2)
        linksharebtn2.centerXAnchor.constraint(equalTo: shareblock2.centerXAnchor).isActive = true
        linksharebtn2.topAnchor.constraint(equalTo: linktextfld2.bottomAnchor, constant: 15).isActive = true
        linksharebtn2.widthAnchor.constraint(equalTo: shareblock2.widthAnchor, constant: -60).isActive = true
        linksharebtn2.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    
    

    
    
    let shareblock3: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.clear
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupshareblock3(){
        viewOnScroll.addSubview(shareblock3)
        setupinvitelbl()
        setupfollowlbl()
        setupssocilabgView()
        shareblock3.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor).isActive = true
        shareblock3.topAnchor.constraint(equalTo: shareblock2.bottomAnchor, constant: 10).isActive = true
        shareblock3.widthAnchor.constraint(equalTo: viewOnScroll.widthAnchor, constant: -10).isActive = true
        shareblock3.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    
    let socilabgView: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.clear
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupssocilabgView(){
        shareblock3.addSubview(socilabgView)
      
        setupyoutubeicon()
        setupfacebookicon()
        setupinstagramicon()
        setuptwittericon()
        socilabgView.centerXAnchor.constraint(equalTo: shareblock3.centerXAnchor).isActive = true
        socilabgView.bottomAnchor.constraint(equalTo: shareblock3.bottomAnchor, constant: 10).isActive = true
        socilabgView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        socilabgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    let invitelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "HOW INVITE WORKS ?"
        lineView.textColor = UIColor.btnColor
        lineView.textAlignment = .center
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupinvitelbl(){
        shareblock3.addSubview(invitelbl)
        invitelbl.centerXAnchor.constraint(equalTo: shareblock3.centerXAnchor).isActive = true
        invitelbl.topAnchor.constraint(equalTo: shareblock3.topAnchor, constant: 10).isActive = true
        invitelbl.widthAnchor.constraint(equalTo: shareblock3.widthAnchor, constant: -10).isActive = true
        invitelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    
    let followlbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "FOLLOW US"
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupfollowlbl(){
        shareblock3.addSubview(followlbl)
        followlbl.centerXAnchor.constraint(equalTo: shareblock3.centerXAnchor).isActive = true
        followlbl.topAnchor.constraint(equalTo: invitelbl.bottomAnchor, constant: 15).isActive = true
        followlbl.widthAnchor.constraint(equalTo: shareblock3.widthAnchor, constant: -10).isActive = true
        followlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    
    
    let youtubeicon: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "youtube")
        back.layer.cornerRadius = 18
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupyoutubeicon(){
        socilabgView.addSubview(youtubeicon)
        youtubeicon.leftAnchor.constraint(equalTo: socilabgView.leftAnchor).isActive = true
        youtubeicon.centerYAnchor.constraint(equalTo: socilabgView.centerYAnchor).isActive = true
        youtubeicon.widthAnchor.constraint(equalToConstant: 36).isActive = true
        youtubeicon.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    
    let facebookicon: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "youtube")
        back.layer.cornerRadius = 18
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupfacebookicon(){
        socilabgView.addSubview(facebookicon)
        facebookicon.leftAnchor.constraint(equalTo: youtubeicon.rightAnchor,constant:20).isActive = true
        facebookicon.centerYAnchor.constraint(equalTo: socilabgView.centerYAnchor).isActive = true
        facebookicon.widthAnchor.constraint(equalToConstant: 36).isActive = true
        facebookicon.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    let instagramicon: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "youtube")
        back.layer.cornerRadius = 18
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setupinstagramicon(){
        socilabgView.addSubview(instagramicon)
        instagramicon.leftAnchor.constraint(equalTo: facebookicon.rightAnchor,constant:20).isActive = true
        instagramicon.centerYAnchor.constraint(equalTo: socilabgView.centerYAnchor).isActive = true
        instagramicon.widthAnchor.constraint(equalToConstant: 36).isActive = true
        instagramicon.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    let twittericon: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "youtube")
        back.layer.cornerRadius = 18
        back.layer.masksToBounds = true
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    
    
    
    func setuptwittericon(){
        socilabgView.addSubview(twittericon)
        twittericon.leftAnchor.constraint(equalTo: instagramicon.rightAnchor,constant:20).isActive = true
        twittericon.centerYAnchor.constraint(equalTo: socilabgView.centerYAnchor).isActive = true
        twittericon.widthAnchor.constraint(equalToConstant: 36).isActive = true
        twittericon.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
}



















