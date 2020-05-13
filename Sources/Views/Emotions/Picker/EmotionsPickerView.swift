//
//  EmotionsPickerView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionsPickerView: View {
    
    var viewModel: EmotionsPickerViewModel
    
    var body: some View {
        HStack {
            Button(action: {}) { Text("™2123") }
            Button(action: {}) { Text("™2123") }
            Button(action: {}) { Text("™2123") }
            Button(action: {}) { Text("™2123") }
            Button(action: {}) { Text("™2123") }
            Button(action: {}) { Text("™2123") }
        }
    }
    
}


struct EmotionsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsPickerView(viewModel: EmotionsPickerViewModel())
    }
}
