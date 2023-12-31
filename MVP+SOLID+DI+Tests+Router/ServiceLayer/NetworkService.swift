//
//  NetworkService.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 27.07.23.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> ()) {

        let urlString = "https://jsonplaceholder.typicode.com/comments"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

