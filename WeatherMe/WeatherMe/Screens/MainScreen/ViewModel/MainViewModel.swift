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
    var degree : Double { get set}
    var image : String { get set}
    var description : String { get set}
    var date : String { get set}
    var day : String { get set}
    var min : Double { get set}
    var max : Double { get set}
    var night : Double { get set}
    var humidity : String { get set}
    
}


final class MainViewModel: MainViewModelProtocol {
    
    var delegate : MainViewModelDelegate?
    
    var humidity = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var min = Double() {
        didSet{
            self.delegate?.fetchSucceed()
      }
    }
    var max = Double() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var night = Double() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var degree = Double() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var image = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var description = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var date = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var day = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var city = String() {
        didSet{
            self.delegate?.fetchSucceed()
        }
    }
    var forecasts = [WeatherResponse]() {
        didSet {
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
                    self!.degree = forecast.result![0].degreeDouble
                    self!.image = forecast.result![0].icon ?? "-"
                    self!.description = forecast.result![0].description ?? "-"
                    self!.date = forecast.result![0].date ?? "-"
                    self!.day = forecast.result![0].day ?? "-"
                    self!.night = forecast.result![0].nightDouble
                    self!.min = forecast.result![0].minDouble
                    self!.max = forecast.result![0].maxDouble
                    self!.humidity = forecast.result![0].humidity ?? "-"
                    self!.forecasts.append(forecast)
                    self!.delegate?.fetchSucceed()
                } catch  {
                    self!.delegate?.errorOccured(error)
                }
                self!.delegate?.fetchSucceed()
            }
        }
    }
}
