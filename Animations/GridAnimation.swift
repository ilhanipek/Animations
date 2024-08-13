//
//  GridAnimation.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct GridAnimation: View {
  @State var isButtonTapped = false
  let spacing: CGFloat = 7
  var stackDistance: CGFloat { isButtonTapped ? spacing : spacing * 3 }
    var body: some View {
      ZStack {
        Color.black
          .ignoresSafeArea()
        VStack(spacing: stackDistance) {
          ForEach(0..<28) { rowIndex in
            HStack(spacing: stackDistance) {
              ForEach(0..<28) { colIndex in
                Circle()
                  .foregroundStyle(isButtonTapped ? LinearGradient(colors: [.blue,.green], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.white,.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                  .frame(width: 5, height: 5, alignment: .center)
                  .animation(.spring(response: 0.2, dampingFraction: 0.4).delay(Double(rowIndex + colIndex) * 0.06), value: isButtonTapped)
                  .opacity(isButtonTapped ? 0.8 : 1.0)
              }
            }
          }
          Button("Animate") {
            isButtonTapped.toggle()
          }
          .foregroundStyle(Color.white)
          .padding()
          .background {
            LinearGradient(colors: [.red, .yellow], startPoint: .bottomLeading, endPoint: .topLeading)
              .cornerRadius(20)
          }
          .padding(.top)
        }
      }
    }
}

#Preview {
    GridAnimation()
}
