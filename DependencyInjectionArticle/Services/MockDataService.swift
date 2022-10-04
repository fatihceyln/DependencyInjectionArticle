//
//  MockDataService.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 4.10.2022.
//

import Foundation

class MockDataService: DataServiceProtocol {
    
    let mockPosts: [Post]
    
    init(mockPosts: [Post]) {
        self.mockPosts = mockPosts
    }
    
    func downloadPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(self.mockPosts))
        }
    }
}
