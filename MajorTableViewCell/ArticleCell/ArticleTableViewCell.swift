//
//  ArticleTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/30.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class ArticleTableViewCell: UITableViewCell {
    
    public var articleImageView: UIImageView{
        articleContentView.imageView
    }
    public var titleLabel: UILabel{
        articleContentView.titleLabel
    }
    public var authorLabel: UILabel{
        articleContentView.authorLabel
    }
    public var dateLabel: UILabel{
        articleContentView.dateLabel
    }
    
    private var articleContentView: ArticleContentView!
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.articleContentView = ArticleContentView()
        self.contentView.addSubview(self.articleContentView)
        
        contentView.autoresizingMask = .flexibleHeight
        
        articleContentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            NSLayoutConstraint.init(item: self.contentView, attribute: .leading, relatedBy: .equal, toItem: articleContentView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: articleContentView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .top, relatedBy: .equal, toItem: articleContentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.contentView, attribute: .bottom, relatedBy:.equal, toItem: articleContentView, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setArticleImage(path:String){
        articleImageView.image = getImage(path: path)
    }
    
    func setArticleImage(url:String){
        articleImageView.image = getImage(url: url)
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
