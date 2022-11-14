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
        viewModel.fetchWeather("istanbul", "tr")
        navigationItem.largeTitleDisplayMode = .never
        fetchSucceed()
    }
}

extension MainViewController: MainViewModelDelegate {
    func fetchSucceed() {
        mainView.city = viewModel.city
        mainView.degree = viewModel.degree
        guard let icon = URL(string: viewModel.image) else {return}
        mainView.iconView.kf.setImage(with: icon)
        mainView.min = viewModel.min
        mainView.max = viewModel.max
        mainView.night = viewModel.night
        mainView.humidity = viewModel.humidity
        mainView.descript = viewModel.description
        mainView.date = viewModel.date
        mainView.day = viewModel.day
    }
    
    func errorOccured(_ error: Error) {
        print("vc error")
    }
    
    
}
