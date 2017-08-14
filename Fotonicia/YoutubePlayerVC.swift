//
//  YoutubePlayerVC.swift
//  Fotonicia
//
//  Created by sawan on 24/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import Foundation
import UIKit
import YouTubeFloatingPlayer

class YoutubePlayerVC: UITableViewController  {
    
    
    
    let videoIds = ["f0NdOE5GTgo", "2q906bSLEkw", "xQ_IQS3VKjA"]
    let videoTitles = ["Blank Details View", "Custom Details View", "TableView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Youtube Channel"
        view.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handledismiss))
    
        tableView.register(VideoCell.self, forCellReuseIdentifier: "videoCell")
    }
    
    func handledismiss(){
        
        self.dismiss(animated: true, completion: nil)
    
    }
    
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoIds.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as? VideoCell {
            let link = "http://img.youtube.com/vi/\(videoIds[indexPath.row])/0.jpg"
            cell.setup(with: link, title: videoTitles[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            YTFPlayer.initYTF(with: UIView(), videoID: videoIds[indexPath.row])
        case 1:
            let view = UIView()
            view.backgroundColor = UIColor(white: 0, alpha: 0.5)
            YTFPlayer.initYTF(with: view, videoID: videoIds[indexPath.row])
        case 2:
            YTFPlayer.initYTF(with: tableView, tableCellNibName: "VideoCell", tableCellReuseIdentifier: "videoCell", videoID: videoIds[indexPath.row])
        default:
            YTFPlayer.initYTF(with: UIView(), videoID: videoIds[indexPath.row])
        }
        
        YTFPlayer.showYTFView(viewController: self)
    }

    
    
}





class VideoCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupyoutubeView()
        setuptitlelbl()
    }
    
    func setup(with link: String, title: String) {
        youtubeView.downloadedFrom(link: link)
        titlelbl.text = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var youtubeView: UIImageView = {
        let tv = UIImageView()
        tv.contentMode = .scaleToFill
        tv.backgroundColor = UIColor(white: 0, alpha: 0.5)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    func setupyoutubeView(){
        addSubview(youtubeView)
        youtubeView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 7).isActive = true
        youtubeView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        youtubeView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        youtubeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

    let titlelbl: UILabel = {
        let tv = UILabel()
        tv.textColor = UIColor.black
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    func setuptitlelbl(){
        addSubview(titlelbl)
        titlelbl.leftAnchor.constraint(equalTo: youtubeView.rightAnchor,constant: 7).isActive = true
        titlelbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titlelbl.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -10).isActive = true
        titlelbl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

    
    
}





extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}




