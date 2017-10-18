//
//  SettingsView.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

class SettingsView {
    weak var settingsTitle: UILabel? {
        let label = UILabel()
        label.tintColor = .darkGray
        label.font = UIFont(name: "Avenir Next", size: 20)
        return label
    }
    
    weak var settingsDescription: UITextView? {
        let textView = UITextView()
        textView.tintColor = .lightGray
        textView.font = UIFont(name: "Avenir Next", size: 14)
        return textView
    }
    
    init(title: String,description: String) {
        self.settingsTitle?.text = title
        self.settingsDescription?.text = title
    }
}
