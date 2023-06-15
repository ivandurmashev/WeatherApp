//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Ivan Durmashev on 14.06.2023.
//

import Foundation

struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var path: String
    var queryItems = [URLQueryItem]()
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData,
                     host: URLHost = .production) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.rawValue
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
}

extension Endpoint where Kind == EndpointKinds.Public, Response == HistoryOfWeather {
    static var featuredItems: Self {
        Endpoint(path: "history.json?")
    }
}

extension Endpoint where Kind == EndpointKinds.Private, Response == HistoryOfWeather {
    static func look(for query: String, fromDaysAgo: Int = 7, toDaysAgo: Int = 0) -> Self {
        Endpoint(path: "history.json?", queryItems: [
            URLQueryItem(name: "dt", value: DateConverter.getDateString(daysAgo: fromDaysAgo)),
            URLQueryItem(name: "end_dt", value: DateConverter.getDateString(daysAgo: toDaysAgo)),
            URLQueryItem(name: "q", value: query)
        ])
    }
}
