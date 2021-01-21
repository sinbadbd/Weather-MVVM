//
//  WeatherListViewModel.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    func modelAt(_ index: Int)-> WeatherViewModel {
        return self.weatherViewModels[index]
    }
}

struct WeatherViewModel: Decodable {
    
    let name: String
    let main: TemperatureViewModel
    
}

struct TemperatureViewModel: Decodable {
    
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    

}

