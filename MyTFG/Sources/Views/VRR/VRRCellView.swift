//
//  VRRCellView.swift
//  MyTFG
//
//  Created by Jakob Handke on 21.09.21.
//

import SwiftUI

struct VRRCellView: View {
    @ObservedObject var viewModel: VRRCellViewModel

    var body: some View {
        HStack {
            viewModel.getMOTImage()
                .imageScale(.large)
                .frame(width: 60, alignment: .center)

            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.getLine)
                    .font(.title2)
                Text(viewModel.getDestination)
                    .font(.title3)
                Text(viewModel.getArrival)
                    .font(.title3)
                    .foregroundColor(viewModel.getArrivalColor)
            }
            .layoutPriority(1)
        }
    }
}

#if DEBUG
struct VRRCellView_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable line_length comma
        VRRCellView(viewModel: VRRCellViewModel(model: VRRModel(scheduled: "28.09.2021 14:01", real: "28.09.2021 14:01", delay: 0, arrival: "Sofort", type: "U-Bahn", destination: "D-Uni Ost/Botanischer Garten", line: "U79", route: ["DU-Meierich Bf","Duisburg Hbf","D-Kaiserswerth","Düsseldorf Hbf","Oberbilk","D-Universität Ost"])))
    }
}
#endif
