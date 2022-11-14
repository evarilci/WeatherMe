//
//  WeatherResponse.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import Foundation


struct WeatherResponse: Codable {
    let success: Bool?
    let city: String?
    let result: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let date: String?
    let day: String?
    let icon: String?
    let description: String?
    let status: String?
    let degree: String?
    let min: String?
    let max: String?
    let night: String?
    let humidity: String?
}

extension Result {
    var degreeDouble: Double {
        guard let degree = degree,
              let double = Double(degree) else {
                return 0.0
        }
        return double
    }
    
    var minDouble: Double {
        guard let degree = min,
              let double = Double(degree) else {
                return 0.0
        }
        return double
    }
    
    var maxDouble: Double {
        guard let degree = max,
              let double = Double(degree) else {
                return 0.0
        }
        return double
    }
    
    var nightDouble: Double {
        guard let degree = night,
              let double = Double(degree) else {
                return 0.0
        }
        return double
    }
    
}


extension Result {
    var iconURL: URL {
        guard let icon = icon,
              let iconURL = URL(string: icon) else {
                let image = "https://www.computerhope.com/jargon/b/black.jpg",
                    iconUrl = URL(string: image)
                return iconUrl!
            }
            return iconURL
        }
        
    }

