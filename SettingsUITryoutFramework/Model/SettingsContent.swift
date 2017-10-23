//
//  SettingsContent.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import Foundation

//MARK: SettingsContent
open class SettingsSection: NSObject {
    let title: String
    let rows: [SettingsRow]
    
    public init(title: String, rows: [SettingsRow]) {
        self.title = title
        self.rows = rows
    }
}

open class SettingsRow: NSObject {
    let title: String
    let text: String
    
    public init(title: String, description: String) {
        self.title = title
        self.text = description
    }
}
