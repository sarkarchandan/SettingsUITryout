//
//  SwitchSettingsTableViewCell.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

class SwitchSettingsTableViewCell: SettingsTableViewCell {
    
    var settingsSwitch: UISwitch!
    var superStackView: UIStackView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.willSetupSettingsSwitch()
    }
    
    //MARK: Setup - SettingsSwitch
    private func willSetupSettingsSwitch() {
        self.settingsSwitch = UISwitch()
        self.settingsSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.willSetupLayoutForCell()
        settingsSwitch.addTarget(self, action: #selector(didChangeSettingState), for: .valueChanged)
    }
    
    //MARK: UISwitch - Event Detection
    @objc
    private func didChangeSettingState(_ sender: UISwitch) {
        let module = self.settingsView.settingsTitleLabel.text!
        print(sender.isOn ? "\(String(describing: module)) is ON" : "\(String(describing: module)) is OFF")
    }
    
    //MARK: Cell - LayoutSetup
    override internal func willSetupLayoutForCell() {
        super.willSetupLayoutForCell()
        
        //MARK: Setup - SuperStackView
        superStackView = UIStackView(arrangedSubviews: [subStackView!,settingsSwitch!])
        rootView.addSubview(superStackView!)
        superStackView.translatesAutoresizingMaskIntoConstraints = false
        superStackView.axis = .horizontal
        superStackView.alignment = .center
        superStackView.distribution = .fill
        superStackView.spacing = 20
        
        //MARK: Content Priorities - SubStackView / SettingsSwitch
        subStackView.setContentHuggingPriority(.init(250), for: .horizontal)
        settingsSwitch.setContentHuggingPriority(.init(251), for: .horizontal)
        subStackView.setContentCompressionResistancePriority(.init(750), for: .horizontal)
        settingsSwitch!.setContentCompressionResistancePriority(.init(751), for: .horizontal)
        
        //MARK: Constraints - SubStackView wrt SuperStackView
        subStackView?.topAnchor.constraint(equalTo: superStackView!.topAnchor).isActive = true
        subStackView?.leadingAnchor.constraint(equalTo: superStackView!.leadingAnchor).isActive = true
        subStackView?.bottomAnchor.constraint(equalTo: superStackView!.bottomAnchor).isActive = true
        
        //MARK: Constraints - SuperStackView wrt rootView
        superStackView?.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 4).isActive = true
        superStackView?.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10).isActive = true
        superStackView?.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 4).isActive = true
        superStackView?.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -4).isActive = true
    }
    
    //MARK: Update Cell
    func updateCell(with setting: SettingsRowObject) {
        let settingsTitleLabel = self.settingsView.settingsTitleLabel
        let settingsDescriptionTextView = self.settingsView.settingsDescriptionTextView
        settingsTitleLabel?.text = setting.rowSettingsTitle
        settingsDescriptionTextView?.text = setting.rowSettingsDescription
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
    
    override var description: String {
        return "SwitchSettingsTableViewCell"
    }
}
