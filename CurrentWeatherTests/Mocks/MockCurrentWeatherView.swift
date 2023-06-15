//
//  MockCurrentWeatherView.swift
//  CurrentWeatherTests
//
//  Created by Ivan Durmashev on 11.06.2023.
//

import Foundation
@testable import WeatherApp

final class MockCurrentWeatherView: ICurrentWeatherView {
    func displayWeatherData(_ model: WeatherApp.CurrentWeatherViewModel?) {
        
    }
    
    var onTapButtonHandler: (() -> Void)?
    
    var requestWeatherInCity: (((String?)) -> Void)?
    
    func requestWeather() {
        
    }
    
    func setImage(imageData: Data) {
        
    }
}
