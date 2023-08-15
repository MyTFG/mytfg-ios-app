//
//  MoreView.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            List {
                Group { // @ViewBuilder only takes 10 arguments, so we are splitting them up into groups
                    NavigationLink(destination: ExamsView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "calendar.badge.clock")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Klausurplan")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: AbbreviationView(.teachers)) {
                        HStack(alignment: .center) {
                            Image(systemName: "person.3")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Lehrpersonenkürzel")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: AbbreviationView(.subjects)) {
                        HStack(alignment: .center) {
                            Image(systemName: "book")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Fächerkürzel")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: LostAndFoundView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "questionmark")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Fundsachen")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: TimetableView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "clock")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Stundentafel")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: OfficeView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "paperclip")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Sekretariat")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                }
                Group {
                    NavigationLink(destination: LinksView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "link")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Links")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: AdditionalClassesView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "rectangle.stack.badge.plus")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Zusätzliche Klassen")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: AccountView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "person")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Account")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: ElternView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "circles.hexagonpath")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("TFG Eltern")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: FoerdervereinView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "figure.wave") // tray graduationcap archivebox
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("TFG Förderverein")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: SchulstiftungView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "rosette")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("TFG Schulstiftung")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                    NavigationLink(destination: AboutView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "info")
                                .imageScale(.large)
                                .frame(width: 60, alignment: .center)
                            Text("Über diese App")
                        }
                        .frame(height: 50, alignment: .center)
                    }
                }
            }
            .navigationBarTitle(Text("Mehr"))
        }
        .navigationViewStyle(.stack)
    }
}

#if DEBUG
struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
            .preferredColorScheme(.light)
        MoreView()
            .preferredColorScheme(.dark)
    }
}
#endif
