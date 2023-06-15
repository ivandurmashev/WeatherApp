//
//  CurrentWeatherPresenterTests.swift
//  CurrentWeatherPresenterTests
//
//  Created by Ivan Durmashev on 11.06.2023.
//

import XCTest
@testable import WeatherApp

final class CurrentWeatherPresenterTests: XCTestCase {
    var mockCurrentWeatherView: ICurrentWeatherView!
    var mockNetworkServise: INetworkService!
    var mockRouter: ICurrentWeatherRouter!
    var sut: CurrentWeatherPresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCurrentWeatherView = MockCurrentWeatherView()
        mockNetworkServise = MockNetworkServise()
        mockRouter = MockCurrentWeatherRouter()
        sut = CurrentWeatherPresenter(networkService: mockNetworkServise, router: mockRouter)
    }

    override func tearDownWithError() throws {
        mockCurrentWeatherView = nil
        mockNetworkServise = nil
        mockRouter = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testModuleIsNotNil() {
        XCTAssertNotNil(mockCurrentWeatherView, "view is not nil")
        XCTAssertNotNil(mockNetworkServise, "networkServise is not nil")
        XCTAssertNotNil(mockRouter, "router is not nil")
        XCTAssertNotNil(sut, "presenter is not nil")
    }

    func testViewIsLoaded() {
        sut.viewDidLoad(ui: mockCurrentWeatherView)
        XCTAssertNotNil(sut.ui, "view is not loaded")
    }
}
