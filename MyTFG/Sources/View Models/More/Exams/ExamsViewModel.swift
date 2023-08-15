//
//  ExamViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 01.03.22.
//

import Foundation
import Combine

class ExamsViewModel: ObservableObject, ExamsService {
    internal var apiSession: APIService

    @Published private(set) var exams10 = [ExamCellViewModel]()
    @Published private(set) var exams11 = [ExamCellViewModel]()
    @Published private(set) var exams12 = [ExamCellViewModel]()
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String = ""

    private var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }

    func onAppear() {
        loadExams()
    }

    func onRefresh() {
        loadExams()
    }

    private func loadExams() {
        self.getExamsList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error getExamsList: \(error)")
                    self.errorMessage = "\(error.localizedDescription)"
                    self.isLoading = false
                case .finished:
                    break
                }
            }, receiveValue: { response in
                if let responseExams10 = response.exams.entries["10"] {
                    self.exams10 = responseExams10.map(ExamCellViewModel.init)
                }
                if let responseExams11 = response.exams.entries["11"] {
                    self.exams11 = responseExams11.map(ExamCellViewModel.init)
                }
                if let responseExams12 = response.exams.entries["12"] {
                    self.exams12 = responseExams12.map(ExamCellViewModel.init)
                }
                self.errorMessage = ""
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
}
