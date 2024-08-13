//
//  CardAnimations.swift
//  Animations
//
//  Created by ilhan serhan ipek on 13.08.2024.
//

import SwiftUI

struct CardAnimations: View {
    var body: some View {
      ZStack {
        Color.backgroundBlue
          .opacity(0.85)
          .ignoresSafeArea()
        Circle()
        .stroke(lineWidth: 1)
        .foregroundStyle(Color.gray)
        .frame(width: 300, height: 300, alignment: .center)
      }
    }
}

#Preview {
    CardAnimations()
}
