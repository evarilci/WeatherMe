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
            guard let pretty = degree?.clean else {return}
            degreeLabel.text = NSString(format: "\(pretty)%@" as NSString, "\u{00B0}") as String
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
            guard let pretty = min?.clean else {return}
            minLabel.text = NSString(format: "min: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    
    var max : Double? {
        didSet {
            guard let pretty = max?.clean else {return}
            //var pretty = max!.formatted(FloatingPointFormatStyle())
            maxLabel.text =  NSString(format: "max: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    
    var night : Double? {
        didSet {
            guard let pretty = night?.clean else {return}
            nightLabel.text = NSString(format: "night: \(pretty)%@" as NSString, "\u{00B0}") as String
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
        label.font = UIFont.systemFont(ofSize: 75, weight: .ultraLight)
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
    private let Rectangle:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let dateRectangle:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
       
        
        contentView.addSubview(dateRectangle)
        dateRectangle.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        dateRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dateRectangle.heightAnchor.constraint(equalToConstant: 86).isActive = true
        dateRectangle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        
        let dateStack = UIStackView(arrangedSubviews: [dateLabel,
                                                      dayLabel])
        dateStack.axis = .vertical
        dateStack.spacing = 5
        dateStack.distribution = .fillEqually
        dateStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(dateStack)
        dateStack.topAnchor.constraint(equalTo: dateRectangle.topAnchor, constant: 8).isActive = true
        dateStack.leadingAnchor.constraint(equalTo: dateRectangle.leadingAnchor, constant: 4).isActive = true
        dateStack.trailingAnchor.constraint(equalTo: dateRectangle.trailingAnchor, constant: -4).isActive = true
        dateStack.bottomAnchor.constraint(equalTo: dateRectangle.bottomAnchor, constant: -8).isActive = true
       
        
        contentView.addSubview(Rectangle)
        Rectangle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        Rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        Rectangle.topAnchor.constraint(equalTo: dateRectangle.bottomAnchor, constant: 24).isActive = true
        Rectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [minLabel,
                                                  maxLabel,
                                                  nightLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        stack.topAnchor.constraint(equalTo: Rectangle.topAnchor,constant: 8).isActive = true
        stack.leadingAnchor.constraint(equalTo: Rectangle.leadingAnchor, constant: 24).isActive = true
        stack.trailingAnchor.constraint(equalTo: Rectangle.trailingAnchor, constant: -24).isActive = true
        stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        contentView.addSubview(humidityLabel)
        humidityLabel.bottomAnchor.constraint(equalTo: Rectangle.bottomAnchor, constant: -16).isActive = true
        humidityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        humidityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        humidityLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
