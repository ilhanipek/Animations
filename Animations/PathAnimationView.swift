//
//  PathAnimationView.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct PathAnimationView: View {
  @State private var pathProgress: CGFloat = 0
    var body: some View {
      VStack {
        ZStack {
          Path { path in
            path.move(to: CGPoint(x: 50, y: 50))
            path.addCurve(to: CGPoint(x: 300, y: 50),
                          control1: CGPoint(x: 100, y: 200),
                          control2: CGPoint(x: 250, y: -50))
          }
          .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [5]))

          Circle()
            .fill(.red)
            .frame(width: 20, height: 20, alignment: .center)
            .offset(x: -10, y: -10)
            .position(position(for: pathProgress))
        }
        .frame(width: 350, height: 250, alignment: .center)
      }

      Button("Animate") {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
          print(pathProgress)
          pathProgress = 1
        }
      }
    }

  func position(for progress: CGFloat) -> CGPoint {
    let path = Path { path in
      path.move(to: CGPoint(x: 50, y: 50))
      path.addCurve(to: CGPoint(x: 300, y: 50),
                    control1: CGPoint(x: 100, y: 200),
                    control2: CGPoint(x: 250, y: -50))
    }
    return path.trimmedPath(from: 0, to: progress).currentPoint ?? .zero
  }
}

#Preview {
    PathAnimationView()
}
