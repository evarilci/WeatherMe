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
    
    var degree: Double? {
        didSet {
            degreeLabel.text = NSString(format: "\(degree!.formatted())%@" as NSString, "\u{00B0}") as String
        }
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
   
    
    private let cityTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "ANKARA"
            label.numberOfLines = 0
            label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50, weight: .light)
            label.sizeToFit()
            label.textColor = UIColor.systemTeal
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
//        label.text = NSString(format: "23%@", "\u{00B0}") as String
        label.text = "25°"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 60, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemTeal
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "cloud.fill")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
        
        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Cloudy"
            label.numberOfLines = 0
            label.sizeToFit()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
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
                cityTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
              
        contentView.addSubview(degreeLabel)
            degreeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
            degreeLabel.topAnchor.constraint(equalTo: cityTitleLabel.bottomAnchor, constant: 24).isActive = true
            degreeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        contentView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: degreeLabel.topAnchor).isActive = true
        iconView.leadingAnchor.constraint(equalTo: degreeLabel.trailingAnchor, constant: 16).isActive = true
        iconView.heightAnchor.constraint(equalTo: degreeLabel.heightAnchor, multiplier: 1/2).isActive = true
        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
            
    
            
            contentView.addSubview(descriptionLabel)
                descriptionLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10).isActive = true
                //descriptionLabel.bottomAnchor.constraint(equalTo: degreeLabel.bottomAnchor).isActive = true
                descriptionLabel.leadingAnchor.constraint(equalTo: degreeLabel.trailingAnchor, constant: 16).isActive = true
        }


}
