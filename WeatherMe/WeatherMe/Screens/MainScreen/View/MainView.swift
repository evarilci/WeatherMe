//
//  MainView.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit

final class MainView: UIView {
    
    
    // MARK:  PROPERTIES
    var city : String? {
        didSet {
            cityTitleLabel.text = city
        }
    }
    var humidity : String? {
        didSet {
            humidityLabel.text = "humidity: \(humidity ?? "-")"
        }
    }
    var descript : String? {
        didSet {
            descriptionLabel.text = descript
        }
    }
    
    // - degree properties
    var degree: Double? {
        didSet {
            guard let pretty = degree?.clean else {return}
            degreeLabel.text = NSString(format: "\(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    var degree1: Double? {
        didSet {
            guard let pretty = degree1?.clean else {return}
            degreeLabel1.text = NSString(format: "\(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    
    // - date properties
    var date : String? {
        didSet {
            dateLabel.text = date
        }
    }
    var date1 : String? {
        didSet {
            dateLabel1.text = date1
        }
    }
    
    // - day properties
    var day : String? {
        didSet {
            dayLabel.text = day
        }
    }
    var day1 : String? {
        didSet {
            dayLabel1.text = day1
        }
    }
    
    // - min properties
    var min : Double? {
        didSet {
            guard let pretty = min?.clean else {return}
            minLabel.text = NSString(format: "min: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    var min1 : Double? {
        didSet {
            guard let pretty = min1?.clean else {return}
            minLabel1.text = NSString(format: "min: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    
    // - max properties
    var max : Double? {
        didSet {
            guard let pretty = max?.clean else {return}
            maxLabel.text =  NSString(format: "max: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    var max1 : Double? {
        didSet {
            guard let pretty = max1?.clean else {return}
            maxLabel1.text =  NSString(format: "max: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    
    // - night properties
    var night : Double? {
        didSet {
            guard let pretty = night?.clean else {return}
            nightLabel.text = NSString(format: "night: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    var night1 : Double? {
        didSet {
            guard let pretty = night1?.clean else {return}
            nightLabel1.text = NSString(format: "night: \(pretty)%@" as NSString, "\u{00B0}") as String
        }
    }
    
    // - humidity properties
    
    // MARK: CONTENTVIEW
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
    // MARK: - UI COMPONENTS
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
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // DEGREE LABELS
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 90, weight: .light)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let degreeLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let degreeLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let degreeLabel3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let degreeLabel4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let degreeLabel5: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let degreeLabel6: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        label.sizeToFit()
        label.textColor = UIColor.systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // ICON VIEWS
    let iconView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    let iconView1: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    let iconView2: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    let iconView3: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    let iconView4: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    let iconView5: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    let iconView6: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    // DATE LABELS
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // DAY LABELS
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dayLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MIN LABELS
    private let minLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let minLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MAX LABELS
    private let maxLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let maxLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // NIGHT LABELS
    private let nightLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nightLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // RECTANGLES
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
    private let day1Rec:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let day2Rec:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let day3Rec:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let day4Rec:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let day5Rec:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let day6Rec:  UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - INIT
    init() {
        super.init(frame: .zero)
        
        setupScrollView()
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - CONTENTVIEW SETUP
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    // MARK: - UI COMPONENTS SETUP
    func setupViews(){
        
        // - CITY LABEL
        contentView.addSubview(cityTitleLabel)
        cityTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cityTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cityTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        // DEGREE LABEL
        contentView.addSubview(degreeLabel)
        degreeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        degreeLabel.topAnchor.constraint(equalTo: cityTitleLabel.bottomAnchor, constant: 24).isActive = true
        degreeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        
        // ICON VIEW
        contentView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: degreeLabel.topAnchor).isActive = true
        iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        iconView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor).isActive = true
        
        // DESCRIPTON LABEL
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
       
        
        // DATE RECTANGLE
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
       
        
        // DEGREE RECTANGLE
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
        
        //  DAY1 RECTANGLE
        contentView.addSubview(day1Rec)
        day1Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day1Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day1Rec.topAnchor.constraint(equalTo: Rectangle.bottomAnchor, constant: 24).isActive = true
        day1Rec.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        contentView.addSubview(degreeLabel1)
        degreeLabel1.leadingAnchor.constraint(equalTo: day1Rec.leadingAnchor, constant: 4).isActive = true
        degreeLabel1.topAnchor.constraint(equalTo: day1Rec.topAnchor, constant: 4).isActive = true
        degreeLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1 / 2, constant: -24).isActive = true
        
        contentView.addSubview(iconView1)
        iconView1.trailingAnchor.constraint(equalTo: day1Rec.trailingAnchor, constant: -4).isActive = true
        iconView1.bottomAnchor.constraint(equalTo: day1Rec.bottomAnchor, constant: -4).isActive = true
        iconView1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        iconView1.heightAnchor.constraint(equalTo: iconView1.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel1)
        dayLabel1.leadingAnchor.constraint(equalTo: degreeLabel1.trailingAnchor, constant: 4).isActive = true
        dayLabel1.topAnchor.constraint(equalTo: day1Rec.topAnchor, constant: 8).isActive = true
        dayLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/2).isActive = true
        dayLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel1)
        dateLabel1.leadingAnchor.constraint(equalTo: degreeLabel1.trailingAnchor, constant: 4).isActive = true
        dateLabel1.topAnchor.constraint(equalTo: dayLabel1.bottomAnchor, constant: 6).isActive = true
        dateLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/2).isActive = true
        dateLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel1)
        minLabel1.leadingAnchor.constraint(equalTo: day1Rec.leadingAnchor, constant: 4).isActive = true
        minLabel1.topAnchor.constraint(equalTo: degreeLabel1.bottomAnchor, constant: 10).isActive = true
        minLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/3).isActive = true
        minLabel1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(maxLabel1)
        maxLabel1.leadingAnchor.constraint(equalTo: minLabel1.trailingAnchor, constant: 4).isActive = true
        maxLabel1.topAnchor.constraint(equalTo: degreeLabel1.bottomAnchor, constant: 10).isActive = true
        maxLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/3).isActive = true
        maxLabel1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel1)
        nightLabel1.leadingAnchor.constraint(equalTo: day1Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel1.topAnchor.constraint(equalTo: minLabel1.bottomAnchor, constant: 10).isActive = true
        nightLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/3, constant: 5).isActive = true
        nightLabel1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        
        // DAY2 RECTANGLE
        contentView.addSubview(day2Rec)
        day2Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day2Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day2Rec.topAnchor.constraint(equalTo: Rectangle.bottomAnchor, constant: 24).isActive = true
        day2Rec.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        // DAY3 RECTANGLE
        contentView.addSubview(day3Rec)
        day3Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day3Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day3Rec.topAnchor.constraint(equalTo: day1Rec.bottomAnchor, constant: 24).isActive = true
        day3Rec.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        // DAY4 RECTANGLE
        contentView.addSubview(day4Rec)
        day4Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day4Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day4Rec.topAnchor.constraint(equalTo: day2Rec.bottomAnchor, constant: 24).isActive = true
        day4Rec.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        // DAY5 RECTANGLE
        contentView.addSubview(day5Rec)
        day5Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day5Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day5Rec.topAnchor.constraint(equalTo: day3Rec.bottomAnchor, constant: 24).isActive = true
        day5Rec.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        day5Rec.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // DAY6 RECTANGLE
        contentView.addSubview(day6Rec)
        day6Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day6Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day6Rec.topAnchor.constraint(equalTo: day4Rec.bottomAnchor, constant: 24).isActive = true
        day6Rec.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        day6Rec.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
}
