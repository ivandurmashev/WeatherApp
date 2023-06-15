//
//  MockNetworkServise.swift
//  CurrentWeatherTests
//
//  Created by Ivan Durmashev on 11.06.2023.
//

import Foundation
@testable import WeatherApp

final class MockNetworkServise: INetworkService {
    func loadHistoryOfWeatherFrom(_ city: String, completion: @escaping (Result<WeatherApp.HistoryOfWeather, Error>) -> Void) {
        
    }
    
    func loadWeatherImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
}
