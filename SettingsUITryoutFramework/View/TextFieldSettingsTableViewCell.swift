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
    var superStackView: UIStackView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.willSetupSettingsTextField()
    }
    
    //MARK: Setup - SettingsTextView
    private func willSetupSettingsTextField() {
        self.settingsTextField = UITextField()
        self.settingsTextField.translatesAutoresizingMaskIntoConstraints = false
        self.settingsTextField.adjustsFontSizeToFitWidth = true
        self.settingsTextField.minimumFontSize = 9
        self.settingsTextField.borderStyle = .roundedRect
        self.settingsTextField.textColor = .darkGray
        self.settingsTextField.contentMode = .scaleAspectFit
        self.settingsTextField.placeholder = "Numeric"
        self.settingsTextField.keyboardType = .numberPad
        self.willSetupLayoutForCell()
        self.settingsTextField.addTarget(self, action: #selector(didChangeSettingPriority), for: .editingChanged)
    }
    
    //UITextField Event Detection
    @objc
    private func didChangeSettingPriority(_ sender: UITextField) {
        let text = sender.text!
        let module = self.settingsView.settingsTitleLabel.text!
        print("\(module) has been chnaged to: \(String(describing: text))")
    }
    
    //MARK: Cell - Layout Setup
    override internal func willSetupLayoutForCell() {
        super.willSetupLayoutForCell()
        
        //MARK: Setup - SuperStackView
        superStackView = UIStackView(arrangedSubviews: [subStackView!,settingsTextField!])
        rootView.addSubview(superStackView!)
        superStackView.translatesAutoresizingMaskIntoConstraints = false
        superStackView.axis = .horizontal
        superStackView.alignment = .center
        superStackView.distribution = .equalCentering
        superStackView.spacing = 15
        
        //MARK: Content Priorities - SubStackView / SettingTextField
        subStackView.setContentHuggingPriority(.init(250), for: .horizontal)
        settingsTextField.setContentHuggingPriority(.init(251), for: .horizontal)
        subStackView.setContentCompressionResistancePriority(.init(750), for: .horizontal)
        settingsTextField.setContentCompressionResistancePriority(.init(751), for: .horizontal)
        
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
    func updateCell(with setting: SettingsRow) {
        let settingsTitleLabel = self.settingsView.settingsTitleLabel
        let settingsDescriptionTextView = self.settingsView.settingsDescriptionTextView
        settingsTitleLabel?.text = setting.title
        settingsDescriptionTextView?.text = setting.text
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
