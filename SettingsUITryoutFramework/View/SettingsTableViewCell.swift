//
//  SettingsTableViewCell.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 19.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    var settingsView: SettingsView!
    var delegate: SettingsViewControllerDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.settingsView = SettingsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
