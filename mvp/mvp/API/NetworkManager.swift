//
//  NetworkManager.swift
//  mvp
//
//  Created by Дмитрий Цветков on 26.07.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
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
