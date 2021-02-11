//
//  VideoTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/29.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class VideoTableViewCell: UITableViewCell {
    
    public var thumbnailView: UIImageView{
        videoContentView.thumbnailView
    }
    public var titleLabel: UILabel{
        videoContentView.titleLabel
    }
    public var detailLabel: UILabel{
        videoContentView.detailLabel
    }
    
    private var videoContentView: VideoContentView!
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.videoContentView = VideoContentView()
        self.contentView.addSubview(self.videoContentView)
        
        contentView.autoresizingMask = .flexibleHeight
        
        videoContentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            NSLayoutConstraint.init(item: self.contentView, attribute: .leading, relatedBy: .equal, toItem: videoContentView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: videoContentView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .top, relatedBy: .equal, toItem: videoContentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .bottom, relatedBy:.equal, toItem: videoContentView, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setThumbnail(path:String){
        thumbnailView.image = getImage(path: path)
    }
    
    func setThumbnail(url:String){
        thumbnailView.image = getImage(url: url)
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

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
