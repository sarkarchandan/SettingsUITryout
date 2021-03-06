//
//  SettingsViewController.swift
//  SettingsUITryout
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

open class SettingsViewController: UIViewController {
    
    open var datasource: [SettingsSection] = []
    
    //MARK: Helper Array - ToolBar Button Implementation
    //Unlikely in real implementation
    private var tempDataSource: [SettingsSection] = []
    
    //MARK: SettingsTableView
    open var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: SystemButtonItems - NavigationBar
    open var saveSystemButtonItem: UIBarButtonSystemItem = {
        let buttonSystemItem = UIBarButtonSystemItem.save
        return buttonSystemItem
    }()
    
    open var cancelSystemButtonItem: UIBarButtonSystemItem = {
        let buttonSystemItem = UIBarButtonSystemItem.cancel
        return buttonSystemItem
    }()
    
    
    //MARK: viewDidLoad
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        willSetupNavigationControllerLayout()
        willSetupsettingsTableViewLayout()
    }
    
    //MARK: LayoutSetup - NavigationController
    private func willSetupNavigationControllerLayout() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: Target-Action Definition - UINavigationBar - UIBarButtonItem
        let saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: saveSystemButtonItem, target: self, action: #selector(didTapSave))
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: cancelSystemButtonItem, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = saveBarButtonItem
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        
        //MARK: ToolBar - Implementation
        navigationController?.isToolbarHidden = false
        let toolBar = navigationController?.toolbar
        toolBar?.barStyle = .default
        
        
        //MARK: Target-Action Definition - UIToolBar - UIBarButtonItem
        let adaptiveBarButtonItem = UIBarButtonItem(title: "Adaptive", style: .plain, target: self, action: #selector(didSelectAdaptive))
        
        let flexiblePaddingBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let defaultsBarButtonItem = UIBarButtonItem(title: "Defaults", style: .plain, target: self, action: #selector(didSelectDefaults))
        
        self.setToolbarItems(
            [adaptiveBarButtonItem,
             flexiblePaddingBarButtonItem,
             defaultsBarButtonItem],animated: false)
    }
    
    
    //MARK: Target-Action Implementation - UINavigationBar UIBarButtonItem
    //Save Button
    @objc
    private func didTapSave(saveButtonItem: UIBarButtonItem) {
        print("Save button tapped.")
    }
    //Cancel Button
    @objc
    private func didTapCancel(cancelButtonItem: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Target-Action Implementation - UIToolBar UIBarButtonItem
    //Adaptive Button
    @objc
    private func didSelectAdaptive(_ sender: UIBarButtonItem) {

        // MARK: Adaptive - Dummy Implementation
        let adaptiveDataSource = self.datasource.filter {$0.title != "Scan"}
        self.tempDataSource = datasource
        self.datasource = adaptiveDataSource
        self.settingsTableView.reloadData()
    }
    //Defaults Button
    @objc
    private func didSelectDefaults(_ sender: UIBarButtonItem) {

        //MARK: Defaults - Dummy Implementation
        self.datasource = tempDataSource
        self.settingsTableView.reloadData()
    }
    
    
    //MARK: LayoutSetup - UITableView
    private func willSetupsettingsTableViewLayout() {
        self.settingsTableView.dataSource = self
        self.settingsTableView.delegate = self
        self.settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Registering TextFieldTableViewCell with the UITableView
        self.settingsTableView.register(TextFieldSettingsTableViewCell.classForCoder(), forCellReuseIdentifier: TextFieldSettingsTableViewCell.description())
        //regsitering SwitchTableViewCell with the UITableView
        self.settingsTableView.register(SwitchSettingsTableViewCell.classForCoder(), forCellReuseIdentifier: SwitchSettingsTableViewCell.description())
        
        self.settingsTableView.allowsSelection = false
        self.settingsTableView.separatorStyle = .none
        self.view.addSubview(settingsTableView)
        
        //MARK: Constraints - SettingTableView
        let guide = self.view.safeAreaLayoutGuide
        self.settingsTableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 1).isActive = true
        self.settingsTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 4).isActive = true
        self.settingsTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 4).isActive = true
        self.settingsTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 4).isActive = true
    }
}

//MARK: Extension - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSettings(in: self)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsViewController(self, numberOfSettingsIn: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsTableViewCell.description()) as? SwitchSettingsTableViewCell {
                let settingsRowObject = datasource[indexPath.section].rows[indexPath.row]
                self.settingsViewController(self, update: settingsRowObject, at: cell, for: indexPath)
                return cell
            }
        }else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldSettingsTableViewCell.description()) as? TextFieldSettingsTableViewCell {
                let settingsRowObject = datasource[indexPath.section].rows[indexPath.row]
                self.settingsViewController(self, update: settingsRowObject, at: cell, for: indexPath)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return datasource[section].title
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: TODO - Extension: UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {}


//MARK: Extension: SettingsViewControllerDataSource
extension SettingsViewController: SettingsViewControllerDataSource {
    
    func numberOfSettings(in settingsViewController: SettingsViewController) -> Int {
        return datasource.count
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, numberOfSettingsIn: Int) -> Int {
        return datasource[numberOfSettingsIn].rows.count
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, update setting: SettingsRow, at cell: UITableViewCell, for indexPath: IndexPath) {
        if indexPath.row == 0 {
            (cell as! SwitchSettingsTableViewCell).updateCell(with: setting)
        }else if indexPath.row == 1 {
            (cell as! TextFieldSettingsTableViewCell).updateCell(with: setting)
        }
    }
    
}

//MARK: Extension: SettingsViewControllerDelegate
extension SettingsViewController: SettingsViewControllerDelegate {
    func settingsView(_ settingsView: SettingsView, didUpdateSettingStateAt indexPath: IndexPath) {
        //MARK: TODO - SettingsViewControllerDelegate Implementation
    }
}

