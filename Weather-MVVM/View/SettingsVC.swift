//
//  SettingsVC.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

protocol SettingDelete {
    func addSettingDelegate(vm: SettingsModel)
}

class SettingsVC: UIViewController {
    
    private var settingsViewModel = SettingsModel()
    
    let tableView = UITableView()
    
    var delegate :SettingDelete?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexToUIColor(hex: "#E6EEF4")
        
        setupVC()
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    @objc func addTapped(){
        //        dismiss(animated: true, completion: nil)
        
        if let delegate = self.delegate {
            delegate.addSettingDelegate(vm: self.settingsViewModel)
        }
        navController.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Settings" //stringFor(key: "play_shop")
    }
    
    func setupVC(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableView.automaticDimension
        //        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(SettingsTableCell.self, forCellReuseIdentifier: "cell")
        tableView.position(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, insets: .init(top: 10, left: 20, bottom: 20, right: 20))
    }
    
}

extension SettingsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsViewModel.units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsTableCell
        
        let settingsItem = self.settingsViewModel.units[indexPath.row]
        cell.cityLbl?.text = settingsItem.displayName
        
        if  settingsItem == self.settingsViewModel.seletedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            cell.backgroundColor  = hexToUIColor(hex:"#F7F5ED")
            let unit = Unit.allCases[indexPath.row]
            self.settingsViewModel.seletedUnit = unit
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
            cell.backgroundColor  = .none
        }
    }
    
}
