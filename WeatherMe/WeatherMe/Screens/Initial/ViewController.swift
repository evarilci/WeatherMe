//
//  ViewController.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 12.11.2022.
//

import UIKit


final class ViewController: UIViewController {

    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.backgroundColor = .red
        
        viewModel.fetchWeather("london", "en")
    }


}


extension ViewController: MainViewModelDelegate {
    func fetchSucceed() {
        print("FETCH SUCCEED")
    }
    
    func errorOccured(_ error: Error) {
        print("ERROR OCCURED")
    }
    
    
}

