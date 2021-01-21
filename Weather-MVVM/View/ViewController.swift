//
//  ViewController.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

class ViewController: RootVC {
    
    private var weatherListModel = WeatherListViewModel()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupWeatherUI()
        
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
    
    func setupWeatherUI(){
        
        let topView  = UIView()
        
        contentView.addSubview(topView)
        
        topView.position(top: contentView.topAnchor, left: contentView.leadingAnchor,right: contentView.trailingAnchor, insets: .init(top: 20, left: 20, bottom: 0, right: 20))
        topView.size(height:60)
        topView.layer.cornerRadius = 8
        topView.backgroundColor = .blue
        
        
        let settingsbtn = MyButton(frame: .zero, setTitle: "Settings", bgColor: buttonColor, textColor: .white)
        topView.addSubview(settingsbtn)
        settingsbtn.position(top: topView.topAnchor, left: topView.leadingAnchor, insets: .init(top: 10, left: 20, bottom: 0, right: 20))
        settingsbtn.size(width:80,height: 40)
        settingsbtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        settingsbtn.tag = 1
        settingsbtn.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        
        let addButton = MyButton(frame: .zero, setTitle: "Add", bgColor: buttonColor, textColor: .white)
        topView.addSubview(addButton)
        addButton.position(top: topView.topAnchor, right: topView.trailingAnchor, insets: .init(top: 10, left: 0, bottom: 0, right: 20))
        addButton.size(width:80,height: 40)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        addButton.tag = 2
        addButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        
        contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(WeatherListCell.self, forCellReuseIdentifier: "cell")
        tableView.position(top: topView.bottomAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, insets: .init(top: 20, left: 20, bottom: 10, right: 20))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.reloadData()
        }
        
        updadeUI()
    }
    
   private func updadeUI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
        }
    }
    
    @objc func tapButton(sender:UIButton){
        if sender.tag == 1 {
            let vc = SettingsVC()
            vc.delegate = self
             navController.pushViewController(vc, animated: true)
        }else if sender.tag == 2 {
            let vc = AddWeatherCityVC()
            vc.delegate = self
            navController.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherListCell
       
        let weatherVM = self.weatherListModel.modelAt(indexPath.row)
        cell.configur(weatherVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension ViewController: AddWeatherDelegate,SettingDelete {
    func addSettingDelegate(vm: SettingsModel) {
        print("setting delegate..")
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print("Data:\(vm.main.temp)")
        self.weatherListModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
}
