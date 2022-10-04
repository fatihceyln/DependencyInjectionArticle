//
//  ObservableObject.swift
//  DependencyInjectionArticle
//
//  Created by Fatih Kilit on 17.09.2022.
//

import Foundation

class ObservableObject<T> {
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> ())?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T) -> ()) {
        self.listener = listener
    }
}
