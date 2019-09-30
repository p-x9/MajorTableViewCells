//
//  ArticleTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/30.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    var cellview: UITableViewCell!
    let bundle = Bundle(for: VideoTableViewCell.self)
    let defaultCellHeight:CGFloat = 93

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
        titleLabel.addObserver(self, forKeyPath: "text", options: [.new], context: nil)
    }
    
    private func initView(){
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: bundle)
        
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
        
        titleLabel.text = ""
        detailLabel.text = ""
        authorLabel.text = ""
        
        articleImageView.image = UIImage(named: "no-image", in: bundle, compatibleWith: nil)
        
        //fatalError()
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text"{
            
            //tweetLabelのサイズを更新
            titleLabel.sizeToFit()
            
            //元の高さ+あるべきtweetLabelの高さ-元の高さ
            let newCellHeight = defaultCellHeight + abs(titleLabel.frame.size.height - 20.5)
            
            cellview.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: newCellHeight)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
