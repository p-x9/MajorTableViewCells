//
//  UITextView+placeholder.swift
//  TimeTable
//
//  Created by p-x9 on 2019/10/28.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

@IBDesignable
public class PlaceHolderTextView: UITextView {
    // MARK: Properties
    
    /// プレースホルダー
    @IBInspectable public var placeHolder: String = "" {
        didSet {
            self.placeHolderLabel.text = self.placeHolder
            self.placeHolderLabel.sizeToFit()
        }
    }
    
    /// [プレースホルダー]ラベル
    private lazy var placeHolderLabel: UILabel = UILabel(frame: CGRect(x: 6.0,
                                                                       y: 6.0,
                                                                       width: 0.0,
                                                                       height: 0.0))
    
    // MARK: Initializers
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textChanged),
                                               name:UITextView.textDidChangeNotification,
                                               object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configurePlaceHolder()
        changeVisiblePlaceHolder()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textChanged),
                                               name:UITextView.textDidChangeNotification,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: View Lifecycle
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        

        configurePlaceHolder()
        changeVisiblePlaceHolder()
    }
    
    // MARK: Private Methods
    
    /// プレースホルダーを構築する
    private func configurePlaceHolder() {
        self.placeHolderLabel.lineBreakMode = .byWordWrapping
        self.placeHolderLabel.numberOfLines = 0
        self.placeHolderLabel.font = self.font
        if #available(iOS 13, *){
            self.placeHolderLabel.textColor = .secondaryLabel
        }
        else{
            self.placeHolderLabel.textColor = UIColor(red: 0.0,green: 0.0,blue: 0.0980392,alpha: 0.22)
        }
        self.placeHolderLabel.backgroundColor = .clear
        self.placeHolderLabel.removeFromSuperview()
        self.addSubview(placeHolderLabel)
    }
    
    /// プレースホルダーの表示/非表示を切り替える
    private func changeVisiblePlaceHolder() {
        if self.placeHolder.isEmpty || !self.text.isEmpty {
            self.placeHolderLabel.alpha = 0.0
        } else {
            self.placeHolderLabel.alpha = 1.0
        }
    }
    
    /// テキスト変更
    ///
    /// - Parameter notification: 通知
    @objc private func textChanged(notification: NSNotification?) {
        changeVisiblePlaceHolder()
    }
}

