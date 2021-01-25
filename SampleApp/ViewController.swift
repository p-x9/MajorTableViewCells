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
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
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
        default:
            return UITableViewCell()
        }
    }
    
    
}
