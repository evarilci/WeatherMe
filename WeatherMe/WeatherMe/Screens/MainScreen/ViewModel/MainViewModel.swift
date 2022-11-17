//
//  MainViewModel.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import Foundation
import Moya


protocol MainViewModelDelegate {
    func fetchSucceed()
    func errorOccured(_ error: Error)
}

protocol MainViewModelProtocol {
    var delegate: MainViewModelDelegate? { get set }
    func fetchWeather(_ city: String, _ lang: String)
    var forecasts : [WeatherResponse] { get set }
    var city : String { get set}
    
    func setDayFor(_ day: Int) -> String
    func setDateFor(_ day: Int) -> String
    func setDegreeFor(_ day: Int) -> Double
    func setNightFor(_ day: Int) -> Double
    func setMinFor(_ day: Int) -> Double
    func setMaxFor(_ day: Int) -> Double
    func setHumidityFor(_ day: Int) -> String
    func setDescriptionFor(_ day: Int) -> String
    func setImageFor(_ day: Int) -> URL
    
}

final class MainViewModel: MainViewModelProtocol {
   
    var result = [Result]() {
        didSet {
            
            self.delegate?.fetchSucceed()
        }
    }
    
    var delegate : MainViewModelDelegate?
    
    var city = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var forecasts = [WeatherResponse]() {
        didSet {
            self.result = forecasts[0].result!
            delegate?.fetchSucceed()
        }
    }
    func fetchWeather(_ city: String, _ lang: String) {
        provider.request(.fetchWeather(lang: lang, city: city)) {[weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.errorOccured(error)
            case .success(let response):
                do {
                    let forecast =  try JSONDecoder().decode(WeatherResponse.self, from: response.data)
                      self!.city = forecast.city ?? "-"
                    self!.forecasts.append(forecast)
                    self!.delegate?.fetchSucceed()
                } catch  {
                    self!.delegate?.errorOccured(error)
                }
                self!.delegate?.fetchSucceed()
            }
        }
    }
    func setDayFor(_ day: Int) -> String {
        result[day].day!
    }
    func setDateFor(_ day: Int) -> String {
        result[day].date!
    }
    func setDegreeFor(_ day: Int) -> Double {
        result[day].degreeDouble
    }
    func setNightFor(_ day: Int) -> Double {
        result[day].nightDouble
    }
    func setMinFor(_ day: Int) -> Double {
        result[day].minDouble
    }
    func setMaxFor(_ day: Int) -> Double {
        result[day].maxDouble
    }
    func setHumidityFor(_ day: Int) -> String {
        result[day].humidity!
    }
    func setDescriptionFor(_ day: Int) -> String {
        result[day].description!
    }
    func setImageFor(_ day: Int) -> URL {
        result[day].iconURL
    }
}
