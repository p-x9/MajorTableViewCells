//
//  DetailVideoTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/10/05.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit
import AVKit

public class DetailVideoTableViewCell: UITableViewCell {
    
    public var thumbnailView: UIImageView{
        videoContentView.thumbnailView
    }
    public var titleLabel: UILabel{
        videoContentView.titleLabel
    }
    public var authorLabel: UILabel{
        videoContentView.authorLabel
    }
    public var dateLabel: UILabel{
        videoContentView.dateLabel
    }
    public var lengthLabel: UILabel{
        videoContentView.lengthLabel
    }
    public var dataLabel: UILabel{
        videoContentView.dataLabel
    }
    
    private let bundle = Bundle(for: DetailVideoTableViewCell.self)
    private var videoContentView: DetailVideoContentView!

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.videoContentView = DetailVideoContentView()
        self.videoContentView.frame = self.contentView.bounds
        self.contentView.addSubview(self.videoContentView)
        
        videoContentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: videoContentView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .trailing, relatedBy: .equal, toItem: videoContentView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: videoContentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy:.equal, toItem: videoContentView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .width, relatedBy:.equal, toItem: videoContentView, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .height, relatedBy:.equal, toItem: videoContentView, attribute: .height, multiplier: 1, constant: 0),
        ])
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFileAttr(path:String){
        self.setVideoData(path: path)
        self.setVideoDate(path: path)
        self.setVideoLength(path: path)
    }
    func setThumbnail(path:String){
        thumbnailView.image = getImage(path: path)
    }
    func setThumbnail(url:String){
        thumbnailView.image = getImage(url: url)
    }
    
    private func setVideoLength(path:String){
        let asset = AVAsset(url: URL(fileURLWithPath: path))
        let videoLength = asset.tracks(withMediaType: .video).first?.timeRange.duration.seconds
        self.lengthLabel.text = String(format: "%02d", Int(videoLength!/60))+":"+String(format: "%02d", Int(videoLength!) % 60)
    }
    
    private func setVideoDate(path:String){
        let fileAttr = try! FileManager.default.attributesOfItem(atPath: path)
        let date:Date = fileAttr[.creationDate]! as! Date
        let f = DateFormatter()
        f.timeStyle = .long
        f.dateStyle = .medium
        f.locale = Locale(identifier: "ja_JP")
        self.dateLabel.text = f.string(from: date)
    }
    private func setVideoData(path:String){
        let fileAttr = try! FileManager.default.attributesOfItem(atPath: path)
        self.dataLabel.text = String(format: "%3.2f", Double(fileAttr[.size]!as!Double / 1000000))+" Mbyte"
    }
    
    private func getImage(path:String)->UIImage?{
        guard let image = UIImage(contentsOfFile: path)else{
            return nil
        }
        return image
    }
    private func getImage(url:String)->UIImage?{
       let url = URL(string: url)
       do {
           let data = try Data(contentsOf: url!)
           return UIImage(data: data)!
       } catch let err {
           print("Error : \(err.localizedDescription)")
       }
       return nil
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
