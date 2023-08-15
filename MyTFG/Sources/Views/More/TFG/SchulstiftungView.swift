//
//  SchulstiftungView.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//
// swiftlint:disable line_length

import SwiftUI

struct SchulstiftungView: View {
    var body: some View {
        Form {
            Section {
                Text("""
Viele Schülerinnen und Schüler besuchen die elf Bildungseinrichtungen der Schulstiftung der Evangelischen Kirche im Rheinland. Damit werden einzigartige Talente gefördert. Das Anliegen der Schulstiftung ist es, den perfekten Rahmen für diese wertvolle Talentförderung zu bieten. (siehe aktuelle Projekte) Möglichkeiten dafür gibt es viele, denn gute Lernbedingungen hängen nicht nur vom Inhalt des Unterrichts ab, sondern werden auch von den äußeren Gegebenheiten mitbestimmt. Auf unserer Seite bekommen Sie einen Überblick über die verschiedenen Aktionen und Projekte, die die Schulen in Zusammenarbeit mit der Schulstiftung planen oder durchgeführt haben. Außerdem spielen Zahlen bei uns eine große Rolle. Denn durch diese Seite möchten wir die Finanzierung dieser Projekte vorantreiben. Deshalb schwingt in den Berichten immer auch eine große Bitte an Sie mit: Werden Sie ebenfalls Unterstützer von unseren vielen Talenten und werden Sie damit Teil der Schulstiftung und Förderer von jungen Menschen.
""")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 8)
            }
            HStack {
                Image(systemName: "map")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "maps://?address=Hans-Boeckler-Strasse+8,40476")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }, label: {
                    Text("""
Hans-Böckler-Straße 7
40476 Düsseldorf
""")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                })

            }
            .padding(.vertical)
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "https://schulstiftung.ekir.de")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text(verbatim: "schulstiftung.ekir.de")
                })
            }
            .padding(.vertical)
            HStack {
                Image(systemName: "phone")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "tel:00492114562633")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text(verbatim: "+49 211 4562 633")
                })
            }
            .padding(.vertical)
        }
        .navigationTitle("TFG Schulstiftung")
    }
}

#if DEBUG
struct SchulstiftungView_Previews: PreviewProvider {
    static var previews: some View {
        SchulstiftungView()
    }
}
#endif
