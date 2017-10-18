//
//  SettingsViewControllerDelegate.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewController(_ settingsViewController: SettingsViewController, didUpdateSettingsView: SettingsView, at indexPath: IndexPath)
}
