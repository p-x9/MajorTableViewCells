//
//  TwitterTimeLineCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/29.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class TwitterTimeLineCell: UITableViewCell {
    
    @IBOutlet public var iconView: UIImageView!
    @IBOutlet public var nameLabel: UILabel!
    @IBOutlet public var idLabel: UILabel!
    @IBOutlet public var tweetLabel: UILabel!
    
    var cellview: UITableViewCell!
    let bundle = Bundle(for: VideoTableViewCell.self)
    let defaultCellHeight:CGFloat = 76
    
    var isDark:Bool!

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
        tweetLabel.addObserver(self, forKeyPath: "text", options: [.new], context: nil)
    }
    
    private func initView(){
        let nib = UINib(nibName: "TwitterTimeLineCell", bundle: bundle)
        
        cellview = nib.instantiate(withOwner: self, options: nil).first as? UITableViewCell
        
        cellview.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: cellview.contentView.frame.size.height)
        
        cellview.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth/*,UIView.AutoresizingMask.flexibleHeight*/]
        
        self.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight]
        
        self.addSubview(cellview)
        
        
        topAnchor.constraint(equalTo: cellview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: cellview.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: cellview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: cellview.trailingAnchor).isActive = true
        
        updateConstraints()
        
        nameLabel.text = ""
        idLabel.text = ""
        tweetLabel.text = ""
        //fatalError()
    }
    
    func initDefaults(){
        isDark = false
    }
   

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text"{
            
            print(cellview.contentView.frame.size.height)
            print(cellview.frame.size.height)
            //tweetLabelのサイズを更新
            tweetLabel.sizeToFit()
            
            //元の高さ+あるべきtweetLabelの高さ-元の高さ
            let newCellHeight = defaultCellHeight + abs(tweetLabel.frame.size.height - 22)
            
            cellview.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: newCellHeight)
        }
    }
    
    func setBackColor(){
        if isDark{
            cellview.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        else{
            
        }
    }
}

