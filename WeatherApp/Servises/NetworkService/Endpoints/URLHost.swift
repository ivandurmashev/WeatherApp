//
//  URLHost.swift
//  WeatherApp
//
//  Created by Ivan Durmashev on 14.06.2023.
//

import Foundation

struct URLHost: RawRepresentable {
    var rawValue: String
}

extension URLHost {
    static var production: Self {
        URLHost(rawValue: "api.weatherapi.com")
    }
}
