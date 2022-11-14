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
    var humidity = String() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR HUMIDITY IS: \(humidity)")
        }
    }
    
    var min = Double() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR MIN DEGREE IS: \(min)")
        }
    }
    
    var max = Double() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR MAX DEGREE IS: \(max)")
        }
    }
    
    var night = Double() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR NIGHT DEGREE IS: \(night)")
        }
    }
    
    var degree = Double() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR DEGREE IS: \(degree)")
        }
    }
    
    var image = String() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR IMAGE URL IS: \(image)")
        }
    }
    
    var description = String() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR DESCRIPTION IS: \(description)")
        }
    }
    
    var date = String() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR DATE IS: \(date)")
        }
    }
    
    var day = String() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR DAY IS: \(day)")
        }
    }
    
    var delegate : MainViewModelDelegate?
    var city = String() {
        didSet{
            self.delegate?.fetchSucceed()
            print("OUR CITY IS: \(city)")
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
                    self!.city = forecast.city ?? "şehir gelmedi"
                    self!.degree = forecast.result![0].degreeDouble
                    self!.image = forecast.result![0].icon ?? "icon url gelmedi"
                    self!.description = forecast.result![0].description ?? "description gelmedi"
                    self!.date = forecast.result![0].date ?? "date gelmedi"
                    self!.day = forecast.result![0].day ?? "day gelmedi"
                    self!.night = forecast.result![0].nightDouble
                    self!.min = forecast.result![0].minDouble
                    self!.max = forecast.result![0].maxDouble
                    self!.humidity = forecast.result![0].humidity ?? "nemlenemedik"
                    self!.forecasts.append(forecast)
                    self!.delegate?.fetchSucceed()
                } catch  {
                    self!.delegate?.errorOccured(error)
                    
                }
                
                self!.delegate?.fetchSucceed()
                
            }
        }
    }
    
    var forecasts = [WeatherResponse]() {
        didSet {
            delegate?.fetchSucceed()
            
        }
    }
    
    
    
}
