//
//  DataServiceProtocol.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 4.10.2022.
//

import Foundation

protocol DataServiceProtocol {
    func downloadPosts(completion: @escaping (Result<[Post], Error>) -> ())
}
