//
//  FoerdervereinView.swift
//  MyTFG
//
//  Created by Jakob Handke on 23.02.22.
//
// swiftlint:disable line_length trailing_whitespace

import SwiftUI

struct FoerdervereinView: View {
    var body: some View {
        Form {
            Section {
                Text("""
Der Förderverein, gegründet 1956, ist ein unverzichtbarer Teil unseres Schullebens. Eine Vielzahl von kleinen und größeren Projekten konnten durch den Förderverein bereits an unserer Schule realisiert werden, die über die reguläre Unterrichtsausstattung hinausgehen und die aus den Fördertöpfen des Schulträgers oder der Schulstiftung nicht bedient werden können. Unterstützt werden alle Bereiche des schulischen Alltags. Gerne können auch Sie sich mit Ideen und Vorschlägen einbringen.

Sie sind noch kein Mitglied? Besuchen Sie unsere Homepage tfg-foerderverein.de dort können Sie sich eine Beitrittserklärung herunterladen. Wir freuen uns auf Sie!
""")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 8)
            }
            Section {
                GeometryReader { geometry in
                    TabView {
                        ForEach(1...3, id: \.self) { index in
                            Image("boosters_slide_\(index)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width)
                                .clipped()
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .frame(idealHeight: UIScreen.main.bounds.width * 0.5)
                .tabViewStyle(.page)
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
                    let url = URL(string: "mailto:info@tfg-foerderverein.de")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text(verbatim: "info@tfg-foerderverein.de")
                })
            }
            .padding(.vertical)
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    let url = URL(string: "https://tfg-foerderverein.de")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text(verbatim: "tfg-foerderverein.de")
                })
            }
            .padding(.vertical)
        }
        .navigationTitle("TFG Förderverein")
    }
}

#if DEBUG
struct FoerdervereinView_Previews: PreviewProvider {
    static var previews: some View {
        FoerdervereinView()
    }
}
#endif
