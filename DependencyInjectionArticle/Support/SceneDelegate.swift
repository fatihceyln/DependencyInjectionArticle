//
//  SceneDelegate.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 17.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
//        let urlString = "https://jsonplaceholder.typicode.com/posts"
//        let dataService = RealDataService(urlString: urlString)
        
        let mockPost = Post(userId: 0, id: 0, title: "mock title", body: "mock body")
        let mockDataService = MockDataService(mockPosts: [mockPost])
        
        window?.rootViewController = HomeVC(dataService: mockDataService)
        window?.makeKeyAndVisible()
    }
}

