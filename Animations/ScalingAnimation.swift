//
//  ScalingAnimation.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct ScalingAnimation: View {
  @State private var scale: CGFloat = 1.0
    var body: some View {
      Image(systemName: "star.fill")
        .foregroundStyle(Color.yellow)
        .font(.system(size: 50))
        .scaleEffect(scale)

      Slider(value: $scale, in: 0.5...3)

      Button("Pulse") {
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
          scale = 2.0
        }
      }
    }
}

#Preview {
    ScalingAnimation()
}
