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
    
    var photo: PhotoViewModel { PhotoViewModel(builder: builder) }
    var hello: HelloViewModel { HelloViewModel(builder: builder) }
    
    init(builder: UserBuilder = UserBuilder(), store: Store) {
        self.builder = builder
        self.store = store
    }
    
    func save() {
        builder.build().map(store.save)
    }
    
}

//extension LaunchViewModel: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let newImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        imageView.image = newImage
//        dismiss(animated: true, completion: nil)
//    }
//}
