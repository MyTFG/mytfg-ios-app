//
//  EventCellView.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import SwiftUI

struct EventCellView: View {
    @ObservedObject var viewModel: EventCellViewModel

    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 3.0) {
                Text(viewModel.getDayOfWeek)
                    .font(.body)
                Text(viewModel.getDay)
                    .font(.title)
                Text(viewModel.getMonth)
                    .font(.body)
            }
            .frame(width: 60, alignment: .center)

            VStack(alignment: .leading) {
                Text(viewModel.getTitle)
                    .font(.headline)
                    .fontWeight(.semibold)

                if viewModel.hasText {
                    Text(viewModel.getText)
                        .font(.body)
                }
            }
        }
    }
}

#if DEBUG
struct NewsViewCell_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable line_length
        EventCellView(viewModel: EventCellViewModel(
            EventModel(title: "Gottesdienst für die 8. Klassen orem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", startTimestamp: 1633104334, endTimestamp: 1633104334)))
    }
}
#endif
