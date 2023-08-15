//
//  CenteredScrollView.swift
//  MyTFG
//
//  Created by Jakob Handke on 28.08.22.
//

import SwiftUI

/// Custom vertical scroll view with centered content vertically
struct CenteredScrollView<Content>: View where Content: View {
  @ViewBuilder let content: Content

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        content
          .frame(width: geometry.size.width)
          .frame(minHeight: geometry.size.height)
      }
    }
  }
}
