//
//  RotationAnimation.swift
//  Animations
//
//  Created by ilhan serhan ipek on 12.08.2024.
//

import SwiftUI

struct RotationAnimation: View {
  @State private var angle: Double = 0
  var body: some View {
    VStack {
      Rectangle()
        .fill(.green)
        .frame(width: 100, height: 100, alignment: .center)
        .rotationEffect(.degrees(angle))
      Slider(value: $angle, in: 0...360, step: 1)
      Text("\(Int(angle))")
      Button("Spin") {
        withAnimation(.linear(duration: 1)) {
          if angle != 0 {
            let completer = 360 - angle
            angle = angle + completer
          } else {
            withAnimation(.linear(duration: 1)) {
              angle += 360
            }
          }
        }
      }
    }
  }
}

#Preview {
  RotationAnimation()
}
