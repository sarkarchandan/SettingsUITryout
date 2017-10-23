//
//  MainSettingViewController.swift
//  SettingsUITryout
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit
import SettingsUITryoutFramework

class MainSettingViewController: SettingsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = [
            SettingsSection(title: "Scan", rows: [SettingsRow(title: "Scan State", description: "This setting denotes the active or inactive state of the scan module. This is autolayout hell that we are recovering from. At least trying our best to."),SettingsRow(title: "Scan Priority", description: "This setting denotes the priority in which scan nodule should consume the processing power.")]),
            SettingsSection(title: "Location", rows: [SettingsRow(title: "Location State", description: "This setting denotes the active or inactive state of the location module."),SettingsRow(title: "Location Priority", description: "This setting denotes the priority in which Location module should consume the processing power.")]),
            SettingsSection(title: "Position", rows: [SettingsRow(title: "Position State", description: "This setting denotes the active or inactive state of the position module."),SettingsRow(title: "Position Priority", description: "This setting denotes the priority  in which Position module should consume processing power.")])]
    }
}
