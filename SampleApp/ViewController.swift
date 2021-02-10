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
        self.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "\(ArticleTableViewCell.self)")
        self.tableView.register(TwitterTimeLineCell.self, forCellReuseIdentifier: "\(TwitterTimeLineCell.self)")
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 6
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section,indexPath.row) {
        case (0,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SwitchTableViewCell.self)", for: indexPath) as! SwitchTableViewCell
            cell.textLabel?.text = "Wi-Fi"
            cell.imageView?.image = UIImage(systemName:"wifi")
            cell.imageView!.layer.cornerRadius = cell.imageView!.frame.height/2
            cell.imageView?.layer.borderWidth = 0.1
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
            cell.titleLabel.text = "Name"
            cell.formTextField.placeholder = "enter your name"
            cell.editingStartHandler = {()->Void in
                print("edit start")
            }
            cell.changeTextFieldhandler = {text in
                print("value changed:\(text)")
            }
            return cell
        case (0,3):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailVideoTableViewCell.self)", for: indexPath) as! DetailVideoTableViewCell
            cell.authorLabel.text = "Apple"
            cell.dataLabel.text = "248 MByte"
            cell.titleLabel.text = "Apple Event — October 13"
            cell.dateLabel.text = "2020/10/14"
            cell.lengthLabel.text = "1:10:58"
            cell.thumbnailView.image = UIImage.init(named: "videoThumbnail")
            return cell
        case (0,4):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ArticleTableViewCell.self)", for: indexPath) as! ArticleTableViewCell
            cell.articleImageView.image = UIImage(named: "swift")
            cell.titleLabel.text = "[Swift] RxSwift入門-主なUIアーキテクチャの説明"
            cell.authorLabel.text = "author"
            cell.dateLabel.text = "\(Date())"
            return cell
        case (0,5):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(TwitterTimeLineCell.self)", for: indexPath) as! TwitterTimeLineCell
            cell.iconView.image = UIImage.init(named: "twiIcon")
            cell.idLabel.text = "@NSA"
            cell.nameLabel.text = "NSA"
            cell.tweetLabel.text = "A software reverse engineering (SRE) suite of tools developed by NSA's Research Directorate in support of the Cybersecurity mission"
            cell.isRound = true
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
//        case (0,4):
//            return 80
        default:
            tableView.estimatedRowHeight = 60
            return UITableView.automaticDimension
        }
    }
    
    
}
