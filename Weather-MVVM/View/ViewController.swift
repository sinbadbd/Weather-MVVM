//
//  ViewController.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

class ViewController: RootVC , AddWeatherDelegate{

    

    let tableView = UITableView()
    
//    private var weatherListViewModel = WeatherListViewModel()
    let vc =  AddWeatherCityVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        vc.delegate = self
        setupWeatherUI()
//        vc.dic?.name
        print( "data:\(vc.dic?.name ?? "")")
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        vc.delegate = self
        print("test data")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Weather" //stringFor(key: "play_shop")
    }
    
    func setupVC(){
        removeScrollview()
        topViewHeight?.constant = navigationController!.navigationBar.frame.size.height
//        navController.navigationBar.prefersLargeTitles = true
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
        tableView.register(WeatherListCell.self, forCellReuseIdentifier: "cell")
        tableView.position(top: topView.bottomAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, insets: .init(top: 20, left: 20, bottom: 10, right: 20))
   
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.reloadData()
        }
//         tableView.size( height: 500)
        
        updadeUI()
    }
    func updadeUI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print("==...==")
        }
          
    }

    @objc func tapButton(sender:UIButton){
        if sender.tag == 1 {
           print("hi")
        }else if sender.tag == 2 {
            let vc = AddWeatherCityVC()
            present(vc, animated: true, completion: nil)
//            navController.pushViewController(vc, animated: true)
        }
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//extension ViewController: AddWeatherDelegate {
//    func addWeatherDidSave(vm: WeatherViewModel) {
//        let vc = AddWeatherCityVC()
//        vc.delegate = self
//        print("get data")
//    }
//}
