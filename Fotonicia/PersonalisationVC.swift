//
//  PersonalisationVC.swift
//  Fotonicia
//
//  Created by sawan on 24/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit

let screenwidth = UIScreen.main.bounds.width - 20
let screenheight = UIScreen.main.bounds.height - 64


class PersonalisationVC: UIViewController {
    
    
  
   
    let width = UIScreen.main.bounds.width
    let framImg = UIImageView()
    var elements = [UIView]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let baseimg = UIImage(named: "Base Layout")
        let basaeimg_Width = 3600
        let basaeimg_Height = 2400
        
        setupframImg(width: CGFloat(basaeimg_Width), height: CGFloat(basaeimg_Height), img: baseimg!)
  
    
        
        

        view.backgroundColor = UIColor.bgColor
        navigationItem.title = "Personalization"
        setupbgView()
        setupframeView()
       
      
      
        

    }

    

    
  

    func setupframImg(width:CGFloat, height:CGFloat, img:UIImage){
        
          var numberOfElementArray = [[118.11, 118.14, 2250.30, 1058.22],[2415.75, 118.11, 1066.14, 1058.25],[118.11, 1223.64, 1066.14, 1058.25],[1231.50, 1223.64, 2250.39, 1058.25]]
        
        if width > height {
            
            let newWidth = screenwidth
            let newHeight = (screenwidth / width) * height
            
            
            framImg.isUserInteractionEnabled = true
            framImg.image = img
            framImg.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(framImg)
            framImg.centerXAnchor.constraint(equalTo: frameView.centerXAnchor).isActive = true
            framImg.centerYAnchor.constraint(equalTo: frameView.centerYAnchor).isActive = true
            framImg.widthAnchor.constraint(equalToConstant: newWidth).isActive = true
            framImg.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
            
            
                        for j in 0..<numberOfElementArray.count {
            
                            print(numberOfElementArray[j].description)
                 
            
                            
                            setupElemetView(x: CGFloat(numberOfElementArray[j][0]), y:  CGFloat(numberOfElementArray[j][1]), width: CGFloat(numberOfElementArray[j][2]), height: CGFloat(numberOfElementArray[j][3]), newBaseLayout_Width: newWidth, oldBaseLayout_Width: width, newBaseLayout_Height: newHeight, oldBaseLayout_Height: height)
                            
                        }
                 
        
          
        }
        
        if width < height {
            
            let newWidth = ((screenheight / 2)  /  height) * width
            let newHeight = (screenheight / 2)
            
            
            framImg.isUserInteractionEnabled = true
            framImg.image = img
            framImg.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(framImg)
            framImg.centerXAnchor.constraint(equalTo: frameView.centerXAnchor).isActive = true
            framImg.centerYAnchor.constraint(equalTo: frameView.centerYAnchor).isActive = true
            framImg.widthAnchor.constraint(equalToConstant: newWidth).isActive = true
            framImg.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
            
            for j in 0..<numberOfElementArray.count {
                
                print(numberOfElementArray[j].description)
                
                
                
                setupElemetView(x: CGFloat(numberOfElementArray[j][0]), y:  CGFloat(numberOfElementArray[j][1]), width: CGFloat(numberOfElementArray[j][2]), height: CGFloat(numberOfElementArray[j][3]), newBaseLayout_Width: newWidth, oldBaseLayout_Width: width, newBaseLayout_Height: newHeight, oldBaseLayout_Height: height)
                
            }
            
        }
    
    }
    

    func setupElemetView(x: CGFloat, y: CGFloat, width:CGFloat, height:CGFloat,newBaseLayout_Width:CGFloat, oldBaseLayout_Width:CGFloat, newBaseLayout_Height:CGFloat, oldBaseLayout_Height:CGFloat){
        
        
            let ratio_Width = (newBaseLayout_Width / oldBaseLayout_Width)
            let ratio_Height = (newBaseLayout_Height / oldBaseLayout_Height)
        
            let newX = x * ratio_Width
            let newY = y * ratio_Height
        
            let newWidth = width * ratio_Width
            let newHeight = height * ratio_Height
        
       
            let elementView = UIView()
            elementView.frame  = CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
            elementView.isUserInteractionEnabled = true
            elementView.backgroundColor = UIColor.clear
            framImg.addSubview(elementView)
            elements.append(elementView)
            setupChoosenImage(width: 300, height: 168, ElementWidth: newWidth, ElementHeight: newHeight)
    
    }

    func setupChoosenImage(width:CGFloat, height:CGFloat, ElementWidth: CGFloat, ElementHeight:CGFloat){
        
        if width <= height {
            
            let newWidth = ElementWidth
            let newHeight = (newWidth * height)  / ElementWidth
            
            
            let img = UIImageView()
            img.frame  = CGRect(x: 0 , y: 0, width: newWidth, height:newHeight)
            img.isUserInteractionEnabled = true
            img.image = UIImage(named: "images")
          
            elements[0].addSubview(img)
            
            
        }
        
        func myPanAction(_ recognizer: UIPanGestureRecognizer) {
            let translation = recognizer.translation(in: self.view)
            if let myView = recognizer.view {
                myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
            }
            recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        }
        
        
        if width >= height {
            
            let newHeight = ElementHeight
            let newWidth = (newHeight * width)  / ElementHeight
           
            

            let img = UIImageView()
            img.frame  = CGRect(x: 0 , y: 0, width: newWidth, height:newHeight)
            img.isUserInteractionEnabled = true
            img.image = UIImage(named: "images")
         
            elements[0].addSubview(img)
            
        }
        
   
        
    }
    
    

    
    let frameView: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.white
        lineView.applyShadow()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupframeView(){
        bgView.addSubview(frameView)
        
        frameView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor).isActive = true
        frameView.topAnchor.constraint(equalTo: bgView.topAnchor,constant:10).isActive = true
        frameView.widthAnchor.constraint(equalTo: bgView.widthAnchor, constant: -20).isActive = true
        frameView.heightAnchor.constraint(equalTo: bgView.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    
    
    let bgView: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.backgroundColor = UIColor.bgColor
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupbgView(){
        view.addSubview(bgView)
        
        bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bgView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

    
    
    
    
    
}





