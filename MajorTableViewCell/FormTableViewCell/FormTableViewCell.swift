//
//  FormTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/10/06.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class FormTableViewCell: UITableViewCell {
    
    public let titleLabel: UILabel
    public let formTextField: UITextField
    
    public var changeTextFieldhandler: ((String)->Void)?
    public var editingStartHandler:(()->Void)?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.titleLabel = UILabel.init()
        self.formTextField = UITextField.init()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(formTextField)
        
        self.contentView.addConstraints([
            NSLayoutConstraint.init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0),
        ])
        
        self.contentView.addConstraints([
            NSLayoutConstraint.init(item: formTextField, attribute: .leading, relatedBy: .equal, toItem: self.titleLabel, attribute: .trailing, multiplier: 1, constant: 8),
            NSLayoutConstraint.init(item: formTextField, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: formTextField, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1, constant: 0),
            
            NSLayoutConstraint.init(item: titleLabel, attribute: .width, relatedBy:.lessThanOrEqual, toItem: self.formTextField, attribute: .width, multiplier: 0.75, constant: 0),
        ])
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.formTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.formTextField.textAlignment = .right
        
        self.formTextField.delegate = self
        self.formTextField.addTarget(self, action: #selector(changeFormTextField(_:)), for: .editingChanged)
        self.formTextField.addTarget(self, action: #selector(editStartFormTextField(_:)), for: .editingDidBegin)
//        self.formTextField.layer.borderWidth = 1
//        self.titleLabel.layer.borderWidth = 1
//        self.titleLabel.layer.borderColor = UIColor.red.cgColor
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.alignmentRect(forFrame: titleLabel.frame).width
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func changeFormTextField(_ sender: Any) {
        if let handler = self.changeTextFieldhandler{
            handler(self.formTextField.text ??  "")
        }
    }
    
    @objc func editStartFormTextField(_ sender: Any) {
        if let handler = self.editingStartHandler{
            handler()
        }
    }
}

extension FormTableViewCell: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
