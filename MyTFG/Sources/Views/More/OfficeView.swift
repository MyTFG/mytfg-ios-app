//
//  OfficeView.swift
//  MyTFG
//
//  Created by Jakob Handke on 02.03.22.
//

import SwiftUI

struct OfficeView: View {
    var body: some View {
        Form {
            Section {
                HStack(alignment: .center, spacing: 30) {
                    Image("frau-montabon")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(maxWidth: 140)
                    Text("Frau Montabon")
                }
                .padding(.vertical, 8)
                HStack(alignment: .center, spacing: 30) {
                    Image("frau-lewe")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(maxWidth: 140)
                    Text("Frau Lewe")
                }
                .padding(.vertical, 8)
            }
            Section {
                HStack {
                    Image(systemName: "clock")
                        .imageScale(.large)
                        .frame(width: 50, alignment: .center)
                    Text("08:00 Uhr bis 16:00 Uhr")
                }
                .padding(.vertical)
                HStack {
                    Image(systemName: "envelope")
                        .imageScale(.large)
                        .frame(width: 50, alignment: .center)
                    Button(action: {
                        let url = URL(string: "mailto:info@tfg-duesseldorf.de")!
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }, label: {
                        Text(verbatim: "info@tfg-duesseldorf.de")
                    })
                }
                .padding(.vertical)
                HStack {
                    Image(systemName: "phone")
                        .imageScale(.large)
                        .frame(width: 50, alignment: .center)
                    Button(action: {
                        let url = URL(string: "tel:00492119405701")!
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }, label: {
                        Text(verbatim: "+49 211 9405701")
                    })
                }
                .padding(.vertical)
                HStack {
                    Image(systemName: "faxmachine")
                        .imageScale(.large)
                        .frame(width: 50, alignment: .center)
                    Text("+49 211 9405747")
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Sekretariat")
    }
}

#if DEBUG
struct OfficeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OfficeView()
        }
    }
}
#endif
