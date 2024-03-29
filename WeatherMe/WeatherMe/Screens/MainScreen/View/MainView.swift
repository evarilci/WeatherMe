//
//  MainView.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import UIKit
import Kingfisher

final class MainView: UIView {
    
    
    // MARK:  PROPERTIES
    //one time use properties
    var city : String? {
        didSet {
            cityTitleLabel.text = city
        }
    }
    var humidities : [String]? {
        didSet {
            if !humidities!.isEmpty {
                humidityLabel.text = "humidity: \(humidities![0])"
            }
        }
    }
    var descripts : [String]? {
        didSet {
            if !descripts!.isEmpty {
                descriptionLabel.text = descripts![0]
            }
            
        }
    }
    
    // - icon property
    var icons : [URL]? {
        didSet {
            if !icons!.isEmpty {
                iconView.kf.setImage(with: icons![0])
                iconView1.kf.setImage(with: icons![1])
                iconView2.kf.setImage(with: icons![2])
                iconView3.kf.setImage(with: icons![3])
                iconView4.kf.setImage(with: icons![4])
                iconView5.kf.setImage(with: icons![5])
                iconView6.kf.setImage(with: icons![6])
            }
        }
    }
    
    // - degree property
    var degrees: [Double]? {
        didSet {
            if !degrees!.isEmpty {
                degreeLabel.text = NSString(format: "\(degrees![0].clean)%@" as NSString, "\u{00B0}") as String
                degreeLabel1.text = NSString(format: "\(degrees![1].clean)%@" as NSString, "\u{00B0}") as String
                degreeLabel2.text = NSString(format: "\(degrees![2].clean)%@" as NSString, "\u{00B0}") as String
                degreeLabel3.text = NSString(format: "\(degrees![3].clean)%@" as NSString, "\u{00B0}") as String
                degreeLabel4.text = NSString(format: "\(degrees![4].clean)%@" as NSString, "\u{00B0}") as String
                degreeLabel5.text = NSString(format: "\(degrees![5].clean)%@" as NSString, "\u{00B0}") as String
                degreeLabel6.text = NSString(format: "\(degrees![6].clean)%@" as NSString, "\u{00B0}") as String
            }
        }
    }
    
    // - date property
    var dates : [String]? {
        didSet {
            if !dates!.isEmpty {
                dateLabel.text = dates![0]
                dateLabel1.text = dates![1]
                dateLabel2.text = dates![2]
                dateLabel3.text = dates![3]
                dateLabel4.text = dates![4]
                dateLabel5.text = dates![5]
                dateLabel6.text = dates![6]
            }
        }
    }
    
    // - day property
    var days : [String]? {
        didSet {
            if !days!.isEmpty {
                dayLabel.text = days![0]
                dayLabel1.text = days![1]
                dayLabel2.text = days![2]
                dayLabel3.text = days![3]
                dayLabel4.text = days![4]
                dayLabel5.text = days![5]
                dayLabel6.text = days![6]
            }
        }
    }
    
    // - min property
    var mins : [Double]? {
        didSet {
            if !mins!.isEmpty {
                minLabel.text = NSString(format: "min: \(mins![0].clean)%@" as NSString, "\u{00B0}") as String
                minLabel1.text = NSString(format: "min: \(mins![1].clean)%@" as NSString, "\u{00B0}") as String
                minLabel2.text = NSString(format: "min: \(mins![2].clean)%@" as NSString, "\u{00B0}") as String
                minLabel3.text = NSString(format: "min: \(mins![3].clean)%@" as NSString, "\u{00B0}") as String
                minLabel4.text = NSString(format: "min: \(mins![4].clean)%@" as NSString, "\u{00B0}") as String
                minLabel5.text = NSString(format: "min: \(mins![5].clean)%@" as NSString, "\u{00B0}") as String
                minLabel6.text = NSString(format: "min: \(mins![6].clean)%@" as NSString, "\u{00B0}") as String
            }
        }
    }
    
