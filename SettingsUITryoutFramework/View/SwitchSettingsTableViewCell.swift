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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.settingsSwitch = UISwitch()
        self.settingsSwitch.translatesAutoresizingMaskIntoConstraints = false
        settingsSwitch.addTarget(self, action: #selector(settingsStateChanged), for: .valueChanged)
    }
    
    var subStackView: UIStackView?
    var superStackView: UIStackView?
    
    //UISwitch Event Detection
    @objc
    private func settingsStateChanged(_ sender: UISwitch) {
        let module = self.settingsView.settingsTitleLabel.text!
        print(sender.isOn ? "\(String(describing: module)) is ON" : "\(String(describing: module)) is OFF")
    }
    
    //Update Cell
    func updateCell(with setting: SettingsRowObject) {
        
        let settingsTitleLabel = self.settingsView.settingsTitleLabel
        let settingsDescriptionTextView = self.settingsView.settingsDescriptionTextView
        let settingsSwitch = self.settingsSwitch
        
        //Setting the values
        settingsTitleLabel?.text = setting.rowSettingsTitle
        settingsDescriptionTextView?.text = setting.rowSettingsDescription
        
        //MARK: RootView inside ContentView
        let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.backgroundColor = .white
        
        //Adding Constraints for the rootView inside contentView
        self.contentView.addSubview(rootView)
        rootView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        rootView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        rootView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        rootView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        //Setting up SubStackView
        subStackView = UIStackView(arrangedSubviews: [settingsTitleLabel!,settingsDescriptionTextView!])
        subStackView?.translatesAutoresizingMaskIntoConstraints = false
        subStackView?.axis = .vertical
        subStackView?.alignment = .fill
        subStackView?.distribution = .fill
        
        //Setting up SuperStackView
        superStackView = UIStackView(arrangedSubviews: [subStackView!,settingsSwitch!])
        rootView.addSubview(superStackView!)
        superStackView?.translatesAutoresizingMaskIntoConstraints = false
        superStackView?.axis = .horizontal
        superStackView?.alignment = .center
        superStackView?.distribution = .fill
        superStackView?.spacing = 20
        
        //Setting Content Priorities for underlying layouts
        subStackView!.setContentHuggingPriority(.init(250), for: .horizontal)
        settingsSwitch!.setContentHuggingPriority(.init(251), for: .horizontal)
        subStackView!.setContentCompressionResistancePriority(.init(750), for: .horizontal)
        settingsSwitch!.setContentCompressionResistancePriority(.init(751), for: .horizontal)
        
        //Constraints for the SubStackView
        subStackView?.topAnchor.constraint(equalTo: superStackView!.topAnchor).isActive = true
        subStackView?.leadingAnchor.constraint(equalTo: superStackView!.leadingAnchor).isActive = true
        subStackView?.bottomAnchor.constraint(equalTo: superStackView!.bottomAnchor).isActive = true
        
        //Constraints for the SuperStackView
        superStackView?.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 4).isActive = true
        superStackView?.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10).isActive = true
        superStackView?.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 4).isActive = true
        superStackView?.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -4).isActive = true
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
