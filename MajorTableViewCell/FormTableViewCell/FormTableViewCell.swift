//
//  FormTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/10/06.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var formTextField: UITextField!
    
    var cellview: UITableViewCell!
    let bundle = Bundle(for: VideoTableViewCell.self)
    

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        // Initialization code
    }
    
    private func initView(){
        let nib = UINib(nibName: "FormTableViewCell", bundle: bundle)
        
        cellview = nib.instantiate(withOwner: self, options: nil).first as? UITableViewCell
        addSubview(cellview)
        cellview.point(inside: CGPoint(x: 0, y: 0), with: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func editTextField(_ sender: Any){//キーボード用
    }
    @IBAction func endTextField(_ sender: Any) {
    }
    
    
    
}
