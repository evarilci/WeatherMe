//
//  WeatherResponse.swift
//  WeatherMe
//
//  Created by Eymen Varilci on 13.11.2022.
//

import Foundation


struct WeatherResponse: Codable {
    let success: Bool
    let city: String
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let date: String
    let day: String
    let icon: String
    let description: String
    let status: String
    let degree: String
    let min: String
    let max: String
    let night: String
    let humidity: String
}

