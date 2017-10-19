//
//  SettingsViewController.swift
//  SettingsUITryout
//
//  Created by Chandan Sarkar on 18.10.17.
//  Copyright © 2017 Chandan Sarkar. All rights reserved.
//

import UIKit

open class SettingsViewController: UIViewController {
    
    open var datasource: [SettingsSectionObject] = []
    
    //MARK: SettingsTableView
    open var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: SystemButtonItems
    open var saveSystemButtonItem: UIBarButtonSystemItem = {
        let button = UIBarButtonSystemItem.save
        return button
    }()
    
    open var cancelSystemButtonItem: UIBarButtonSystemItem = {
        let button = UIBarButtonSystemItem.cancel
        return button
    }()

    //MARK: viewDidLoad
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationItemLayout()
        setupsettingsTableViewLayout()
    }
    
    //MARK: LayoutSetup - NavigationItem
    private func setupNavigationItemLayout() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        let saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: saveSystemButtonItem, target: self, action: #selector(saveButtonClicked))
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: cancelSystemButtonItem, target: self, action: #selector(cancelButtonClicked))
        navigationItem.rightBarButtonItem = saveBarButtonItem
        navigationItem.leftBarButtonItem = cancelBarButtonItem
    }
    
    @objc
    private func saveButtonClicked(saveButtonItem: UIBarButtonItem) {
        print("Save button clicked")
    }
    
    @objc
    private func cancelButtonClicked(cancelButtonItem: UIBarButtonItem) {
        print("Cancel button clicked")
    }
    
    
    //MARK: LayoutSetup - TableView
    private func setupsettingsTableViewLayout() {
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
        
        //Constraints - SettingTableView
        let guide = self.view.safeAreaLayoutGuide
        self.settingsTableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 2).isActive = true
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
                let settingsRowObject = datasource[indexPath.section].settingsRowObjects[indexPath.row]
                self.settingsViewController(self, update: settingsRowObject, at: cell, for: indexPath)
                return cell
            }
        }else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldSettingsTableViewCell.description()) as? TextFieldSettingsTableViewCell {
                let settingsRowObject = datasource[indexPath.section].settingsRowObjects[indexPath.row]
                self.settingsViewController(self, update: settingsRowObject, at: cell, for: indexPath)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return datasource[section].sectionHeaderTitle
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: Extension: UITableViewDelegate
extension SettingsViewController: UITableViewDelegate { }


//MARK: Extension: SettingsViewControllerDataSource
extension SettingsViewController: SettingsViewControllerDataSource {
    
    func numberOfSettings(in settingsViewController: SettingsViewController) -> Int {
        return datasource.count
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, numberOfSettingsIn: Int) -> Int {
        return datasource[numberOfSettingsIn].settingsRowObjects.count
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, update setting: SettingsRowObject, at cell: UITableViewCell, for indexPath: IndexPath) {
        if indexPath.row == 0 {
            (cell as! SwitchSettingsTableViewCell).updateCell(with: setting)
        }else if indexPath.row == 1 {
            (cell as! TextFieldSettingsTableViewCell).updateCell(with: setting)
        }
    }
    
}

//MARK: Extension: SettingsViewControllerDelegate
extension SettingsViewController: SettingsViewControllerDelegate {
    func settingsViewController(_ settingsViewController: SettingsViewController, didUpdateSettings: SettingsRowObject, at indexPath: IndexPath) {
        //TODO
    }
}

