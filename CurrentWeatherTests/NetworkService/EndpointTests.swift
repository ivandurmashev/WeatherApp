//
//  EndpointTests.swift
//  CurrentWeatherTests
//
//  Created by Ivan Durmashev on 14.06.2023.
//

import XCTest
@testable import WeatherApp

final class EndpointTests: XCTestCase {
    typealias StubbedEndpoint = Endpoint<EndpointKinds.Stub, String>
    var host: URLHost!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        host = URLHost(rawValue: "test")
    }

    override func tearDownWithError() throws {
        host = nil
        try super.tearDownWithError()
    }
    
    func testEndpoint() throws {
        let endpoint = StubbedEndpoint(path: "path")
        let request = try XCTUnwrap(endpoint.makeRequest(with: (), host: host))
        try XCTAssertEqual(request.url, host.expectedURL(withPath: "path"))
    }
    
    func testGeneratingRequestWithQueryItems() throws {
        let endpoint = StubbedEndpoint(path: "path", queryItems: [
            URLQueryItem(name: "a", value: "1"),
            URLQueryItem(name: "b", value: "2")
        ])
        let request = try XCTUnwrap(endpoint.makeRequest(with: (), host: host))
        try XCTAssertEqual(request.url, host.expectedURL(withPath: "path?a=1&b=2"))
    }
}

extension URLHost {
    func expectedURL(withPath path: String) throws -> URL {
        let url = URL(string: "https://" + rawValue + "/" + path)
        return try XCTUnwrap(url)
    }
}
