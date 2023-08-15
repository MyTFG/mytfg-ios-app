//
//  AuthenticatedView.swift
//  MyTFG
//
//  Created by Jakob Handke on 25.02.22.
//

import SwiftUI

struct AuthenticatedView<Content: View>: View {
    @EnvironmentObject var authStateViewModel: AuthStateViewModel

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            if authStateViewModel.isLoggedIn {
                content
            } else {
                LoginView(authStateViewModel: authStateViewModel)
            }
        }
        .animation(.easeInOut, value: authStateViewModel.isLoggedIn)
        .transition(.opacity)
    }
}
