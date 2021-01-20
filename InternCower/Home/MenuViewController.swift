//
//  MenuViewController.swift
//  InternCower
//
//  Created by TofuKma on 1/12/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    var itemsMenu = [
          MenuItemModel(image: "ic_report", title: "REPORT"),
          MenuItemModel(image: "ic_guide", title: "Guide"),
          MenuItemModel(image: "ic_intro", title: "Introduction"),
          MenuItemModel(image: "ic_settings", title: "Setting"),
          MenuItemModel(image: "ic_logout", title: "Logout")
      ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.myBoldPurple
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        // Do any additional setup after loading the view.
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return itemsMenu.count
       }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuTableViewCell {
            let item = itemsMenu[indexPath.row]
                   cell.setup(model: item)
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MenuTableViewCell {
            if cell.titleLabel.text == MenuLabel.logout.rawValue {
                    print("Handle logout")
                
            }
        }

    }
    //MARK:-Header for UITableVie
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        let accountNameLabel = UILabel(frame: CGRect(x: 12, y: 0, width: tableView.frame.width, height: 60))
        header.addSubview(accountNameLabel)
        accountNameLabel.textColor = .green
        accountNameLabel.text = Constants.accountName
        accountNameLabel.textColor = .white
        accountNameLabel.textAlignment = .justified
        accountNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}
