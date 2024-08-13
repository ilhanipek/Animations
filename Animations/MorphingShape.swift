import SwiftUI

struct MorphingShape: Shape {
    var morphProgress: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        if morphProgress < 0.5 {
          let circleProgress = 1 - (morphProgress * 2)

          let radius = min(rect.width, rect.height) / 2

          path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        } else {
            let squareProgress = (morphProgress - 0.5) * 2
            let sideLength = min(rect.width, rect.height)
            let xOffSet = (rect.width - sideLength) / 2
            let yOffSet = (rect.height - sideLength) / 2
            let cornerRadius = sideLength / 2 * squareProgress

            path.addRoundedRect(in: CGRect(x: xOffSet, y: yOffSet, width: sideLength, height: sideLength), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        }
        return path
    }
}

struct MorphingShapeView: View {
    @State private var morphProgress: Double = 0.5

    var body: some View {
        VStack {
            MorphingShape(morphProgress: morphProgress)
                .fill(.blue)
                .frame(width: 200, height: 200, alignment: .center)

            Slider(value: $morphProgress, in: 0...1, step: 0.001)

            Button("Morph") {
                withAnimation(.spring(duration: 1)) {
                    morphProgress = (morphProgress == 0.5) ? 1 : 0.5
                }
            }
        }
    }
}

#Preview {
    MorphingShapeView()
}
