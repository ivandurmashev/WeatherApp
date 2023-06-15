//
//  AccessToken.swift
//  WeatherApp
//
//  Created by Ivan Durmashev on 14.06.2023.
//

import Foundation

struct AccessToken: RawRepresentable {
    var rawValue: String
    
    static var key: Self {
        return AccessToken(rawValue: "b3a3f82138de4a3a9fe175841222405")
    }
}
