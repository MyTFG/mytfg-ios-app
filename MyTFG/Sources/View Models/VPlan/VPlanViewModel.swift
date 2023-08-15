//
//  VPlanViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 04.11.21.
//

import Foundation
import Combine
import SwiftUI

class VPlanViewModel: ObservableObject, VPlanService {
    var secretService: SecretService = SecretService()

    var apiSession: APIService

    private let day: VPlanDay

    @Published private(set) var entries: [VPlanCellViewModel] = [VPlanCellViewModel]()
    @Published private(set) var vplanDate: String = "VPlan"
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String = ""
    @Published private(set) var lastUpdate: String = ""
    @Published private(set) var marquee: [String] = [String]()
    @Published private(set) var absentEntries: [VPlanAbsent] = [VPlanAbsent]()

    private var cancellables = Set<AnyCancellable>()

    init(_ day: VPlanDay, apiSession: APIService = APISession()) {
        self.day = day
        self.apiSession = apiSession
    }

    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }

    func onAppear() {
        self.loadVPlan()
    }

    func refresh() {
        if self.entries.isEmpty {
            self.isLoading = true
        }
        self.loadVPlan()
    }

    private func loadVPlan() {
        self.getVPlanList(day: day)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error VPlan: \(error.localizedDescription)")
                    self.isLoading = false
                    self.errorMessage = "\(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { (vplanRepo) in
                var entries = vplanRepo.planData.entries.map(VPlanCellViewModel.init)
                let additionalEntries = vplanRepo.planData.additionalEntries.map {
                    VPlanCellViewModel.init(entry: $0, isAdditional: true)
                }
                entries.append(contentsOf: additionalEntries)
                self.vplanDate = self.formatDateTitle(vplanRepo.planData.date)

                self.errorMessage = ""

                if entries.count == 0 {
                    self.errorMessage = "Es sind keine Einträge für \(self.formatDateMessage(vplanRepo.planData.date)) vorhanden."
                }

                self.entries = entries
                self.marquee = vplanRepo.planData.marquee

                var absentEntries = [VPlanAbsent]()
                if vplanRepo.planData.absentTeachers.count <= vplanRepo.planData.absentLessons.count {
                    for index in 0..<vplanRepo.planData.absentTeachers.count {
                        // swiftlint:disable line_length
                        let absent = VPlanAbsent(teacherName: vplanRepo.planData.absentTeachers[index], absentLessons: vplanRepo.planData.absentLessons[index])
                        absentEntries.append(absent)
                    }
                } else {
                    for index in 0..<vplanRepo.planData.absentLessons.count {
                        // swiftlint:disable line_length
                        let absent = VPlanAbsent(teacherName: vplanRepo.planData.absentTeachers[index], absentLessons: vplanRepo.planData.absentLessons[index])
                        absentEntries.append(absent)
                    }
                }
                self.absentEntries = absentEntries
                self.lastUpdate = vplanRepo.planData.changed?.stringValue ?? ""

                self.isLoading = false
            })
            .store(in: &cancellables)
    }

    private func formatDateTitle(_ date: String) -> String {
        let formatter = CustomDateFormatter(date: date)
        return "VPlan für \(formatter.getVPlanDate())"
    }

    private func formatDateMessage(_ date: String) -> String {
        let formatter = CustomDateFormatter(date: date)
        return formatter.getLongVPlanDate()
    }
}
