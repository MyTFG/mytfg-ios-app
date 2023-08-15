//
//  ExamCellView.swift
//  MyTFG
//
//  Created by Jakob Handke on 26.02.22.
//

import SwiftUI

struct ExamCellView: View {
    @ObservedObject var examCell: ExamCellViewModel

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center, spacing: 3.0) {
                Text(examCell.dayOfWeek)
                    .font(.body)
                Text(examCell.day)
                    .font(.title)
                Text(examCell.month)
                    .font(.body)
                if examCell.type == .entry {
                    Text(examCell.block)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.top, 4)
                }
            }
            .frame(width: 60, alignment: .center)
            Spacer()
            switch examCell.type {
            case .entry:
                examEntry
            case .spanned:
                spannedEntry
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }

    private var examEntry: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center, spacing: 4) {
                HStack(alignment: .center, spacing: 40) {
                    Text(examCell.subject)
                        .font(.largeTitle)
                    Text(examCell.teacher)
                        .font(.largeTitle)
                }
                Text(examCell.lessons)
                    .font(.largeTitle)
            }
            if examCell.crossed {
                Image(systemName: "multiply")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(.red)
                    .opacity(0.78)
                    .frame(width: 100, height: 100)
            }
        }
    }

    private var spannedEntry: some View {
        Text(examCell.spannedText)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
}

#if DEBUG
// swiftlint:disable line_length
struct ExamCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ExamCellView(examCell: ExamCellViewModel(ExamItem(block: "K106", subject: "KU", teacher: "BOR", lessons: "3.-4.", crossed: false, lines: nil, type: "entry", date: "08.03.2022", timestamp: 1646694000, grade: 10)))
            ExamCellView(examCell: ExamCellViewModel(ExamItem(block: "K106", subject: "KU", teacher: "BOR", lessons: "3.-4.", crossed: true, lines: nil, type: "entry", date: "08.03.2022", timestamp: 1646694000, grade: 10)))
            ExamCellView(examCell: ExamCellViewModel(ExamItem(block: nil, subject: nil, teacher: nil, lessons: nil, crossed: nil, lines: ["keine Klausuren in EF", "", "", ""], type: "spanned", date: "09.03.2022", timestamp: 1646780400, grade: 10)))
            ExamCellView(examCell: ExamCellViewModel(ExamItem(block: nil, subject: nil, teacher: nil, lessons: nil, crossed: nil, lines: ["keine Klausuren in EF blabla bla ich bin doch nicht blöd oder etwa doch", "WIE SIEHT DAS DENN HGIER AUS", "mannometer es kann halt nicht wahr sein oder", "HELLO SWIFTUI"], type: "spanned", date: "09.03.2022", timestamp: 1646780400, grade: 10)))
        }
    }
}
#endif
