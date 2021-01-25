//
//  SwitchTableViewCell.swift
//  MajorTableViewCell
//
//  Created by p-x9 on 2019/09/30.
//  Copyright © 2019 p-x9. All rights reserved.
//

import UIKit

public class SwitchTableViewCell: UITableViewCell {
    
    public var cellSwitch: UISwitch!
    public var switchChangedhHandelr:((UISwitch)->Void)?

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        cellSwitch = UISwitch()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellSwitch.isOn = false
        cellSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        
        self.accessoryView = self.cellSwitch
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func switchChanged(_ sender: Any) {
        if let handler = self.switchChangedhHandelr{
            handler(self.cellSwitch)
        }
    }
    
}
