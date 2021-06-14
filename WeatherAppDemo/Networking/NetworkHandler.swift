//
//  NetworkHandler.swift
//  WeatherAppDemo
//
//  Created by neeraj joshi on 14/06/21.
//

import Foundation


enum API:String {
    case baseURL = "https://api.openweathermap.org/data/2.5"
    case currentWeather = "/onecall"
}

protocol RequestEnvelop {
    var endPoint :String { get  }
    var httpMethod :String { get  }
    var queryParam:[String:Any] { get }
    func getUrl()->URL?
}

extension RequestEnvelop{
    func getUrl()->URL?{
        var urlString = API.baseURL.rawValue + endPoint
        if queryParam.count > 0{
            urlString += "?"
        }
        for (key,value) in queryParam{
            urlString += "\(key)=\(value)&"
        }
        return URL(string: urlString)
    }
}


struct NetworkHandler {
   
      static let shared = NetworkHandler()

       private init() {
          
       }

    func getDataFromServer<T:Codable>(request:RequestEnvelop, type:T.Type, completion: @escaping(T?)->()){
        guard let url = request.getUrl() else {
            debugPrint("URL Incorrect")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        URLSession.shared.dataTask(with: urlRequest) { data, response, Error in
            let decoder = JSONDecoder()
            let object = try? decoder.decode(T.self, from: data!)
            completion(object)
        }.resume()
    }
    
}
