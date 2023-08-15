//
//  AdditionalClassesView.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//

import SwiftUI

struct AdditionalClassesView: View {
    @StateObject private var viewModel: AdditionalClassesViewModel = AdditionalClassesViewModel()

    var body: some View {
        AuthenticatedView {
            if viewModel.errorMessage == "" {
                addidtionalClassesList
            } else {
                MessageView(message: viewModel.errorMessage) {
                    viewModel.onRefresh()
                }
            }
        }
    }

    var addidtionalClassesList: some View {
        List(viewModel.availableClasses, id: \.self) { cls in
            HStack {
                Text(cls)
                    .font(.body)
                    .modifier(CheckmarkModifier(checked: viewModel.selectedClasses.contains(cls)))
            }
            .padding(.vertical, 4)
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.onTapAction(cls: cls)
            }
        }
        .animation(.easeInOut, value: viewModel.availableClasses.count)
        .navigationTitle("Zusätzliche Klassen")
        .toolbar {
            ZStack(alignment: .center) {
                if viewModel.isSendingAbos {
                    ProgressView()
                        .transition(.opacity)
                } else {
                    Button("Speichern") {
                        viewModel.saveButtonAction()
                    }
                    .disabled(viewModel.saveButtonDisabled)
                    .transition(.opacity)
                }
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.alertPresented) {
            Button(action: {
                viewModel.alertPresented = false
            }, label: {
                Text("Ok")
            })
        }
    }
}

struct CheckmarkModifier: ViewModifier {
    var checked: Bool = false
    func body(content: Content) -> some View {
        Group {
            if checked {
                HStack {
                    content
                    Spacer()
                    Image(systemName: "checkmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.mytfgOrange)
                }
            } else {
                HStack {
                    content
                    Spacer()
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(.mytfgOrange)
                }
            }
        }
    }
}

#if DEBUG
struct AdditionalClassesView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalClassesView()
            .environmentObject(AuthStateViewModel())
    }
}
#endif
