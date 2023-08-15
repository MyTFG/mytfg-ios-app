//
//  ExamsView.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.01.22.
//

import SwiftUI

struct ExamsView: View {
    @StateObject private var viewModel = ExamsViewModel()
    @State private var selectedGrade: ExamGrade = .grade10

    var body: some View {
        if viewModel.errorMessage == "" {
            List {
                Picker("Stufe", selection: $selectedGrade) {
                    ForEach(ExamGrade.allCases, id: \.rawValue) { grade in
                        Text(grade.rawValue).tag(grade)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 8)

                switch selectedGrade {
                case .grade10:
                    ForEach(viewModel.exams10) { exam in
                        ExamCellView(examCell: exam)
                    }
                    .refreshable {
                        viewModel.onRefresh()
                    }
                case .grade11:
                    ForEach(viewModel.exams11) { exam in
                        ExamCellView(examCell: exam)
                    }
                    .refreshable {
                        viewModel.onRefresh()
                    }
                case .grade12:
                    ForEach(viewModel.exams12) { exam in
                        ExamCellView(examCell: exam)
                    }
                    .refreshable {
                        viewModel.onRefresh()
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Klausurplan")
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: viewModel.exams10.count)
            .onAppear {
                viewModel.onAppear()
            }
        } else {
            MessageView(message: viewModel.errorMessage) {
                viewModel.onRefresh()
            }
        }
    }
}

#if DEBUG
struct ExamsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExamsView()
        }
    }
}
#endif
