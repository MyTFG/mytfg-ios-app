//
//  ElternView.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//
// swiftlint:disable line_length

import SwiftUI

struct ElternView: View {
    var body: some View {
        Form {
            Section {
                Text("""
Die Elternarbeit am TFG wird geprägt durch die Vertreter der einzelnen Klassen- und Jahrgangsstufen, die durchschnittlich mit 90 Personen den Kreis der Schulpflegschaft bilden. Die dreimal pro Jahr stattfindenden Schulpflegschaftssitzungen sind das Informationsforum, in dem schulübergreifende Themen vorgestellt und diskutiert sowie Wünsche und Bedürfnisse aus den Klassen und Jahrgangsstufen gesammelt werden, die dann ggf. zu Anträgen führen, die in der Schulkonferenz - dem paritätisch besetzten obersten Entscheidungsgremium der Schule - zur Abstimmung gestellt werden.
""")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 8)
            }
            HStack {
                Image(systemName: "map")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "maps://?address=Kalkumer+Schlossallee+28,40489")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }, label: {
                    Text("""
Kalkumer Schlossallee 28
40489 Düsseldorf
""")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                })

            }
            .padding(.vertical)
            HStack {
                Image(systemName: "envelope")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "mailto:eltern@tfg-duesseldorf.de")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text(verbatim: "eltern@tfg-duesseldorf.de")
                })
            }
            .padding(.vertical)
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "https://eltern.tfg-duesseldorf.de")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text(verbatim: "eltern.tfg-duesseldorf.de")
                })
            }
            .padding(.vertical)
        }
        .navigationTitle("TFG Eltern")
    }
}

#if DEBUG
struct ElternView_Previews: PreviewProvider {
    static var previews: some View {
        ElternView()
    }
}
#endif
