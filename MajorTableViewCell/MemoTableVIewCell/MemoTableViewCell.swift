//
//  MemoTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/10/07.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    let memoView = UITextView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.addSubview(memoView)
    }
    
    override func layoutIfNeeded() {
        memoView.frame = self.contentView.frame
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
