//
//  EventsView.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import SwiftUI

struct EventsView: View {
    @StateObject private var viewModel: EventsViewModel = EventsViewModel()

    var body: some View {
        NavigationView {
            if viewModel.errorMessage == "" {
                list
            } else {
                error
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationViewStyle(.stack)
    }

    var list: some View {
        List(viewModel.events, id: \.id) { event in
            EventCellView(viewModel: event)
                .padding(.vertical)
        }
        .refreshable {
            viewModel.onRefresh()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .navigationTitle("Termine am TFG")
        .animation(.easeInOut, value: viewModel.events.count)
    }

    var error: some View {
        MessageView(message: viewModel.errorMessage) {
            viewModel.onRefresh()
        }
        .navigationTitle("Termine am TFG")
    }
}

#if DEBUG
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
#endif
