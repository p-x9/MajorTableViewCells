//
//  MemoTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/10/07.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class MemoTableViewCell: UITableViewCell {
    public let memoView: UITextView!
    public let toolBar:UIToolbar!
    
    public var editingStartHandler:(()->Void)?
    public var memoChangedHandler:((String)->Void)?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.memoView = UITextView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(memoView)
        
        self.contentView.addConstraints([
            NSLayoutConstraint.init(item: memoView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 15),
            NSLayoutConstraint.init(item: memoView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -15),
            NSLayoutConstraint.init(item: memoView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: memoView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        memoView.translatesAutoresizingMaskIntoConstraints = false
    
        memoView.font = .systemFont(ofSize: 17)
        memoView.delegate = self
        memoView.backgroundColor = .clear
        
        toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: NSLocalizedString("Done", comment: ""), style: .plain, target: self, action: #selector(done(_:)))
        let flexibleBarBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.items = [flexibleBarBtn,toolBarBtn]
        
        textView.inputAccessoryView = toolBar
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutIfNeeded() {
        memoView.frame = self.contentView.frame
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func done(_: UIBarButtonItem){
        textView.resignFirstResponder()
        
    }

}

extension MemoTableViewCell:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let handler = self.editingStartHandler{
            handler()
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let handler = self.memoChangedHandler{
            handler(textView.text)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}
