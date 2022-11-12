//
//  NetworkLayer.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import Foundation
import Moya


let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
let provider = MoyaProvider<WeatherMeService>(plugins: [plugin])

enum WeatherMeService {
    case fetchWeather(lang: String, city:String)
}

extension WeatherMeService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.collectapi.com") else {fatalError("URL NOT FOUND")}
        return url
    }
    
    var path: String {
        switch self {
        case .fetchWeather:
            return "/weather/getWeather"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchWeather(let lang, let city):
            
            let parameters : [String:Any] = ["data.lang":lang, "data.city":city]
            return  .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [
            "content-type":"application/json",
            "authorization":"apikey 3bABqlBsHvBoVtHxuIpB87:4JVIyE9IO8TJ1om9edrhXp"
        ]
    }
    
    
}
