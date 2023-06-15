//
//  NetworkServiceTests.swift
//  CurrentWeatherTests
//
//  Created by Ivan Durmashev on 11.06.2023.
//

import XCTest
@testable import WeatherApp

final class NetworkServiceTests: XCTestCase {
    var sut: NetworkService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = NetworkService(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testLoadHistoricalWeatherDataSuccess() {
        //given
        let inputCity = "Saint-Petersburg"
        let expectation = XCTestExpectation(description: "response")
        
        //when
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.query()?.contains(inputCity), true)
            return (HTTPURLResponse(), Data())
        }
        
        //then
//        sut.loadHistoricalWeatherData(city: inputCity) { (result: Result<HistoryOfWeather, Error>) in
//            switch result {
//            case .success(let success):
//                XCTAssertNotNil(success)
//                XCTAssertEqual(success.location.name, inputCity)
//            case .failure(let failure):
//                XCTFail(failure.localizedDescription)
//            }
//            expectation.fulfill()
//        }
//        
//        wait(for: [expectation], timeout: 2)
    }

}
