//
//  MockCurrentWeatherPresenter.swift
//  CurrentWeatherTests
//
//  Created by Ivan Durmashev on 11.06.2023.
//

import Foundation
@testable import WeatherApp

final class MockCurrentWeatherPresenter: ICurrentWeatherPresenter {
    var networkService: INetworkService
    var router: ICurrentWeatherRouter
    weak var ui: ICurrentWeatherView?

    var showError: ((Error) -> Void)?

    func viewDidLoad(ui: ICurrentWeatherView) {
        self.ui = ui
    }

    init(networkService: INetworkService, router: ICurrentWeatherRouter) {
        self.networkService = networkService
        self.router = router
    }
}
