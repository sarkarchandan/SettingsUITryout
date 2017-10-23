//
//  SettingsViewControllerDataSource.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDataSource: class {
    func numberOfSettings(in settingsViewController: SettingsViewController) -> Int
    func settingsViewController(_ settingsViewController: SettingsViewController, numberOfSettingsIn: Int) -> Int
    func settingsViewController(_ settingsViewController: SettingsViewController, update setting: SettingsRow, at cell: UITableViewCell, for indexPath: IndexPath)
}
