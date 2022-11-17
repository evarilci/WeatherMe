//
//  MainViewController.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit
import Kingfisher

final class MainViewController: UIViewController {

    let mainView = MainView()
    let viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view = mainView
        viewModel.fetchWeather("gebze", "tr")
            fetchSucceed()
    }
    
    
}

extension MainViewController: MainViewModelDelegate {
    func fetchSucceed() {
        mainView.city = viewModel.city

        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.mainView.day = self.viewModel.setDayFor(0)
            self.mainView.iconView.kf.setImage(with: self.viewModel.setImageFor(0))
            self.mainView.degree = self.viewModel.setDegreeFor(0)
            self.mainView.min = self.viewModel.setMinFor(0)
            self.mainView.max = self.viewModel.setMaxFor(0)
            self.mainView.night = self.viewModel.setNightFor(0)
            self.mainView.humidity = self.viewModel.setHumidityFor(0)
            self.mainView.descript = self.viewModel.setDescriptionFor(0)
            self.mainView.date = self.viewModel.setDateFor(0)
            self.mainView.degree1 = self.viewModel.setDegreeFor(1)
            self.mainView.iconView1.kf.setImage(with: self.viewModel.setImageFor(1))
            self.mainView.day1 = self.viewModel.setDayFor(1)
            self.mainView.date1 = self.viewModel.setDateFor(1)
            self.mainView.min1 = self.viewModel.setMinFor(1)
            self.mainView.max1 = self.viewModel.setMaxFor(1)
            self.mainView.night1 = self.viewModel.setNightFor(1)
        })
    }
    
    func errorOccured(_ error: Error) {
        print("vc error")
    }
}
