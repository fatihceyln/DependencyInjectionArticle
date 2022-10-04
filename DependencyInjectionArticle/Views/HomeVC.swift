//
//  HomeVC.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 17.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    
    let viewModel: HomeViewModel
    
    init(dataService: DataServiceProtocol) {
        self.viewModel = HomeViewModel(dataService: dataService)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBinders()
    }
    
    private func addBinders() {
        viewModel.posts.bind { [weak self] returnedPosts in
            guard let _ = self else { return }
            
            returnedPosts.forEach { post in
                print(post.title)
            }
        }
    }
}
