//
//  VPlanAdditionalView.swift
//  MyTFG
//
//  Created by Jakob Handke on 30.08.22.
//

import SwiftUI

struct VPlanInfoView: View {
    @Environment(\.dismiss) var dismiss

    var lastUpdate: String
    var marquee: [String]
    var absentEntries: [VPlanAbsent]

    var body: some View {
        NavigationView {
            Form {
                if lastUpdate != "" {
                    Section("Letztes Update") {
                        Text(lastUpdate)
                    }
                }
                if marquee.count > 0 {
                    Section("Nachrichten") {
                        ForEach(marquee, id: \.self) { entry in
                            Text(entry)
                        }
                    }
                }

                if absentEntries.count > 0 {
                    Section("abwesende Lehrpersonen") {
                        ForEach(absentEntries) { entry in
                            HStack {
                                Text(entry.teacherName)
                                Spacer()
                                Text(entry.absentLessons)
                            }
                        }
                    }
                }
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Fertig")
                }
            }
        }
    }
}

#if DEBUG
struct VPlanAdditionalView_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable line_length
        VPlanInfoView(lastUpdate: "Do. 22. Sept. 10:14", marquee: ["heute keine Einträge", "oder vielleicht doch ein etwas längerer Eintrag?"], absentEntries: [VPlanAbsent(teacherName: "Jürgen Prochnow", absentLessons: "1.-3."), VPlanAbsent(teacherName: "Karl May", absentLessons: "ganztägig")])
    }
}
#endif
