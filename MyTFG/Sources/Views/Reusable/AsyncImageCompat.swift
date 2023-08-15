//
//  AsyncImageCompat.swift
//  MyTFG
//
//  Created by Jakob Handke on 25.02.22.
//

import Foundation
import SwiftUI

struct AsyncImageCompat<Content: View>: View {
    let url: URL?
    let scale: CGFloat
    let transaction: Transaction
    @ViewBuilder let content: (AsyncImagePhaseCompat) -> Content

    @State private var phase: AsyncImagePhaseCompat = .empty

    private let secretService = SecretService()

    init(url: URL?, scale: CGFloat = 1) where Content == Image {
        self.init(url: url, scale: scale) { phase in
            phase.image ?? Image(systemName: "gearshape")
        }
    }

    init<I, P>(url: URL?,
               scale: CGFloat = 1,
               @ViewBuilder content: @escaping (Image) -> I,
               @ViewBuilder placeholder: @escaping () -> P)
    where Content == _ConditionalContent<I, P>, I: View, P: View {
        self.init(url: url, scale: scale) { phase in
            if let image = phase.image {
                content(image)
            } else {
                placeholder()
            }
        }
    }

    init(url: URL?,
         scale: CGFloat = 1,
         transaction: Transaction = Transaction(),
         @ViewBuilder content: @escaping (AsyncImagePhaseCompat) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        content(phase)
            .onAppear(perform: load)
    }

    private func load() {
        guard phase.isEmpty, let url = url, let parameters = secretService.retrieveAccount()?.authParameters else {
            return
        }

        var request = URLRequest(url: url)
        request.encodeParameters(parameters)

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data,
               let uiImage = UIImage(data: data, scale: scale) {
                withTransaction(transaction) {
                    phase = .success(Image(uiImage: uiImage))
                }
            } else if let error = error {
                withTransaction(transaction) {
                    phase = .failure(error)
                }
            }
        }.resume()
    }
}

enum AsyncImagePhaseCompat {
    case empty,
         success(Image),
         failure(Error)

    var isEmpty: Bool {
        if case .empty = self {
            return true
        } else {
            return false
        }
    }

    var image: Image? {
        if case let .success(image) = self {
            return image
        } else {
            return nil
        }
    }

    var error: Error? {
        if case let .failure(error) = self {
            return error
        } else {
            return nil
        }
    }
}
