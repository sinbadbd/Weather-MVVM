//
//  DashboardVC.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityVC: RootVC {
    
    var addCityInputTxF: MyUITextField?
    var saveBtn: MyButton?
    
    var delegate: AddWeatherDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()        
        setupWeatherUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Add City" //stringFor(key: "play_shop")
    }
    
    func setupWeatherUI(){
        let topView  = UIView()
        
        contentView.addSubview(topView)
        
        topView.position(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom:contentView.bottomAnchor,right: contentView.trailingAnchor, insets: .init(top: 20, left: 10, bottom: 0, right: 10))
        topView.size(height:200)
        topView.layer.cornerRadius = 8
        topView.backgroundColor = .white
        
        addCityInputTxF = MyUITextField(frame: .zero, placeholderText: "Add city")
        topView.addSubview(addCityInputTxF!)
        addCityInputTxF?.position(top: topView.topAnchor, left: topView.leadingAnchor, right: topView.trailingAnchor, insets: .init(top: 30, left: 20, bottom: 0, right: 20))
        addCityInputTxF?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        addCityInputTxF?.size(height:40)
        
        
        saveBtn = MyButton(frame: .zero, setTitle: "Add", bgColor: buttonColor, textColor: .white)
        topView.addSubview(saveBtn!)
        saveBtn?.position(top: addCityInputTxF?.bottomAnchor,left: topView.leadingAnchor, right: topView.trailingAnchor, insets: .init(top: 20, left: 20, bottom: 0, right: 20))
        //        saveBtn.centerXInSuper()
        saveBtn?.size(height: 40)
        saveBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        //  saveBtn?.isEnabled = false
        // saveBtn?.isUserInteractionEnabled = false
        saveBtn?.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }
    
    @objc func tapButton(sender:MyButton){
        
        let city = addCityInputTxF?.text  ?? ""
        //
        guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f279df88f01232850ddff621c125603d") else {
            return
        }
        
        
        let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
            
            let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
             return weatherVM
        }
        
        Webservice().load(resource: weatherResource) { [weak self] result in
            
            if let weatherVM = result {
                if let delegate = self?.delegate {
                    delegate.addWeatherDidSave(vm: weatherVM)
                    navController.popViewController(animated: true)
                }else{
                    print("haha delegate not found")
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}

extension AddWeatherCityVC: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField:UITextField){
        if textField == addCityInputTxF{
            //            saveBtn?.isEnabled = true
            //            saveBtn?.backgroundColor = buttonColor
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == addCityInputTxF{
            if textField.text == "" {
                print("empt")
            }
        }
    }
}