    // - max property
    var maxs : [Double]? {
        didSet {
            if !maxs!.isEmpty {
                maxLabel.text  =  NSString(format: "max: \(maxs![0].clean)%@" as NSString, "\u{00B0}") as String
                maxLabel1.text =  NSString(format: "max: \(maxs![1].clean)%@" as NSString, "\u{00B0}") as String
                maxLabel2.text =  NSString(format: "max: \(maxs![2].clean)%@" as NSString, "\u{00B0}") as String
                maxLabel3.text =  NSString(format: "max: \(maxs![3].clean)%@" as NSString, "\u{00B0}") as String
                maxLabel4.text =  NSString(format: "max: \(maxs![4].clean)%@" as NSString, "\u{00B0}") as String
                maxLabel5.text =  NSString(format: "max: \(maxs![5].clean)%@" as NSString, "\u{00B0}") as String
                maxLabel6.text =  NSString(format: "max: \(maxs![6].clean)%@" as NSString, "\u{00B0}") as String
            }
        }
    }
    
    // - night property
    var nights : [Double]? {
        didSet {
            if !nights!.isEmpty {
                nightLabel.text  = NSString(format: "night: \(nights![0].clean)%@" as NSString, "\u{00B0}") as String
                nightLabel1.text = NSString(format: "night: \(nights![1].clean)%@" as NSString, "\u{00B0}") as String
                nightLabel2.text = NSString(format: "night: \(nights![2].clean)%@" as NSString, "\u{00B0}") as String
                nightLabel3.text = NSString(format: "night: \(nights![3].clean)%@" as NSString, "\u{00B0}") as String
                nightLabel4.text = NSString(format: "night: \(nights![4].clean)%@" as NSString, "\u{00B0}") as String
                nightLabel5.text = NSString(format: "night: \(nights![5].clean)%@" as NSString, "\u{00B0}") as String
                nightLabel6.text = NSString(format: "night: \(nights![6].clean)%@" as NSString, "\u{00B0}") as String
            }
        }
    }
    
    
    // MARK: CONTENTVIEW
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    var refreshControl = UIRefreshControl()
    
    
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
    private let iconView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    private let iconView1: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    private let iconView2: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    private let iconView3: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    private let iconView4: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    private let iconView5: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    private let iconView6: UIImageView = {
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
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel5: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel6: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
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
    private let dayLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dayLabel3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dayLabel4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dayLabel5: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dayLabel6: UILabel = {
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
    private let minLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let minLabel3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let minLabel4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let minLabel5: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let minLabel6: UILabel = {
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
    private let maxLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let maxLabel3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let maxLabel4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let maxLabel5: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let maxLabel6: UILabel = {
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
    private let nightLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nightLabel3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nightLabel4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nightLabel5: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nightLabel6: UILabel = {
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
        setRefresh()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // refresh control setup
    func setRefresh() {
                refreshControl.tintColor = UIColor.systemIndigo
                refreshControl.attributedTitle = NSAttributedString(string: "refresh")
                self.scrollView.isScrollEnabled = true
                self.scrollView.alwaysBounceVertical = true
                scrollView.addSubview(refreshControl)
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
        descriptionLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 20).isActive = true
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
        humidityLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
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
        dayLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dayLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel1)
        dateLabel1.leadingAnchor.constraint(equalTo: degreeLabel1.trailingAnchor, constant: 4).isActive = true
        dateLabel1.topAnchor.constraint(equalTo: dayLabel1.bottomAnchor, constant: 6).isActive = true
        dateLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dateLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel1)
        minLabel1.leadingAnchor.constraint(equalTo: day1Rec.leadingAnchor, constant: 12).isActive = true
        minLabel1.topAnchor.constraint(equalTo: degreeLabel1.bottomAnchor, constant: 10).isActive = true
        minLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/2).isActive = true
        minLabel1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(maxLabel1)
        maxLabel1.leadingAnchor.constraint(equalTo: minLabel1.trailingAnchor, constant: 4).isActive = true
        maxLabel1.topAnchor.constraint(equalTo: degreeLabel1.bottomAnchor, constant: 10).isActive = true
        maxLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/3, constant: 12).isActive = true
        maxLabel1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel1)
        nightLabel1.leadingAnchor.constraint(equalTo: day1Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel1.topAnchor.constraint(equalTo: minLabel1.bottomAnchor, constant: 10).isActive = true
        nightLabel1.widthAnchor.constraint(equalTo: day1Rec.widthAnchor, multiplier: 1/3, constant: 15).isActive = true
        nightLabel1.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        // DAY2 RECTANGLE
        contentView.addSubview(day2Rec)
        day2Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day2Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day2Rec.topAnchor.constraint(equalTo: Rectangle.bottomAnchor, constant: 24).isActive = true
        day2Rec.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        contentView.addSubview(degreeLabel2)
        degreeLabel2.leadingAnchor.constraint(equalTo: day2Rec.leadingAnchor, constant: 4).isActive = true
        degreeLabel2.topAnchor.constraint(equalTo: day2Rec.topAnchor, constant: 4).isActive = true
        degreeLabel2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1 / 2, constant: -24).isActive = true
        
