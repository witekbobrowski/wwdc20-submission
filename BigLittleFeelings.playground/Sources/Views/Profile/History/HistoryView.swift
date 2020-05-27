//
//  HistoryView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject private var router: Router
    
    var viewModel: HistoryViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.items.indices, content: row)
        }
    }
    
    private func row(forItemAt index: Int) -> some View {
        let item = viewModel.items[index]
        return Button(action: { self.router.current = self.viewModel.path(for: item) }) {
            HStack(spacing: 0) {
                Text(viewModel.icon(for: item))
                    .padding(.all, 12)
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading) {
                    Text(viewModel.title(for: item))
                        .font(Style.Font.font(style: .headline))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Style.Color.black)
                    Text(viewModel.subtitle(for: item))
                        .font(Style.Font.font(style: .footnote))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Style.Color.black)
                }
                Spacer()
            }.frame(width: 300, height: 50)
                .background(Style.Color.accentColor(for: item.exercise))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Style.Color.lightGray, radius: 2)
        }
    }
    
}

// MARK: - Subviews
extension HistoryView {
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewModel: HistoryViewModel(store: .mock))
    }
}
