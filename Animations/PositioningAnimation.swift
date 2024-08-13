//
//  PositioningAnimation.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct PositioningAnimation: View {
  @State private var position: CGPoint = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    var body: some View {
      GeometryReader { proxy in
        VStack {
          Circle()
            .fill(.red)
            .frame(width: 50, height: 50, alignment: .center)
            .position(position)

          Button("Move") {

            withAnimation(.spring()) {
              let randomX = CGFloat.random(in: 0...proxy.size.width)
              let randomY = CGFloat.random(in: 0...proxy.size.height)
              position = CGPoint(x: randomX, y: randomY)
            }
          }
        }
      }
    }
}

#Preview {
    PositioningAnimation()
}
