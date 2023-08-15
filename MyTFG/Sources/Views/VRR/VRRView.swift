//
//  VRRView.swift
//  MyTFG
//
//  Created by Jakob Handke on 21.09.21.
//

import SwiftUI

struct VRRView: View {
    @StateObject private var viewModel: VRRViewModel = VRRViewModel()

    var body: some View {
        NavigationView {
            if viewModel.errorMessage == "" {
                list
            } else {
                MessageView(message: viewModel.errorMessage) {
                    viewModel.onRefresh()
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationViewStyle(.stack)
    }

    var list: some View {
        List(self.viewModel.vrrEntries) { cellViewModel in
            VRRCellView(viewModel: cellViewModel)
                .padding(.vertical)
        }
        .refreshable {
            self.viewModel.onRefresh()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .navigationTitle("Abfahrtszeiten")
        .animation(.easeInOut, value: viewModel.vrrEntries.count)
    }
}

#if DEBUG
struct VRRView_Previews: PreviewProvider {
    static var previews: some View {
        VRRView()
    }
}
#endif
