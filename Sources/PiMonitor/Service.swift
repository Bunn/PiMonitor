//
//  Service.swift
//  
//
//  Created by Fernando Bunn on 25/07/2020.
//

import Foundation

internal struct Service {
    
    func fetchMetrics(host: String, port: Int? = nil, completion: @escaping (Result<PiMetrics, PiMonitorError>) -> ()) {
        guard let url = URLWithComponents(host: host, port: port) else {
            completion(.failure(.malformedURL))
            return
        }
        
        let session = URLSession(configuration: .default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                completion(.failure(.sessionError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            if let response = response as? HTTPURLResponse {
                if 200 ..< 300 ~= response.statusCode {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let piMetric = try decoder.decode(PiMetrics.self, from: data)
                        completion(.success(piMetric))
                    } catch {
                        completion(.failure(.invalidDecode(error)))
                    }
                } else {
                    completion(.failure(.invalidResponseCode(response.statusCode)))
                    return
                }
            } else {
                completion(.failure(.invalidResponse))
                return
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    private func URLWithComponents(host: String, port: Int? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = host
        components.port = port
        components.path = "/monitor.json"
        guard let url = components.url else {
            return nil
        }
        return url
    }
}
