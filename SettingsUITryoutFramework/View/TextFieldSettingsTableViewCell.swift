//
//  TextFieldSettingsTableViewCell.swift
//  SettingsUITryoutFramework
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

class TextFieldSettingsTableViewCell: SettingsTableViewCell {

    var settingsTextField: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.settingsTextField = UITextField()
        self.settingsTextField.translatesAutoresizingMaskIntoConstraints = false
        self.settingsTextField.borderStyle = .roundedRect
        self.settingsTextField.textColor = .black
        self.settingsTextField.contentMode = .scaleAspectFit
        self.settingsTextField.placeholder = "Setting"
    }
    
    var subStackView: UIStackView?
    var superStackView: UIStackView?
    
    func updateCell(with setting: SettingsRowObject) {
        let settingTitleLabel = self.settingsView.settingsTitleLabel
        let settingDescriptionTextView = self.settingsView.settingsDescriptionTextView
        let settingTextField = self.settingsTextField
        
        //Setting the values
        settingTitleLabel?.text = setting.rowSettingsTitle
        settingDescriptionTextView?.text = setting.rowSettingsDescription
        
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
        subStackView = UIStackView(arrangedSubviews: [settingTitleLabel!,settingDescriptionTextView!])
        subStackView?.translatesAutoresizingMaskIntoConstraints = false
        subStackView?.axis = .vertical
        subStackView?.alignment = .fill
        subStackView?.distribution = .fill
        
        //Setting up SuperStackView
        superStackView = UIStackView(arrangedSubviews: [subStackView!,settingTextField!])
        rootView.addSubview(superStackView!)
        superStackView?.translatesAutoresizingMaskIntoConstraints = false
        superStackView?.axis = .horizontal
        superStackView?.alignment = .center
        superStackView?.distribution = .fill
        superStackView?.spacing = 10
        
        //Setting Content Priorities for underlying layouts
        subStackView!.setContentHuggingPriority(.init(249), for: .horizontal)
        settingTextField!.setContentHuggingPriority(.init(251), for: .horizontal)
        subStackView!.setContentCompressionResistancePriority(.init(750), for: .horizontal)
        settingTextField!.setContentCompressionResistancePriority(.init(749), for: .horizontal)
        
        
        //Constraints for the SubStackView
        subStackView?.topAnchor.constraint(equalTo: superStackView!.topAnchor).isActive = true
        subStackView?.leadingAnchor.constraint(equalTo: superStackView!.leadingAnchor).isActive = true
        subStackView?.bottomAnchor.constraint(equalTo: superStackView!.bottomAnchor).isActive = true
        
        settingsTextField.trailingAnchor.constraint(equalTo: superStackView!.trailingAnchor).isActive = true
        
        //Constraints for the SuperStackView
        superStackView?.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 4).isActive = true
        superStackView?.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -4).isActive = true
        superStackView?.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 4).isActive = true
        superStackView?.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -4).isActive = true
    }
    
    override var description: String {
        return "TextFieldSettingsTableViewCell"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
