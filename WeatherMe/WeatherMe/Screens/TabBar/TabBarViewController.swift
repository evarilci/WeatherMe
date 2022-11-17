//
//  TabBarViewController.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray6
        setupViewControllers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // Create all of the tabs and icons of the tabs
    func setupViewControllers(){
        viewControllers = [
            createNavigationController(for: MainViewController(),
                                       title: NSLocalizedString("Forecast", comment: ""),
                                       tabTitle: "Forecast",
                                       image: UIImage(systemName:"cloud")!)
            
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                tabTitle: String,
                                                image: UIImage) -> UIViewController{
        // add navigation controller to each tab
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navigationController
    }

    
}