        contentView.addSubview(iconView2)
        iconView2.trailingAnchor.constraint(equalTo: day2Rec.trailingAnchor, constant: -4).isActive = true
        iconView2.bottomAnchor.constraint(equalTo: day2Rec.bottomAnchor, constant: -4).isActive = true
        iconView2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        iconView2.heightAnchor.constraint(equalTo: iconView2.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel2)
        dayLabel2.leadingAnchor.constraint(equalTo: degreeLabel2.trailingAnchor, constant: 4).isActive = true
        dayLabel2.topAnchor.constraint(equalTo: day2Rec.topAnchor, constant: 8).isActive = true
        dayLabel2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dayLabel2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel2)
        dateLabel2.leadingAnchor.constraint(equalTo: degreeLabel2.trailingAnchor, constant: 4).isActive = true
        dateLabel2.topAnchor.constraint(equalTo: dayLabel2.bottomAnchor, constant: 6).isActive = true
        dateLabel2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dateLabel2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel2)
        minLabel2.leadingAnchor.constraint(equalTo: day2Rec.leadingAnchor, constant: 12).isActive = true
        minLabel2.topAnchor.constraint(equalTo: degreeLabel2.bottomAnchor, constant: 10).isActive = true
        minLabel2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1/2).isActive = true
        minLabel2.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        contentView.addSubview(maxLabel2)
        maxLabel2.leadingAnchor.constraint(equalTo: minLabel2.trailingAnchor, constant: 4).isActive = true
        maxLabel2.topAnchor.constraint(equalTo: degreeLabel2.bottomAnchor, constant: 10).isActive = true
        maxLabel2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1/3, constant: 12).isActive = true
        maxLabel2.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel2)
        nightLabel2.leadingAnchor.constraint(equalTo: day2Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel2.topAnchor.constraint(equalTo: minLabel2.bottomAnchor, constant: 10).isActive = true
        nightLabel2.widthAnchor.constraint(equalTo: day2Rec.widthAnchor, multiplier: 1/3, constant: 15).isActive = true
        nightLabel2.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        // DAY3 RECTANGLE
        contentView.addSubview(day3Rec)
        day3Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day3Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day3Rec.topAnchor.constraint(equalTo: day1Rec.bottomAnchor, constant: 24).isActive = true
        day3Rec.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        contentView.addSubview(degreeLabel3)
        degreeLabel3.leadingAnchor.constraint(equalTo: day3Rec.leadingAnchor, constant: 4).isActive = true
        degreeLabel3.topAnchor.constraint(equalTo: day3Rec.topAnchor, constant: 4).isActive = true
        degreeLabel3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1 / 2, constant: -24).isActive = true
        
        contentView.addSubview(iconView3)
        iconView3.trailingAnchor.constraint(equalTo: day3Rec.trailingAnchor, constant: -4).isActive = true
        iconView3.bottomAnchor.constraint(equalTo: day3Rec.bottomAnchor, constant: -4).isActive = true
        iconView3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        iconView3.heightAnchor.constraint(equalTo: iconView3.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel3)
        dayLabel3.leadingAnchor.constraint(equalTo: degreeLabel3.trailingAnchor, constant: 4).isActive = true
        dayLabel3.topAnchor.constraint(equalTo: day3Rec.topAnchor, constant: 8).isActive = true
        dayLabel3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dayLabel3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel3)
        dateLabel3.leadingAnchor.constraint(equalTo: degreeLabel3.trailingAnchor, constant: 4).isActive = true
        dateLabel3.topAnchor.constraint(equalTo: dayLabel3.bottomAnchor, constant: 6).isActive = true
        dateLabel3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dateLabel3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel3)
        minLabel3.leadingAnchor.constraint(equalTo: day3Rec.leadingAnchor, constant: 12).isActive = true
        minLabel3.topAnchor.constraint(equalTo: degreeLabel3.bottomAnchor, constant: 10).isActive = true
        minLabel3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1/2).isActive = true
        minLabel3.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(maxLabel3)
        maxLabel3.leadingAnchor.constraint(equalTo: minLabel3.trailingAnchor, constant: 4).isActive = true
        maxLabel3.topAnchor.constraint(equalTo: degreeLabel3.bottomAnchor, constant: 10).isActive = true
        maxLabel3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1/3, constant: 12).isActive = true
        maxLabel3.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel3)
        nightLabel3.leadingAnchor.constraint(equalTo: day3Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel3.topAnchor.constraint(equalTo: minLabel3.bottomAnchor, constant: 10).isActive = true
        nightLabel3.widthAnchor.constraint(equalTo: day3Rec.widthAnchor, multiplier: 1/3, constant: 15).isActive = true
        nightLabel3.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        // DAY4 RECTANGLE
        contentView.addSubview(day4Rec)
        day4Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day4Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day4Rec.topAnchor.constraint(equalTo: day2Rec.bottomAnchor, constant: 24).isActive = true
        day4Rec.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        contentView.addSubview(degreeLabel4)
        degreeLabel4.leadingAnchor.constraint(equalTo: day4Rec.leadingAnchor, constant: 4).isActive = true
        degreeLabel4.topAnchor.constraint(equalTo: day4Rec.topAnchor, constant: 4).isActive = true
        degreeLabel4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1 / 2, constant: -24).isActive = true
        
        contentView.addSubview(iconView4)
        iconView4.trailingAnchor.constraint(equalTo: day4Rec.trailingAnchor, constant: -4).isActive = true
        iconView4.bottomAnchor.constraint(equalTo: day4Rec.bottomAnchor, constant: -4).isActive = true
        iconView4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        iconView4.heightAnchor.constraint(equalTo: iconView4.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel4)
        dayLabel4.leadingAnchor.constraint(equalTo: degreeLabel4.trailingAnchor, constant: 4).isActive = true
        dayLabel4.topAnchor.constraint(equalTo: day4Rec.topAnchor, constant: 8).isActive = true
        dayLabel4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dayLabel4.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel4)
        dateLabel4.leadingAnchor.constraint(equalTo: degreeLabel4.trailingAnchor, constant: 4).isActive = true
        dateLabel4.topAnchor.constraint(equalTo: dayLabel4.bottomAnchor, constant: 6).isActive = true
        dateLabel4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dateLabel4.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel4)
        minLabel4.leadingAnchor.constraint(equalTo: day4Rec.leadingAnchor, constant: 12).isActive = true
        minLabel4.topAnchor.constraint(equalTo: degreeLabel4.bottomAnchor, constant: 10).isActive = true
        minLabel4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1/2).isActive = true
        minLabel4.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(maxLabel4)
        maxLabel4.leadingAnchor.constraint(equalTo: minLabel4.trailingAnchor, constant: 4).isActive = true
        maxLabel4.topAnchor.constraint(equalTo: degreeLabel4.bottomAnchor, constant: 10).isActive = true
        maxLabel4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1/3, constant: 12).isActive = true
        maxLabel4.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel4)
        nightLabel4.leadingAnchor.constraint(equalTo: day4Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel4.topAnchor.constraint(equalTo: minLabel4.bottomAnchor, constant: 10).isActive = true
        nightLabel4.widthAnchor.constraint(equalTo: day4Rec.widthAnchor, multiplier: 1/3, constant: 15).isActive = true
        nightLabel4.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        // DAY5 RECTANGLE
        contentView.addSubview(day5Rec)
        day5Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day5Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day5Rec.topAnchor.constraint(equalTo: day3Rec.bottomAnchor, constant: 24).isActive = true
        day5Rec.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        day5Rec.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(degreeLabel5)
        degreeLabel5.leadingAnchor.constraint(equalTo: day5Rec.leadingAnchor, constant: 4).isActive = true
        degreeLabel5.topAnchor.constraint(equalTo: day5Rec.topAnchor, constant: 4).isActive = true
        degreeLabel5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1 / 2, constant: -24).isActive = true
        
        contentView.addSubview(iconView5)
        iconView5.trailingAnchor.constraint(equalTo: day5Rec.trailingAnchor, constant: -4).isActive = true
        iconView5.bottomAnchor.constraint(equalTo: day5Rec.bottomAnchor, constant: -4).isActive = true
        iconView5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        iconView5.heightAnchor.constraint(equalTo: iconView5.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel5)
        dayLabel5.leadingAnchor.constraint(equalTo: degreeLabel5.trailingAnchor, constant: 4).isActive = true
        dayLabel5.topAnchor.constraint(equalTo: day5Rec.topAnchor, constant: 8).isActive = true
        dayLabel5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dayLabel5.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel5)
        dateLabel5.leadingAnchor.constraint(equalTo: degreeLabel5.trailingAnchor, constant: 4).isActive = true
        dateLabel5.topAnchor.constraint(equalTo: dayLabel5.bottomAnchor, constant: 6).isActive = true
        dateLabel5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dateLabel5.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel5)
        minLabel5.leadingAnchor.constraint(equalTo: day5Rec.leadingAnchor, constant: 12).isActive = true
        minLabel5.topAnchor.constraint(equalTo: degreeLabel5.bottomAnchor, constant: 10).isActive = true
        minLabel5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1/2).isActive = true
        minLabel5.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(maxLabel5)
        maxLabel5.leadingAnchor.constraint(equalTo: minLabel5.trailingAnchor, constant: 4).isActive = true
        maxLabel5.topAnchor.constraint(equalTo: degreeLabel5.bottomAnchor, constant: 10).isActive = true
        maxLabel5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1/3, constant: 12).isActive = true
        maxLabel5.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel5)
        nightLabel5.leadingAnchor.constraint(equalTo: day5Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel5.topAnchor.constraint(equalTo: minLabel5.bottomAnchor, constant: 10).isActive = true
        nightLabel5.widthAnchor.constraint(equalTo: day5Rec.widthAnchor, multiplier: 1/3, constant: 15).isActive = true
        nightLabel5.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        // DAY6 RECTANGLE
        contentView.addSubview(day6Rec)
        day6Rec.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2,  constant: -24).isActive = true
        day6Rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        day6Rec.topAnchor.constraint(equalTo: day4Rec.bottomAnchor, constant: 24).isActive = true
        day6Rec.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        day6Rec.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(degreeLabel6)
        degreeLabel6.leadingAnchor.constraint(equalTo: day6Rec.leadingAnchor, constant: 4).isActive = true
        degreeLabel6.topAnchor.constraint(equalTo: day6Rec.topAnchor, constant: 4).isActive = true
        degreeLabel6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1 / 2, constant: -24).isActive = true
        
        contentView.addSubview(iconView6)
        iconView6.trailingAnchor.constraint(equalTo: day6Rec.trailingAnchor, constant: -4).isActive = true
        iconView6.bottomAnchor.constraint(equalTo: day6Rec.bottomAnchor, constant: -4).isActive = true
        iconView6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        iconView6.heightAnchor.constraint(equalTo: iconView6.widthAnchor).isActive = true
        
        contentView.addSubview(dayLabel6)
        dayLabel6.leadingAnchor.constraint(equalTo: degreeLabel6.trailingAnchor, constant: 4).isActive = true
        dayLabel6.topAnchor.constraint(equalTo: day6Rec.topAnchor, constant: 8).isActive = true
        dayLabel6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dayLabel6.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(dateLabel6)
        dateLabel6.leadingAnchor.constraint(equalTo: degreeLabel6.trailingAnchor, constant: 4).isActive = true
        dateLabel6.topAnchor.constraint(equalTo: dayLabel6.bottomAnchor, constant: 6).isActive = true
        dateLabel6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1/2, constant: 20).isActive = true
        dateLabel6.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(minLabel6)
        minLabel6.leadingAnchor.constraint(equalTo: day6Rec.leadingAnchor, constant: 12).isActive = true
        minLabel6.topAnchor.constraint(equalTo: degreeLabel6.bottomAnchor, constant: 10).isActive = true
        minLabel6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1/2).isActive = true
        minLabel6.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(maxLabel6)
        maxLabel6.leadingAnchor.constraint(equalTo: minLabel6.trailingAnchor, constant: 4).isActive = true
        maxLabel6.topAnchor.constraint(equalTo: degreeLabel6.bottomAnchor, constant: 10).isActive = true
        maxLabel6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1/3, constant: 12).isActive = true
        maxLabel6.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(nightLabel6)
        nightLabel6.leadingAnchor.constraint(equalTo: day6Rec.leadingAnchor, constant: 4).isActive = true
        nightLabel6.topAnchor.constraint(equalTo: minLabel6.bottomAnchor, constant: 10).isActive = true
        nightLabel6.widthAnchor.constraint(equalTo: day6Rec.widthAnchor, multiplier: 1/3, constant: 15).isActive = true
        nightLabel6.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
    }
}
