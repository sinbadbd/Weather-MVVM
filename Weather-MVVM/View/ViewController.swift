//
//  ViewController.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

class ViewController: RootVC {

    
    
    
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
        topViewHeight?.constant = navigationController!.navigationBar.frame.size.height
        resetBase()
        self.view.backgroundColor =  hexToUIColor(hex: "#E6EEF4")
    }
    
    func setupWeatherUI(){
        let view  = UIView()
        
        contentView.addSubview(view)
        
        view.position(top: contentView.topAnchor, left: contentView.leadingAnchor,bottom: contentView.bottomAnchor,right: contentView.trailingAnchor, insets: .init(top: 20, left: 10, bottom: 0, right: 10))
        view.size(height:200)
        view.layer.cornerRadius = 8
        view.backgroundColor = .blue
        
        
        let nextButton = MyButton(frame: .zero, setTitle: "Next", bgColor: buttonColor, textColor: .white)
        view.addSubview(nextButton)
        nextButton.position(top: view.topAnchor, left: view.leadingAnchor, insets: .init(top: 50, left: 40, bottom: 0, right: 20))
        nextButton.size(width:200,height: 60)
        nextButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }

    @objc func tapButton(){
        let vc = DashboardVC()
        navController.pushViewController(vc, animated: true)
    }
}

