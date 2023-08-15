//
//  LoginView.swift
//  MyTFG
//
//  Created by Jakob Handke on 03.11.21.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""

    @FocusState private var isUsernameFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @ObservedObject var authStateViewModel: AuthStateViewModel

    var body: some View {
        Form {
            HStack(alignment: .center) {
                Text("Bitte mit den MyTFG-Zugangsdaten anmelden:")
                    .font(.headline)
                Spacer()
                Image("MyTFG-Ball")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 70)
            }
            VStack(alignment: .leading, spacing: 16) {
                TextField("Benutzername", text: $username) {
                    isUsernameFocused = false
                    isPasswordFocused = true
                }
                .textContentType(.username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .submitLabel(.next)
                .textContentType(.username)
                .textFieldStyle(.roundedBorder)
                .font(.body)
                .focused($isUsernameFocused)

                SecureField("Passwort", text: $password) {
                    authStateViewModel.doLogin(username: username, password: password)
                }
                .textContentType(.password)
                .submitLabel(.join)
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
                .font(.body)
                .focused($isPasswordFocused)

                HStack {
                    Spacer()
                    if authStateViewModel.isLoggingIn {
                        ProgressView()
                            .padding([.bottom, .trailing])
                    }
                    Button("Anmelden") {
                        authStateViewModel.doLogin(username: username, password: password)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)

                }
            }
            .listRowSeparator(.hidden)
            if authStateViewModel.errorMessage != "" {
                Section {
                    HStack {
                        Text(authStateViewModel.errorMessage)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authStateViewModel: AuthStateViewModel())
    }
}
#endif
