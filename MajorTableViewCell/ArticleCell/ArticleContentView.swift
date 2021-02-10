//
//  ArticleContentView.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2021/02/10.
//  Copyright © 2021 p-x9. All rights reserved.
//

import UIKit

@IBDesignable
final public class ArticleContentView: UIView {

    @IBOutlet public var imageView: UIImageView!
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var authorLabel: UILabel!
    @IBOutlet public var dateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureView()
    }
    
    // MARK: IBActions
    
    // MARK: Other Internal Methods
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configureView()
    }
    
    // MARK: Other Private Methods
    
    private func configureView() {
        loadNib()
        
        titleLabel.text = ""
        authorLabel.text = ""
        dateLabel.text = ""
        
        imageView.image = UIImage(named: "no-image", in: Bundle(for: ArticleTableViewCell.self), compatibleWith: nil)
    }
    
    private func loadNib() {
        let nib = UINib(nibName: "ArticleContentView", bundle: Bundle(for: ArticleContentView.self))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy:.equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
        ])
    }

}
