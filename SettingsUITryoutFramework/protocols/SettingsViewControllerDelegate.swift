//
//  SettingsViewControllerDelegate.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsView(_ settingsView: SettingsView, didUpdateSettingStateAt indexPath: IndexPath)
}
