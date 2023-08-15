//
//  AboutView.swift
//  MyTFG
//
//  Created by Jakob Handke on 09.12.21.
//

import SwiftUI
import ConfettiSwiftUI

struct AboutView: View {
    @State private var confettiCounter = 0

    var body: some View {
        VStack {
            Spacer()
            Image("MyTFG-Ball")
                .onTapGesture(count: 5) {
                    confettiCounter += 1
                }
                .confettiCannon(counter: $confettiCounter,
                                num: 250,
                                confettiSize: 10.0,
                                openingAngle: Angle(degrees: 0),
                                closingAngle: Angle(degrees: 360),
                                radius: 180)
            Spacer()
            Text("MyTFG App iOS")
                .padding(.bottom)
            Text("© 2023 Jakob Handke")
            Text("Theodor-Fliedner-Gymnasium")
            Spacer()
        }
        .navigationTitle("Über diese App")
    }
}

#if DEBUG
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
#endif
