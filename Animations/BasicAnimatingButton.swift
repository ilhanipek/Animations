//
//  BasicAnimatingButton.swift
//  Animations
//
//  Created by ilhan serhan ipek on 12.08.2024.
//

import SwiftUI

struct BasicAnimatingButton: View {
  @State var isAnimating = false
  @State var animation: Animation
    var body: some View {
      VStack {
        Button {
          withAnimation(animation) {
            isAnimating.toggle()
          }
        } label: {
          Text("Animate")
            .foregroundStyle(Color.white)
            .padding(isAnimating ? 40 : 20)
            .background {
              RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(isAnimating ? .green : .red)
            }
        }
      }
    }
}

#Preview {
  BasicAnimatingButton(animation: .easeIn)
}
