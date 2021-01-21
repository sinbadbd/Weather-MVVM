//
//  SettingsTableCell.swift
//  Weather-MVVM
//
//  Created by Imran on 21/1/21.
//

import UIKit

class SettingsTableCell: UITableViewCell {
    var cityLbl :MyUILabel?
    var degreeLbl: MyUILabel?
    
    
    func configur(_ vm: WeatherViewModel){
        self.cityLbl?.text = vm.name
        self.degreeLbl?.text = "\(kelVinToCelsius(temp: vm.main.temp_max).formateAsDegree)"
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    func setupUI(){
        
        let mainContainer = UIView()
 
        backgroundColor = .clear
        mainContainer.layer.cornerRadius = 5
        mainContainer.backgroundColor = hexToUIColor(hex:"#F7F5ED")
        contentView.addSubview(mainContainer)
        mainContainer.position(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, insets: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0))
        
        
        
          cityLbl = MyUILabel(frame: .zero, text: "Rangpur", textColor: buttonColor, fontSize: UIFont.systemFont(ofSize: 18), textAlign: .left)
        mainContainer.addSubview(cityLbl!)
        cityLbl!.position(top: mainContainer.topAnchor, left: mainContainer.leadingAnchor, insets: .init(top: 10, left: 20, bottom: 10, right: 0))
        cityLbl?.size(width:120)
        //        cityLbl.backgroundColor = .yellow
        
        
          degreeLbl = MyUILabel(frame: .zero, text: "12", textColor: buttonColor, fontSize: UIFont.systemFont(ofSize: 18), textAlign: .right)
        mainContainer.addSubview(degreeLbl!)
        degreeLbl?.position(top: mainContainer.topAnchor, right: mainContainer.trailingAnchor, insets: .init(top: 10, left: 0, bottom: 10, right: 20))
        degreeLbl?.size(width:120)
        //        degreeLbl.backgroundColor = .yellow
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

