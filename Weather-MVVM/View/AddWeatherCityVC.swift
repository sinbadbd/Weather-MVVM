//
//  DashboardVC.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

class AddWeatherCityVC: RootVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
        setupWeatherUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Add City" //stringFor(key: "play_shop")
    }
    
    func setupVC(){
        topViewHeight?.constant = navigationController!.navigationBar.frame.size.height
        resetBase()
        self.view.backgroundColor =  hexToUIColor(hex: "#E6EEF4")
    }
    
    func setupWeatherUI(){
        let topView  = UIView()
        
        contentView.addSubview(topView)
        
        topView.position(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom:contentView.bottomAnchor,right: contentView.trailingAnchor, insets: .init(top: 20, left: 10, bottom: 0, right: 10))
        topView.size(height:200)
        topView.layer.cornerRadius = 8
        topView.backgroundColor = .white
        
        let inputTxF = MyUITextField(frame: .zero, placeholderText: "Add city")
        topView.addSubview(inputTxF)
        inputTxF.position(top: topView.topAnchor, left: topView.leadingAnchor, right: topView.trailingAnchor, insets: .init(top: 30, left: 20, bottom: 0, right: 20))
        inputTxF.size(height:40)
        
        
        let saveBtn = MyButton(frame: .zero, setTitle: "Add", bgColor: buttonColor, textColor: .white)
        topView.addSubview(saveBtn)
        saveBtn.position(top: inputTxF.bottomAnchor,left: topView.leadingAnchor, right: topView.trailingAnchor, insets: .init(top: 20, left: 20, bottom: 0, right: 20))
//        saveBtn.centerXInSuper()
        saveBtn.size(height: 40)
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        saveBtn.tag = 2
        saveBtn.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }

    @objc func tapButton(){
        
    }
}


