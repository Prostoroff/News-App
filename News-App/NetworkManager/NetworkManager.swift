//
//  NetworkManager.swift
//  News-App
//
//  Created by Иван Осипов on 01.03.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchNews(completion: @escaping (Result<[News]?, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    private let baseURL = "https://newsapi.org/v2/top-headlines"
    private let apiKey = "3937105f648849759b9ba2da70801d45"
    
    func fetchNews(completion: @escaping (Result<[News]?, Error>) -> Void) {
        let urlString = "\(baseURL)?country=ru&apiKey=\(apiKey)"
        performRequest(with: urlString, completion: completion)
    }
    
    private func performRequest(with urlString: String, completion: @escaping (Result<[News]?, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(JsonResponce.self, from: data)
                completion(.success(decodedData.articles))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
