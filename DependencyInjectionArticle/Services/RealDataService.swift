//
//  RealDataService.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 17.09.2022.
//

import Foundation

class RealDataService: DataServiceProtocol {
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func downloadPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { completion(.failure(error)); return }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse))); return
            }
            
            guard let data = data else {completion(.failure(URLError(.badURL))); return }
            
            do {
                let post = try JSONDecoder().decode([Post].self, from: data)
                completion(.success(post))
            } catch let error {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
