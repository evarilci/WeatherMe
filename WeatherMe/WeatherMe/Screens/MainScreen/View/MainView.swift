//
//  MainView.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit

final class MainView: UIView {
    
    var city : String? {
        didSet {
            cityTitleLabel.text = city
        }
    }
    
    var descript : String? {
        didSet {
            descriptionLabel.text = descript
        }
    }
    
    var degree: Double? {
        didSet {
            degreeLabel.text = NSString(format: "\(degree!.formatted())%@" as NSString, "\u{00B0}") as String
        }
    }
    
    var date : String? {
        didSet {
            dateLabel.text = date
        }
    }
    
    var day : String? {
        didSet {
            dayLabel.text = day
        }
    }
    
    var min : Double? {
        didSet {
            minLabel.text = NSString(format: "min: \(min!.formatted())%@" as NSString, "\u{00B0}") as String
        }
    }
    
    var max : Double? {
        didSet {
            maxLabel.text =  NSString(format: "max: \(max!.formatted())%@" as NSString, "\u{00B0}") as String
        }
    }
    
    var night : Double? {
        didSet {
            nightLabel.text = NSString(format: "night: \(night!.formatted())%@" as NSString, "\u{00B0}") as String
        }
    }
    
    var humidity : String? {
        didSet {
            humidityLabel.text = "humidity: \(humidity ?? "-")"
        }
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
    
    
    private let cityTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        label.sizeToFit()
        label.textColor = UIColor.systemTeal
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 60, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let maxLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let nightLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
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
        degreeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        
        contentView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: degreeLabel.topAnchor).isActive = true
        iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        iconView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor).isActive = true
        
        
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        
        contentView.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel)
        dayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4).isActive = true
        dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dayLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [minLabel,
                                                  maxLabel,
                                                  nightLabel])

        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        stack.topAnchor.constraint(equalTo: dayLabel.bottomAnchor,constant: 24).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        contentView.addSubview(humidityLabel)
        humidityLabel.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 24).isActive = true
        humidityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        humidityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        humidityLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        
    }
}
