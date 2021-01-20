//
//  DashboardVC.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit

class DashboardVC: RootVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
        setupWeatherUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Dahboard" //stringFor(key: "play_shop")
    }
    
    func setupVC(){
        topViewHeight?.constant = navigationController!.navigationBar.frame.size.height
        resetBase()
        self.view.backgroundColor =  hexToUIColor(hex: "#E6EEF4")
    }
    
    func setupWeatherUI(){
        let view  = UIView()
        
        contentView.addSubview(view)
        
        view.position(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, insets: .init(top: 0, left: 10, bottom: 0, right: 10))
        view.size(height:200)
        view.layer.cornerRadius = 8
        view.backgroundColor = .red
        
    }

}


