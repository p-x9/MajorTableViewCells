//
//  TwitterTimeLineCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/29.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class TwitterTimeLineCell: UITableViewCell {
    
    public var iconView: UIImageView{
        tweetContentView.iconView
    }
    public var nameLabel: UILabel{
        tweetContentView.nameLabel
    }
    public var idLabel: UILabel{
        tweetContentView.idLabel
    }
    public var tweetLabel: UILabel{
        tweetContentView.tweetLabel
    }
    
    private var tweetContentView: TwitterTimeLineContentView!
    
//    public var isDark:Bool!{
//        get{
//            return tweetContentView?.backgroundColor! == .white ? false:true
//        }
//        set(flag){
//            tweetContentView.backgroundColor = flag ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : .white
//            nameLabel.textColor = flag ? .white : .black
//            idLabel.textColor = flag ? .white : .black
//            tweetLabel.textColor = flag ? .white : .black
//            iconView.layer.borderColor = flag ? UIColor.white.cgColor : UIColor.black.cgColor
//        }
//    }
    
    public var isRound:Bool{
        get{
            return iconView.clipsToBounds == true ? true:false
        }
        set(flag){
            self.clipIcon(flag: flag)
        }
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.tweetContentView = TwitterTimeLineContentView()
        self.contentView.addSubview(self.tweetContentView)
        
        contentView.autoresizingMask = .flexibleHeight
        
        tweetContentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            NSLayoutConstraint.init(item: self.contentView, attribute: .leading, relatedBy: .equal, toItem: tweetContentView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: tweetContentView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .top, relatedBy: .equal, toItem: tweetContentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .bottom, relatedBy:.equal, toItem: tweetContentView, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefaults(){
//        isDark = false
        isRound = false
    }
    
    func setIcon(path:String){
        iconView.image = getImage(path: path)
    }
    
    func setIcon(url:String){
        iconView.image = getImage(url: url)
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
    
    
    private func clipIcon(flag:Bool){
        //角丸をつけるための設定。falseだと真四角のまま。
        self.iconView.clipsToBounds = flag
        //widthの半分にすると、ちょうど真円になる
        self.iconView.layer.cornerRadius = self.iconView.frame.size.width / 2.0
    }
    
}

