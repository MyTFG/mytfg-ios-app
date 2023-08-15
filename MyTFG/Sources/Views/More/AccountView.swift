//
//  AccountView.swift
//  MyTFG
//
//  Created by Jakob Handke on 11.12.21.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authStateViewModel: AuthStateViewModel

    var body: some View {
        AuthenticatedView {
            accountViewContent
        }
    }

    var accountViewContent: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    AsyncImageCompat(url: authStateViewModel.avatarURL,
                                     transaction: .init(animation: .easeInOut)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(.circular)
                                .transition(.opacity)
                                .frame(width: 200, height: 200, alignment: .center)
                        case .failure:
                            Text("Avatar konnte nicht geladen werden.")
                                .foregroundColor(.red)
                        case .success(let image):
                            image
                                .resizable()
                                .cornerRadius(8)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
                    Spacer()
                }
                HStack {
                    Text("Vorname")
                    Spacer()
                    Text(authStateViewModel.firstName)
                }
                HStack {
                    Text("Nachname")
                    Spacer()
                    Text(authStateViewModel.lastName)
                }
                HStack {
                    Text("Nutzername")
                    Spacer()
                    Text(authStateViewModel.username)
                }
                HStack {
                    Text("Klasse")
                    Spacer()
                    Text(authStateViewModel.grade)
                }
            }
            Section {
                HStack {
                    Spacer()
                    Button("Logout") {
                        authStateViewModel.doLogout()
                    }
                    .foregroundColor(Color.red)
                    Spacer()
                }
            }
            if authStateViewModel.errorMessage == "" {
                sessionList
            } else {
                Section {
                    HStack {
                        Text(authStateViewModel.errorMessage)
                    }
                    HStack {
                        Spacer()
                        Button(action: authStateViewModel.onRefresh) {
                            Image(systemName: "arrow.clockwise")
                        }
                        Spacer()
                    }
                }
            }
        }
        .refreshable {
            authStateViewModel.loadSessions()
        }
        .animation(.easeInOut, value: authStateViewModel.activeSessions.count)
        .onAppear {
            authStateViewModel.loadSessions()
        }
        .navigationTitle("Account")
    }

    var sessionList: some View {
        ForEach(authStateViewModel.activeSessions, id: \.id) { session in
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(session.getDeviceName)
                            .lineLimit(.max)
                        Spacer()
                        if session.isThisDevice {
                            Text("dieses Gerät")
                        }
                    }
                    .padding(.top, 8)
                    Text(session.getDeviceDescription)
                    HStack {
                        Text("Zuletzt benutzt:")
                        Spacer()
                        Text(session.getLastUsed)
                    }
                    HStack {
                        Text("Gültig bis:")
                        Spacer()
                        Text(session.getTimeoutDate)
                    }
                    .padding(.bottom, 8)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    if !session.isThisDevice {
                        Button("Abmelden") {
                            authStateViewModel.deleteSession(sessionItemViewModel: session)
                        }
                        .tint(.red)
                    }
                }
            }
        }
        .overlay {
            if authStateViewModel.isLoadingSessions {
                ProgressView()
            }
        }
    }
}

#if DEBUG
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AuthStateViewModel())
    }
}
#endif
