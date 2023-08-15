//
//  LinksView.swift
//  MyTFG
//
//  Created by Jakob Handke on 16.12.21.
//

import SwiftUI

struct LinksView: View {
    @StateObject private var viewModel = LinksViewModel()

    var body: some View {
        List(viewModel.links) { link in
            Link(destination: link.url) {
                HStack {
                    link.image
                        .resizable()
                        .scaledToFill()
                        .padding(6)
                        .frame(width: 60, height: 60, alignment: .center)
                    Text(link.label)
                        .foregroundColor(.primary)
                }
            }
        }
        .navigationTitle("Links")
    }
}

#if DEBUG
struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}
#endif
