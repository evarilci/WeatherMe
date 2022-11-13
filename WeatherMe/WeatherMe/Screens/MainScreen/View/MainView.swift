//
//  MainView.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit

final class MainView: UIView {
    
    var cityTitle : String? {
        didSet {
            cityTitleLabel.text = cityTitle
        }
    }
    
    var degree: String? {
        didSet {
            degreeLabel.text = degree
        }
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
   
    
    private let cityTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "ANKARA"
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            label.sizeToFit()
            label.textColor = UIColor.systemTeal
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "27"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.sizeToFit()
        label.textColor = UIColor.systemTeal
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Cloudy"
            label.numberOfLines = 0
            label.sizeToFit()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15, weight: .light)
           // label.textColor = UIColor.systemRed
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
    init() {
        super.init(frame: .zero)
        
        setupScrollView()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView(){
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(scrollView)
            scrollView.addSubview(contentView)
            
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
    
    func setupViews(){
        
            
            
        
            contentView.addSubview(cityTitleLabel)
                cityTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                cityTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                cityTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
                cityTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(degreeLabel)
            degreeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            degreeLabel.topAnchor.constraint(equalTo: cityTitleLabel.bottomAnchor, constant: 16).isActive = true
            degreeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            degreeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
            
            contentView.addSubview(descriptionLabel)
                descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                descriptionLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 16).isActive = true
                descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
                descriptionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
               // descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }


}
