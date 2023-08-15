//
//  VPlanListView.swift
//  MyTFG
//
//  Created by Jakob Handke on 26.08.22.
//

import SwiftUI

struct VPlanListView: View {
    @StateObject var viewModel: VPlanViewModel
    @State private var showingAdditionalSheet = false

    var body: some View {
        NavigationView {
            if viewModel.errorMessage == "" {
                List(viewModel.entries) { entry in
                    VPlanCellView(viewModel: entry)
                        .padding(.vertical)
                }
                .refreshable {
                    viewModel.refresh()
                }
                .animation(.easeInOut(duration: 0.5), value: viewModel.vplanDate)
                .navigationTitle(viewModel.vplanDate)
                .toolbar {
                    Button {
                        showingAdditionalSheet.toggle()
                    } label: {
                        Image(systemName: "info")
                    }
                    .disabled(viewModel.isLoading)
                }
                .sheet(isPresented: $showingAdditionalSheet) {
                    VPlanInfoView(lastUpdate: viewModel.lastUpdate, marquee: viewModel.marquee, absentEntries: viewModel.absentEntries)
                }
            } else {
                MessageView(message: viewModel.errorMessage, action: {
                    self.viewModel.refresh()
                })
                .refreshable {
                    viewModel.refresh()
                }
                .navigationTitle(viewModel.vplanDate)
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.onAppear()
        }
    }
}
