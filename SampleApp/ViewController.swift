//
//  ViewController.swift
//  SampleApp
//
//  Created by p-x9 on 2021/01/26.
//  Copyright © 2021 p-x9. All rights reserved.
//

import UIKit
import MajorTableViewCell

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "\(SwitchTableViewCell.self)")
        self.tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: "\(MemoTableViewCell.self)")
        self.tableView.register(FormTableViewCell.self, forCellReuseIdentifier: "\(FormTableViewCell.self)")
        self.tableView.register(DetailVideoTableViewCell.self, forCellReuseIdentifier: "\(DetailVideoTableViewCell.self)")
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section,indexPath.row) {
        case (0,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SwitchTableViewCell.self)", for: indexPath) as! SwitchTableViewCell
            cell.textLabel?.text = "title"
            cell.cellSwitch.isOn = true
            cell.switchChangedhHandelr = {cellswitch in
                print("value changed:\(cell.cellSwitch.isOn)")
            }
            return cell
        case (0,1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MemoTableViewCell.self)", for: indexPath) as! MemoTableViewCell
            cell.memoView.text = "hello\nI'm fine."
            cell.editingStartHandler = {()->Void in
                print("edit start")
            }
            cell.memoChangedHandler = {text in
                print("text updated :\(text)")
            }
            return cell
        case (0,2):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(FormTableViewCell.self)", for: indexPath) as! FormTableViewCell
            cell.titleLabel.text = "title"
            cell.formTextField.text = "test"
            cell.editingStartHandler = {()->Void in
                print("edit start")
            }
            cell.changeTextFieldhandler = {text in
                print("value changed:\(text)")
            }
            return cell
        case (0,3):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailVideoTableViewCell.self)", for: indexPath) as! DetailVideoTableViewCell
            cell.authorLabel.text = "author"
            cell.dataLabel.text = "data"
            cell.titleLabel.text = "title"
            cell.dateLabel.text = "date"
            cell.lengthLabel.text = "length"
            cell.thumbnailView.image = .actions
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section,indexPath.row) {
        case (0,1):
            return 120
        case (0,3):
            return 80
        default:
            tableView.estimatedRowHeight = 60
            return UITableView.automaticDimension
        }
    }
    
    
}
