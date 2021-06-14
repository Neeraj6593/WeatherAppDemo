//
//  ApiRequests.swift
//  WeatherAppDemo
//
//  Created by neeraj joshi on 14/06/21.
//

import Foundation

struct CurrentApiRequest:RequestEnvelop {
    var endPoint: String
    var httpMethod: String
    var queryParam: [String : Any]
}
