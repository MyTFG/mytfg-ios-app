//
//  VPlanCellView.swift
//  MyTFG
//
//  Created by Jakob Handke on 28.09.21.
//

import SwiftUI

struct VPlanCellView: View {
    @StateObject var viewModel: VPlanCellViewModel

    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 3.0) {
                Text(viewModel.getLesson)
                    .font(.title2)
                Text(viewModel.getClass)
                    .font(.title2)
            }
            .frame(width: 60, alignment: .center)
            VStack(alignment: .leading, spacing: 3.0) {
                Spacer()
                Text(viewModel.getPlan)
                    .font(.title3)
                if viewModel.hasSubstitution {
                    Text(viewModel.getSubstitution)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                if viewModel.hasComment {
                    Text(viewModel.getComment)
                        .font(.title3)
                }
                Spacer()
            }
        }
    }
}

#if DEBUG
struct VPlanCellView_Previews: PreviewProvider {
    static var previews: some View {
        VPlanCellView(viewModel: VPlanCellViewModel(
            entry: VPlanEntry(
                id: "121061", cls: "12", lesson: "3. + 8.", plan: "BHO E 209",
                substitution: "eigenst. Arbeiten", comment: "", date: "2021-11-04",
                lastUpdate: "1636025220", teacher: "BHO", substitutionTeacher: "",
                planTeacherName: "N. Beerhorst", planSubjectName: "Englisch",
                shortage: "", planRoom: "209", substitutionTeacherName: "",
                substitutionSubjectName: "", substitutionRoom: "",
                planText: "N. Beerhorst mit Englisch in 209",
                substitutionText: "eigenst. Arbeiten", version: "0",
                teachers: "BHO", teacherOnly: "0", color: "blue")))
    }
}
#endif
