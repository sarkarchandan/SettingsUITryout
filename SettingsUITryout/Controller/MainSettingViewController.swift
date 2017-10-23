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
        
        //MARK: Mock Content
        let rowSwitchObject1 = SettingsRowObject(with: "Scan State", and: "This setting denotes the active or inactive state of the scan module. This is autolayout hell that we are recovering from. At least trying our best to.")
        let rowSwitchObject2 = SettingsRowObject(with: "Location State", and: "This setting denotes the active or inactive state of the location module.")
        let rowSwitchObject3 = SettingsRowObject(with: "Position State", and: "This setting denotes the active or inactive state of the position module.")
        
        let rowTextFieldObject1 = SettingsRowObject(with: "Scan Priority", and: "This setting denotes the priority in which scan nodule should consume the processing power.")
        
        let rowTextFieldObject2 = SettingsRowObject(with: "Location Priority", and: "This setting denotes the priority in which Location module should consume the processing power.")
        let rowTextFieldObject3 = SettingsRowObject(with: "Position Priority", and: "This setting denotes the priority  in which Position module should consume processing power.")
        
        let sectionObject1 = SettingsSectionObject(with: "Scan", and: [rowSwitchObject1,rowTextFieldObject1])
        let sectionObject2 = SettingsSectionObject(with: "Location", and: [rowSwitchObject2,rowTextFieldObject2])
        let sectionObject3 = SettingsSectionObject(with: "Position", and: [rowSwitchObject3,rowTextFieldObject3])
        
        datasource = [sectionObject1,sectionObject2,sectionObject3]
    }
}
