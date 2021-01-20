//
//  SettingsVC.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit
class SettingsVC: RootVC {

    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupSettingsUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Weather" //stringFor(key: "play_shop")
    }
    
    func setupVC(){
        removeScrollview()
        topViewHeight?.constant = navigationController!.navigationBar.frame.size.height
        resetBase()
        self.view.backgroundColor =  hexToUIColor(hex: "#E6EEF4")
    }
    func setupSettingsUI(){
        let vc = AddWeatherCityVC()
        vc.delegate = self
//      navController.pushViewController(vc, animated: true)
    }
}
extension SettingsVC: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        print("TheweahterVM::\(vm.main.temp)")
    }
}
