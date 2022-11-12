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
    
}


final class MainViewModel: MainViewModelProtocol {
    var delegate : MainViewModelDelegate?
    
    func fetchWeather(_ city: String, _ lang: String) {
        provider.request(.fetchWeather(lang: lang, city: city)) {[weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.errorOccured(error)
            case .success(let response):
                do {
                    let forecast =  try JSONDecoder().decode([WeatherResponse].self, from: response.data)
                    self?.forecasts = forecast
                    self?.delegate?.fetchSucceed()
                } catch  {
                    print ("ERROR IS HERE!!! \(error)")
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
