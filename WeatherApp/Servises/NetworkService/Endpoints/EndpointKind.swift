//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Ivan Durmashev on 14.06.2023.
//

import Foundation

protocol EndpointKind {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest,
                        with data: RequestData)
}

enum EndpointKinds {
    enum Public: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with _: Void) {
            request.cachePolicy = .reloadIgnoringLocalCacheData
        }
    }
    enum Private: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with token: AccessToken) {
            request.addValue("\(token.rawValue)", forHTTPHeaderField: "key")
        }
    }
    enum Stub: EndpointKind {
        static func prepare(_ request: inout URLRequest, with _: Void) {}
    }
}
