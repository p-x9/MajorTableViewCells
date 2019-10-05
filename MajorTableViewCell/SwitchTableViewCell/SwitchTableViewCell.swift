//
//  SwitchTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/30.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    @IBOutlet var selectSwitch: UISwitch!
    
    var cellview: UITableViewCell!
    let bundle = Bundle(for: VideoTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        selectSwitch.isOn = false
        // Initialization code
    }
    
    private func initView(){
        let nib = UINib(nibName: "ColorTagTableViewCell", bundle: bundle)
        
        cellview = nib.instantiate(withOwner: self, options: nil).first as? UITableViewCell
        addSubview(cellview)
        cellview.point(inside: CGPoint(x: 0, y: 0), with: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}