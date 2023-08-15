//
//  MyTFGApp.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import SwiftUI

@main
struct MyTFGApp: App {
    @StateObject var authStateViewModel = AuthStateViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        // override apple's shitty alerts tintColor, needed because SwiftUI's .alert has no option for coloring the actions
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color.mytfgOrange)
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(authStateViewModel)
        }
    }
}
