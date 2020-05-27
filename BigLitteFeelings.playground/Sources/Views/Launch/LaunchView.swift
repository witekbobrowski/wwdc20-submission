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
    
    @State private var didAppear = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            LogoView(fontSize: 60)
                .opacity(didAppear ? 1 : 0)
                .scaleEffect(didAppear ? 1 : 0.75)
                .offset(x: 0, y: didAppear ? 0 : -16)
                .transition(.identity)
                .animation(Animation.easeOut(duration: 0.5).delay(0.35))
            Spacer()
            PhotoView(viewModel: viewModel.photo).frame(width: 150)
            HelloView(viewModel: viewModel.hello).frame(width: 400)
            Spacer()
            beginButton
            Spacer()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
            .onAppear(perform: { self.didAppear = true })
            .onDisappear(perform: { self.didAppear = false })
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
        LaunchView(viewModel: LaunchViewModel(store: Store()))
    }
}
