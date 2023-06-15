//
//  NetworkServise.swift
//  WeatherApp
//
//  Created by Иван Дурмашев on 04.06.2022.
//

import Foundation


protocol INetworkService: AnyObject {
    func loadHistoryOfWeatherFrom(_ city: String, completion: @escaping (Result<HistoryOfWeather, Error>) -> Void)
    func loadWeatherImage(urlString: String, completion: @escaping(Result<Data, Error>) -> Void)
}

final class NetworkService {
//MARK: - Private property
    private let session: URLSession
    
    let accessToken: AccessToken = .key
    
    init(urlSession: URLSession = .shared) {
        session = urlSession
    }
}

//MARK: - INetworkService
extension NetworkService: INetworkService {
    func loadHistoryOfWeatherFrom(_ city: String, completion: @escaping (Result<HistoryOfWeather, Error>) -> Void) {
        session.dataTask(for: .look(for: city), using: accessToken, completion: completion)
    }
    
    func loadWeatherImage(urlString: String, completion: @escaping(Result<Data, Error>) -> Void) {
        let correctUrlString = "https:"+urlString
        guard let url = URL(string: correctUrlString) else { return }
        let request = URLRequest(url: url)
        session.downloadTask(with: request) { url, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let url = url else { return }
            if let data = try? Data(contentsOf: url) {
                completion(.success(data))
            }
        }.resume()
    }
}

enum URLRequestError: Error {
    case invalidEndpoin
}

fileprivate extension URLSession {
    func dataTask<Kind, Response>(
        for endpoint: Endpoint<Kind, Response>,
        using requestData: Kind.RequestData,
        jsonDecoder: JSONDecoder = .init(),
        completion: @escaping (Result<Response, Error>) -> Void) {
        
            guard let request = endpoint.makeRequest(with: requestData) else { completion(.failure(URLRequestError.invalidEndpoin)); return }
            dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    do {
                        let response = try jsonDecoder.decode(NetworkResponse<Response>.self, from: data)
                        completion(.success(response.result))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
    }
}
