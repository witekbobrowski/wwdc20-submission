//
//  EmotionsApp.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import UIKit
import SwiftUI

protocol ImagePickerDelegate: class {
    func imagePickerDidSelect(_ image: UIImage?)
}

public class EmotionsApp: UIHostingController<RootView> {
    
    weak var pickerDelegate: ImagePickerDelegate?
    
    convenience init() {
        let root = RootView()
        self.init(rootView: root)
        view.backgroundColor = Style.Color.background.uiColor
    }
    
    func presentCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        picker.modalPresentationStyle = .fullScreen
        present(picker, animated: true, completion: nil)
    }
    
}

extension EmotionsApp: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    public func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        pickerDelegate?.imagePickerDidSelect(info[.originalImage] as? UIImage)
        dismiss(animated: true, completion: nil)
    }
}


extension Color {
    
    var uiColor: UIColor {
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
