//
//  SettingsContent.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import Foundation

//MARK: SettingsContent
open class SettingsSectionObject: NSObject {
    var sectionHeaderTitle: String
    var settingsRowObjects: [SettingsRowObject]
    
    public init(with title: String, and rows: [SettingsRowObject]) {
        self.sectionHeaderTitle = title
        self.settingsRowObjects = rows
    }
}

open class SettingsRowObject: NSObject {
    var rowSettingsTitle: String
    var rowSettingsDescription: String
    
    public init(with title: String, and description: String) {
        self.rowSettingsTitle = title
        self.rowSettingsDescription = description
    }
}
