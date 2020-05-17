//
//  LaunchViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class LaunchViewModel: ObservableObject {
    
    private let builder: UserBuilder
    private let store: Store
    
    private(set) lazy var photo: PhotoViewModel = {
        let viewModel = PhotoViewModel(builder: builder)
        viewModel.delegate = hello
        return viewModel
    }()
    private(set) lazy var hello: HelloViewModel = {
        HelloViewModel(builder: builder)
    }()
    
    init(builder: UserBuilder = UserBuilder(), store: Store) {
        self.builder = builder
        self.store = store
    }
    
    func save() {
        builder.build().map(store.save)
    }
    
}
