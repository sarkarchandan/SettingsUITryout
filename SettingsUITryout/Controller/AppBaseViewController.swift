//
//  AppBaseViewController.swift
//  SettingsUITryout
//
//  Created by Chandan Sarkar on 23.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

enum UseCaseSetting: Int {
    case BaseCaseSetting = 0
    case OtherSetting
    
    init?(indexPath: IndexPath) {
        self.init(rawValue: indexPath.row)
    }
}

class AppBaseViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "AppBase"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "BaseCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseCell")
        guard let useCase = UseCaseSetting(indexPath: indexPath) else {fatalError("Invalid Index Path")}
        switch useCase {
        case .BaseCaseSetting:
            cell?.textLabel?.text = "BaseCase Setting"
        case.OtherSetting:
            cell?.textLabel?.text = "Other Setting"
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let useCase = UseCaseSetting(indexPath: indexPath) else {fatalError("Invalid Setting")}
        switch useCase {
        case .BaseCaseSetting:
            let navigationController = UINavigationController(rootViewController: MainSettingViewController())
            present(navigationController, animated: true, completion: nil)
        case .OtherSetting:
            print("Other Setting not implemented")
        }
    }
}
