//
//  LaunchView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 15/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    
    var viewModel: LaunchViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Spacer()
            PhotoView().frame(width: 200)
            HelloView(viewModel: viewModel.hello).frame(width: 400)
            Spacer()
            beginButton
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
    private func begin() {
        viewModel.save()
        router.current = .dashboard()
    }

}

// MARK: - Subviews
extension LaunchView {
    private var beginButton: some View {
        Button(action: begin) {
            Text("Begin")
                .font(Style.Font.font(style: .title))
                .foregroundColor(.white)
                .bold()
                .padding(EdgeInsets(top: 12, leading: 32, bottom: 12, trailing: 32))
                .background(Style.Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: LaunchViewModel())
    }
}
