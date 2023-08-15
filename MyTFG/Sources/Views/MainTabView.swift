//
//  MainTabView.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject private var viewModel: MainTabViewModel = MainTabViewModel.shared

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            EventsView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Start")
                }
                .tag(MainTabViewState.events)
            VPlanViewToday()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("VPlan heute")
                }
                .tag(MainTabViewState.vplanToday)
            VPlanViewTomorrow()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("VPlan morgen")
                }
                .tag(MainTabViewState.vplanTomorrow)
            VRRView()
                .tabItem {
                    Image(systemName: "tram")
                    Text("Abfahrtszeiten")
                }
                .tag(MainTabViewState.vrr)
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Mehr")
                }
                .tag(MainTabViewState.more)
        }
        .accentColor(.mytfgOrange)
    }
}

#if DEBUG
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
#endif
