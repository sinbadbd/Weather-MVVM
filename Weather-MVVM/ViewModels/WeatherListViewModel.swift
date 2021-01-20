//
//  WeatherListViewModel.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
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



//struct WeatherListViewModel {
//    private var weatherViewModels = [WeatherViewModel]()
//}
//
//struct WeatherViewModel:Decodable {
//    let name: String
//    let main: TemperatureViewModel
//}
//struct TemperatureViewModel: Decodable {
//    let temperature: Double
//    let temperatureMin: Double
//    let temperatureMax: Double
//}

/*
        "temp": 295.15,
        "feels_like": 296.86,
        "temp_min": 295.15,
        "temp_max": 295.15,
        "pressure": 1011,
        "humidity": 78
 
 */
