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
        viewModel.fetchWeather("Gebze", "tr")
        mainView.refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchSucceed()
        self.view.layoutIfNeeded()
        
    }
    
    @objc func refresh(sender:AnyObject) {
            // Code to refresh table view
            viewModel.fetchWeather("Gebze", "tr")
            fetchSucceed()
            mainView.refreshControl.endRefreshing()
        }
}

extension MainViewController: MainViewModelDelegate {
    func fetchSucceed() {
        self.mainView.city = self.viewModel.city
        self.mainView.degrees = self.viewModel.degrees
        self.mainView.days = self.viewModel.days
        self.mainView.descripts = self.viewModel.descriptions
        self.mainView.dates = self.viewModel.dates
        self.mainView.mins = self.viewModel.mins
        self.mainView.maxs = self.viewModel.maxs
        self.mainView.nights = self.viewModel.nights
        self.mainView.humidities = self.viewModel.humidities
        self.mainView.icons = self.viewModel.icons
    }
    
    func errorOccured(_ error: Error) {
        print("vc error")
    }
}
