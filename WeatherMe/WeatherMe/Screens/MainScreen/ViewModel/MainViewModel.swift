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
}

final class MainViewModel: MainViewModelProtocol {
    var delegate : MainViewModelDelegate?
    
    var degrees = [Double]()
    var dates = [String]()
    var humidities = [String]()
    var days = [String]()
    var descriptions = [String]()
    var mins = [Double]()
    var maxs = [Double]()
    var nights = [Double]()
    var icons = [URL]()
    var city = String()
    
    func fetchWeather(_ city: String, _ lang: String) {
        provider.request(.fetchWeather(lang: lang, city: city)) { [weak self] result in
            switch result {
            case .failure(let error):
                self!.delegate?.errorOccured(error)
            case .success(let response):
                do {
                    let forecast =  try JSONDecoder().decode(WeatherResponse.self, from: response.data)
                    self!.city = forecast.city ?? "-"
                    for degree in forecast.result! {
                        self!.degrees.append(degree.degreeDouble)
                        self!.dates.append(degree.date!)
                        self!.days.append(degree.day!)
                        self!.mins.append(degree.minDouble)
                        self!.maxs.append(degree.maxDouble)
                        self!.nights.append(degree.nightDouble)
                        self!.icons.append(degree.iconURL)
                        self!.humidities.append(degree.humidity!)
                        self!.descriptions.append(degree.description!)
                    }
                    self!.delegate?.fetchSucceed()
                } catch  {
                    self!.delegate?.errorOccured(error)
                }
            }
        }
    }
}
