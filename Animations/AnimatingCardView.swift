//
//  AnimatingCardView.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct AnimatingCardView: View {
  @State private var dragOffSet: CGSize = .zero
  @State private var isDragging = false
    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .fill(
            LinearGradient(colors: [.green, .gray,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
          )
          .frame(width: 300, height: 200, alignment: .center)
          .shadow(radius: 15)

        ZStack {
          RoundedRectangle(cornerRadius: 20)
            .fill(
              .black.gradient
            )
            .frame(width: 300, height: 200, alignment: .center)
          Text("Gradient").font(.title).underline()
        }
        .overlay {
          RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 1)
            .foregroundStyle(Color.gray)
        }
        .rotation3DEffect(
          Angle
          .degrees(dragOffSet.width),
                                axis: (x: 1.0, y: 0.0, z: 0.0)
        )
        .rotation3DEffect(
          .degrees(dragOffSet.height),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
        )
      }
      .gesture(DragGesture().onChanged({ value in
        isDragging = true
        dragOffSet = value.translation
      }).onEnded({ _ in
        withAnimation(.spring(duration: 1)) {
          dragOffSet = .zero
        }
      }))
    }
}

#Preview {
    AnimatingCardView()
}
