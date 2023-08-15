//
//  VPlanViewTomorrow.swift
//  MyTFG
//
//  Created by Jakob Handke on 26.08.2022.
//

import SwiftUI

struct VPlanViewTomorrow: View {
    @StateObject private var viewModel = VPlanViewModel(.tomorrow)

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
struct VPlanViewTomorrow_Previews: PreviewProvider {
    static var previews: some View {
        VPlanViewTomorrow()
            .environmentObject(AuthStateViewModel())
    }
}
#endif
