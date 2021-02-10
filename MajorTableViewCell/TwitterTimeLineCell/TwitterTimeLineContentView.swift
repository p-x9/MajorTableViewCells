//
//  TwitterTimeLineContentView.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2021/02/11.
//  Copyright © 2021 p-x9. All rights reserved.
//

import UIKit

class TwitterTimeLineContentView: UIView {

    @IBOutlet public var iconView: UIImageView!
    @IBOutlet public var nameLabel: UILabel!
    @IBOutlet public var idLabel: UILabel!
    @IBOutlet public var tweetLabel: UILabel!
    
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
        
        self.nameLabel.text = ""
        self.idLabel.text = ""
        self.tweetLabel.text = ""
        
        self.iconView.layer.borderWidth = 1
    }
    
    private func loadNib() {
        let nib = UINib(nibName: "TwitterTimeLineContentView", bundle: Bundle(for: TwitterTimeLineContentView.self))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
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
