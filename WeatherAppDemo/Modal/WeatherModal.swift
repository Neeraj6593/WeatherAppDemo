//
//  WeatherModal.swift
//  WeatherAppDemo
//
//  Created by neeraj joshi on 14/06/21.
//

import Foundation

struct WeatherModal:Codable{
    let lat:Double
    let lon:Double
    let timezone:String
    let current:current
}

struct  current:Codable {
    let temp:Double
    let humidity:Double
    let weather:[weather]
}

struct weather:Codable {
    let main:String
}
