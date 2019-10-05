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
    
    public var isDark:Bool!{
        get{
            return cellview?.backgroundColor! == .white ? false:true
        }
        set(flag){
            cellview.backgroundColor = flag ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : .white
            nameLabel.textColor = flag ? .white : .black
            idLabel.textColor = flag ? .white : .black
            tweetLabel.textColor = flag ? .white : .black
            iconView.layer.borderColor = flag ? UIColor.white.cgColor : UIColor.black.cgColor
        }
    }
    
    public var isRound:Bool{
        get{
            return iconView.clipsToBounds == true ? true:false
        }
        set(flag){
            self.clipIcon(flag: flag)
        }
    }

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
        
        iconView.layer.borderWidth = 1
        //fatalError()
    }
    
    private func initDefaults(){
        isDark = false
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
    
    private func clipIcon(flag:Bool){
        //角丸をつけるための設定。falseだと真四角のまま。
        self.iconView.clipsToBounds = flag
        //角丸の半径
        self.iconView.layer.cornerRadius = 3.0
        //widthの半分にすると、ちょうど真円になる
        self.iconView.layer.cornerRadius = self.iconView.frame.size.width / 2.0
    }
    
}

