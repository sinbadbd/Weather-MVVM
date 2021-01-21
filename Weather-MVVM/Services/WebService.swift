//
//  WeatherServices.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import Foundation
struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            print("data:\(String(describing: data))")
            
            // Did we get an error?
            guard error == nil else {
                print(error!)
                return
            }
            
            guard data != nil else {
                print("No data")
                return
            }
            
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                  //  print( completion(resource.parse(data)))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
