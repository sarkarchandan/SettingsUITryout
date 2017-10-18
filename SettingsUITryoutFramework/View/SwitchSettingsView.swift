//
//  SwitchSettingsView.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

class SwitchSettingsView: SettingsView {
    weak var settingsSwitch: UISwitch? {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = false
        return uiSwitch
    }
}
