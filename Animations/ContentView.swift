//
//  ContentView.swift
//  Animations
//
//  Created by ilhan serhan ipek on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ScrollView {
        VStack {
          Text("Basic Animations")
            .font(.title)
          BasicAnimatingButton(animation: .default)
          BasicAnimatingButton(animation: .linear)
          BasicAnimatingButton(animation: .easeIn)
          BasicAnimatingButton(animation: .easeOut)
          BasicAnimatingButton(animation: .easeInOut)
          BasicAnimatingButton(animation: .spring)
          Divider()
        }

      }


      .padding()
    }
}

#Preview {
  ContentView()
}
