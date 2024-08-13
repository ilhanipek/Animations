//
//  3DRotationAnimation.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct _DRotationAnimation: View {
  @State private var degrees: (x: Double, y: Double, z: Double) = (0, 0, 0)
    var body: some View {
      VStack {
        Text("3D Flip")
          .foregroundStyle(Color.white)
          .padding()
          .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(Color.orange))
          .rotation3DEffect(
            Angle(degrees: degrees.x),
                                  axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .rotation3DEffect(
            Angle(degrees: degrees.y),
                                  axis: (x: 0.0, y: 1.0, z: 0.0))
          .rotation3DEffect(
            Angle(degrees: degrees.z),
                                  axis: (x: 0.0, y: 0.0, z: 1.0))

        VStack {
          Text("X Slider")
          Slider(value: $degrees.x, in: 0...360, step: 1)
            .safeAreaPadding(.horizontal)
        }
        .padding(.top)
        
        VStack {
          Text("Y Slider")
          Slider(value: $degrees.y, in: 0...360, step: 1)
            .safeAreaPadding(.horizontal)
        }
        .padding(.top)

        VStack {
          Text("Z Slider")
          Slider(value: $degrees.z, in: 0...360, step: 1)
            .safeAreaPadding(.horizontal)
        }
        .padding(.top)

        Button("Reset") {
          withAnimation(.spring(duration: 1.2, bounce: 0.3)) {
            degrees = (0, 0, 0)
          }
        }
        .padding(.top)
      }
    }
}

#Preview {
    _DRotationAnimation()
}
