//
//  MainViewController.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit

final class MainViewController: UIViewController {

    let mainView = MainView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.degree = 127
        //view.backgroundColor = .red
    }
}
