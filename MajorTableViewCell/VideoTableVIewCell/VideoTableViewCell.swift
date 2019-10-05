//
//  VideoTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/29.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

//@IBDesignable
public class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet public var thumbnailView: UIImageView!
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var detailLabel: UILabel!
    //var 
    
    
    var cellview: UIView!
    let bundle = Bundle(for: VideoTableViewCell.self)
    
    /*override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    private func initView(){
        let nib = UINib(nibName: "VideoTableViewCell", bundle: bundle)
        
        cellview = nib.instantiate(withOwner: self, options: nil).first as? UIView
        addSubview(cellview)
        cellview.point(inside: CGPoint(x: 0, y: 0), with: nil)
        titleLabel.text = ""
        detailLabel.text = ""
        thumbnailView.image = UIImage(named: "no-image", in: bundle, compatibleWith: nil)
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
