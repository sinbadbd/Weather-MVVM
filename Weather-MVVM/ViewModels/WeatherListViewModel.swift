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
    
    //Kelvin to celsius
    mutating private func toCelsius() {
        weatherViewModels = weatherViewModels.map{ vm in
            var weatherModel = vm
            weatherModel.main.temp = (weatherModel.main.temp - 273.15)
            return weatherModel
        }
    }
    //celsius to Kelvin
    mutating private func toFahrenheit(){
        weatherViewModels = weatherViewModels.map{ vm in
            var weatherModel = vm
            weatherModel.main.temp = (weatherModel.main.temp - 273.15) * 9/5 + 32 // Formula: Kelvin
            //(295K − 273.15) × 9/5 + 32
            return weatherModel
        }
    }
    
    mutating func updateUnit (to unit: Unit){
        switch unit {
        case .celcius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

struct WeatherViewModel: Decodable {
    
    var name: String
    var main: TemperatureViewModel
    
}

struct TemperatureViewModel: Decodable {
    
    var temp: Double
    var temp_min: Double
    var temp_max: Double
    

}

