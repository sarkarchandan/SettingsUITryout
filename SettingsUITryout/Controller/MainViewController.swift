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
        let sectionObject1 = SectionObject(with: "Scan", and: [RowObject(with: "Scan State"),RowObject(with: "Scan Priority")])
        let sectionObject2 = SectionObject(with: "Location", and: [RowObject(with: "Location State"), RowObject(with: "Location Priority")])
        let sectionObject3 = SectionObject(with: "Position", and: [RowObject(with: "Position State"), RowObject(with: "Position Priority")])
        datasource = [sectionObject1,sectionObject2,sectionObject3]
    }
}
