//
//  MessageView.swift
//  MyTFG
//
//  Created by Jakob Handke on 26.08.22.
//

import SwiftUI

struct MessageView: View {
    let message: String
    let action: () -> Void

    var body: some View {
        Form {
            Text(message)
            HStack {
                Spacer()
                Button(action: action) {
                    Image(systemName: "arrow.clockwise")
                }
                Spacer()
            }
        }
    }
}

#if DEBUG
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "Testnachricht", action: {  })
    }
}
#endif
