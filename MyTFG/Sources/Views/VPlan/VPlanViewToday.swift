//
//  VPlanViewToday.swift
//  MyTFG
//
//  Created by Jakob Handke on 26.08.22.
//

import SwiftUI

struct VPlanViewToday: View {
    @StateObject private var viewModel = VPlanViewModel(.today)

    var body: some View {
        AuthenticatedView {
            VPlanListView(viewModel: viewModel)
                .overlay {
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
        }
    }
}

#if DEBUG
struct VPlanViewToday_Previews: PreviewProvider {
    static var previews: some View {
        VPlanViewToday()
            .environmentObject(AuthStateViewModel())
    }
}
#endif
