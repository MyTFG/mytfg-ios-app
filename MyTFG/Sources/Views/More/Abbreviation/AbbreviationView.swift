//
//  AbbreviationView.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import SwiftUI

struct AbbreviationView: View {
    @ObservedObject var viewModel: AbbreviationViewModel

    init(_ type: AbbreviationType) {
        self.viewModel = AbbreviationViewModel(type)
    }

    var body: some View {
        if viewModel.errorMessage == "" {
            list
        } else {
            MessageView(message: viewModel.errorMessage) {
                viewModel.onRefresh()
            }
        }
    }

    var list: some View {
        List(viewModel.filteredItems) { item in
            AbbreviationItemView(viewModel: item)
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .searchable(text: $viewModel.searchQuery)
        .navigationTitle(Text(viewModel.getTitle))
        .onAppear {
            viewModel.onAppear()
        }
        .animation(.easeInOut, value: viewModel.items.count)
    }
}

#if DEBUG
struct AbbreviationView_Previews: PreviewProvider {
    static var previews: some View {
        AbbreviationView(AbbreviationType.teachers)
    }
}
#endif
