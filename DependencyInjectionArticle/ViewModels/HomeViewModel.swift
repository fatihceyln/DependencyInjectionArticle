//
//  HomeViewModel.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 17.09.2022.
//

import Foundation

class HomeViewModel {
    var posts: ObservableObject<[Post]> = ObservableObject([])
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        getPosts()
    }
    
    private func getPosts() {
        dataService.downloadPosts { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let posts):
                self.posts.value = posts
            case .failure(let error):
                print(error)
            }
        }
    }
}
