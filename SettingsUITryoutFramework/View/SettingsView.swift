//
//  SettingsView.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    var settingsTitleLabel: UILabel!
    var settingsDescriptionTextView: UITextView!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.willSetupSettingsTitleLabel()
        self.willSetupSettingsDescriptionTextView()
    }
    
    //MARK: Setup - SettingsTitleLabel
    private func willSetupSettingsTitleLabel() {
        self.settingsTitleLabel = UILabel()
        self.settingsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.settingsTitleLabel.textColor = .darkGray
        self.settingsTitleLabel.backgroundColor = .clear
        self.settingsTitleLabel.text = "_default title"
    }
    
    //MARK: Setup - SettingsDescriptionTextView
    private func willSetupSettingsDescriptionTextView() {
        self.settingsDescriptionTextView = UITextView()
        self.settingsDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        self.settingsDescriptionTextView.textContainer.lineFragmentPadding = 0
        self.settingsDescriptionTextView.textContainer.lineBreakMode = .byTruncatingTail
        self.settingsDescriptionTextView.isEditable = false
        self.settingsDescriptionTextView.isScrollEnabled = false
        self.settingsDescriptionTextView.textColor = .lightGray
        self.settingsDescriptionTextView.backgroundColor = .clear
        self.settingsDescriptionTextView.contentMode = .scaleToFill
        self.settingsDescriptionTextView.text = "_default description"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
