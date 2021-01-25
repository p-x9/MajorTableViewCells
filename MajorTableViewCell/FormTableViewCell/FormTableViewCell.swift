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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
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
