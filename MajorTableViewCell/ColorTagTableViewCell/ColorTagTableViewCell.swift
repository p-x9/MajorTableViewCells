//
//  ColorTagTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/30.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

class ColorTagTableViewCell: UITableViewCell {
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
