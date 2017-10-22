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
    var subStackView: UIStackView!
    var rootView: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.settingsView = SettingsView()
    }
    
    //MARK: Layout Setup
    public func willSetupLayoutForCell() {
        let settingsTitleLabel = self.settingsView.settingsTitleLabel
        let settingsDescriptionTextView = self.settingsView.settingsDescriptionTextView
        
        //MARK: Setup - SubStackView
        subStackView = UIStackView(arrangedSubviews: [settingsTitleLabel!,settingsDescriptionTextView!])
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.axis = .vertical
        subStackView.alignment = .fill
        subStackView.distribution = .fill
        
        //MARK: Setup - RootView
        rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.backgroundColor = .white
        
        //MARK: Constraints - rootView wrt contentView
        self.contentView.addSubview(rootView)
        rootView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        rootView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        rootView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        rootView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
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
