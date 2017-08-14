//
//  uploadVC.swift
//  Fotonicia
//
//  Created by sawan on 27/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit
import UICircularProgressRing
class uploadVC: UIViewController, UICircularProgressRingDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.bgColor
        setupprogressview()
        setupmessagelbl()
        progressview.delegate = self
       
    }

    let  progressview: UICircularProgressRingView = {
        let lineView = UICircularProgressRingView()
        lineView.maxValue = 100
        lineView.value = 0
        lineView.ringStyle = UICircularProgressRingStyle(rawValue: 1)!
        lineView.outerRingColor = UIColor(red: 30/255, green: 176/255, blue: 256/255, alpha: 1)
        lineView.innerRingColor = UIColor(red: 113/255, green: 205/255, blue: 250/255, alpha: 1)
        lineView.startAngle = 90
        lineView.font = UIFont.systemFont(ofSize: 70)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupprogressview(){
        view.addSubview(progressview)
        progressview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        progressview.widthAnchor.constraint(equalToConstant: 200).isActive = true
        progressview.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    // The delegate method!
    func finishedUpdatingProgress(forRing ring: UICircularProgressRingView) {
        if ring === progressview {
            print("From delegate: Ring 1 finished")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         progressview.animationStyle = kCAMediaTimingFunctionLinear
         progressview.setProgress(value: 100, animationDuration: 5, completion: nil)
    }
    
    
    
    
    let  messagelbl: UILabel = {
        let lineView = UILabel()
        lineView.text = "Do not switch off your phone. Use wifi connection for faster upload of your photos."
        lineView.font = UIFont.systemFont(ofSize: 16)
        lineView.textColor = UIColor.black
        lineView.textAlignment = .center
        lineView.numberOfLines  = 0
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    func setupmessagelbl(){
        view.addSubview(messagelbl)
        
        messagelbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messagelbl.topAnchor.constraint(equalTo: progressview.bottomAnchor, constant: 20).isActive = true
        messagelbl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        messagelbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    

}
