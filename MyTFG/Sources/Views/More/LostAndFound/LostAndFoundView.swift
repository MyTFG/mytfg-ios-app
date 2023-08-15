//
//  LostAndFoundView.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import SwiftUI

struct LostAndFoundView: View {
    @StateObject private var viewModel = LostAndFoundViewModel()

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
            HStack {
                Text(item.getDescription)
                Spacer()
                Text(item.getDate)
            }
        }
        .searchable(text: $viewModel.searchQuery)
        .onAppear {
            viewModel.onAppear()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .animation(.easeInOut, value: viewModel.items.count)
        .navigationTitle("Fundsachen")
    }
}

#if DEBUG
struct LostAndFoundView_Previews: PreviewProvider {
    static var previews: some View {
        LostAndFoundView()
    }
}
#endif
