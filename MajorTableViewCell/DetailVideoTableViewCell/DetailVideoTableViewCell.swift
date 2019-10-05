//
//  DetailVideoTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/10/05.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit
import AVKit

class DetailVideoTableViewCell: UITableViewCell {
    
    @IBOutlet var thumbnailView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    var cellview: UITableViewCell!
    let bundle = Bundle(for: VideoTableViewCell.self)
    

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        // Initialization code
    }
    
    private func initView(){
        let nib = UINib(nibName: "DetailVideoTableViewCell", bundle: bundle)
        
        cellview = nib.instantiate(withOwner: self, options: nil).first as? UITableViewCell
        addSubview(cellview)
        cellview.point(inside: CGPoint(x: 0, y: 0), with: nil)
    }
    
    func setFileAttr(path:String){
        self.setVideoData(path: path)
        self.setVideoDate(path: path)
        self.setVideoLength(path: path)
    }
    func setThumbnail(path:String){
        thumbnailView.image = getImage(path: path)
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
