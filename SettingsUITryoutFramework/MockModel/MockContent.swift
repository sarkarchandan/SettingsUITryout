//
//  MockContent.swift
//  SettingsUITryout
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import Foundation

//MARK: MockContent Types

open class SectionObject: NSObject {
    let sectionTitle: String
    let sectionRowObjects: [RowObject]
    
    public init (with title: String, and rowObjects: [RowObject]) {
        self.sectionTitle = title
        self.sectionRowObjects = rowObjects
        super.init()
    }
}

open class RowObject: NSObject {
    let rowTitle: String
    public init(with title: String) {
        self.rowTitle = title
        super.init()
    }
}
