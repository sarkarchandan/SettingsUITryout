//
//  MainViewController.swift
//  SettingsUITryout
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit
import SettingsUITryoutFramework

class MainViewController: SettingsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Mock Content
        let rowObject1 = SettingsRowObject(with: "Scan State", and: "This setting denotes the active or inactive state of the scan module. This is autolayout hell that we are recovering from. At least trying our best to.")
        let rowObject2 = SettingsRowObject(with: "Location State", and: "This setting denotes the active or inactive state of the location module.")
        let rowObject3 = SettingsRowObject(with: "Position State", and: "This setting denotes the active or inactive state of the position module.")
        
        let sectionObject1 = SettingsSectionObject(with: "Scan", and: [rowObject1])
        let sectionObject2 = SettingsSectionObject(with: "Location", and: [rowObject2])
        let sectionObject3 = SettingsSectionObject(with: "Position", and: [rowObject3])
        
        datasource = [sectionObject1,sectionObject2,sectionObject3]
    }
}
