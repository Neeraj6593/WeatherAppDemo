//
//  CurrentWeather.swift
//  WeatherAppDemo
//
//  Created by neeraj joshi on 14/06/21.
//

import Foundation

struct CurrentWeather {

    let _lat :Double
    let _lon:Double

    init(lat:Double,lon:Double) {
        _lat = lat
        _lon = lon
    }
     func loadWeatherData(completion:@escaping(WeatherModal?)->()){
        let params = ["lat":"\(_lat)",
                      "lon":"\(_lon)",
                      "appid":"fb5c7b073c76e73b4505f3fffc24f18a"]
        let request = CurrentApiRequest(endPoint: API.currentWeather.rawValue, httpMethod: "GET", queryParam: params)
        
        NetworkHandler.shared.getDataFromServer(request: request, type: WeatherModal.self) { modalObject in
            completion(modalObject)
        }
    }
    
}
