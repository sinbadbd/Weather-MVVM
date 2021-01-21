//
//  SettingsModel.swift
//  Weather-MVVM
//
//  Created by Imran on 21/1/21.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch self {
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsModel {
    let units = Unit.allCases
    
    private var _seletedUnit:Unit = Unit.celcius
    
    var seletedUnit : Unit {
        get {
            let userDefault = UserDefaults.standard
            if let value = userDefault.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _seletedUnit
        } set{
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
