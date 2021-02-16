//
//  ActivityIndicator.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  
  func makeUIView(
    context: UIViewRepresentableContext<ActivityIndicator>
  ) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: .large)
  }
  
  func updateUIView(
    _ uiView: UIActivityIndicatorView,
    context: UIViewRepresentableContext<ActivityIndicator>
  ) {
    uiView.startAnimating()
  }
  
}
