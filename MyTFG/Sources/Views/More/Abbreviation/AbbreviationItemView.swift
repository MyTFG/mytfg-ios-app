//
//  AbbreviationItemView.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import SwiftUI

struct AbbreviationItemView: View {
    @ObservedObject var viewModel: AbbreviationItemViewModel

    var body: some View {
        HStack {
            Text(viewModel.getName)
            Spacer()
            Text(viewModel.getAbbreviation)
        }
    }
}

#if DEBUG
struct AbbreviationItemView_Previews: PreviewProvider {
    static var previews: some View {
        AbbreviationItemView(viewModel: AbbreviationItemViewModel(Abbreviation(abbreviation: "Kurz", name: "Lang")))
    }
}
#endif
