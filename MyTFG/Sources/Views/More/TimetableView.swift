//
//  TimetableView.swift
//  MyTFG
//
//  Created by Jakob Handke on 09.12.21.
//

import SwiftUI

struct TimetableView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("1. Stunde")
                    Spacer()
                    Text("07:55 - 08:40 Uhr")
                }
                HStack {
                    Text("2. Stunde")
                    Spacer()
                    Text("08:45 - 09:30 Uhr")
                }
            }

            HStack {
                Text("1. große Pause")
                Spacer()
                Text("09:30 - 09:45 Uhr")
            }

            Section {
                HStack {
                    Text("3. Stunde")
                    Spacer()
                    Text("09:45 - 10:30 Uhr")
                }
                HStack {
                    Text("4. Stunde")
                    Spacer()
                    Text("10:35 - 11:20 Uhr")
                }
            }

            HStack {
                Text("2. große Pause")
                Spacer()
                Text("11:20 - 11:35 Uhr")
            }

            Section {
                HStack {
                    Text("5. Stunde")
                    Spacer()
                    Text("11:35 - 12:20 Uhr")
                }
                HStack {
                    Text("6. Stunde")
                    Spacer()
                    Text("12:25 - 13:10 Uhr")
                }
            }

            HStack {
                Text("3. große Pause")
                Spacer()
                Text("13:10 - 13:20 Uhr")
            }

            Section {
                HStack {
                    Text("7. Stunde")
                    Spacer()
                    Text("13:20 - 14:05 Uhr")
                }
                HStack {
                    Text("8. Stunde")
                    Spacer()
                    Text("14:10 - 14:55 Uhr")
                }
                HStack {
                    Text("9. Stunde")
                    Spacer()
                    Text("15:00 - 15:45 Uhr")
                }
                HStack {
                    Text("10. Stunde")
                    Spacer()
                    Text("15:45 - 16:30 Uhr")
                }
            }
        }
        .navigationTitle("Stundentafel")
    }
}

#if DEBUG
struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimetableView()
        }
    }
}
#endif
