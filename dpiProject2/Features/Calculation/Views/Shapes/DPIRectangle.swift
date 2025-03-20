import SwiftUI

struct DPIRectangle: Shape {
    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height

            // Ensure corner radius doesn't exceed half the smaller dimension
            let actualRadius = min(cornerRadius, min(width, height) / 2)

            // Start at top-left corner (after radius)
            path.move(to: CGPoint(x: actualRadius, y: 0))

            // Top edge and top-right corner
            path.addLine(to: CGPoint(x: width - actualRadius, y: 0))
            path.addArc(
                center: CGPoint(x: width - actualRadius, y: actualRadius),
                radius: actualRadius,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )

            // Right edge and bottom-right corner
            path.addLine(to: CGPoint(x: width, y: height - actualRadius))
            path.addArc(
                center: CGPoint(x: width - actualRadius, y: height - actualRadius),
                radius: actualRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )

            // Bottom edge and bottom-left corner
            path.addLine(to: CGPoint(x: actualRadius, y: height))
            path.addArc(
                center: CGPoint(x: actualRadius, y: height - actualRadius),
                radius: actualRadius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )

            // Left edge and top-left corner
            path.addLine(to: CGPoint(x: 0, y: actualRadius))
            path.addArc(
                center: CGPoint(x: actualRadius, y: actualRadius),
                radius: actualRadius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )

            path.closeSubpath()
        }
    }
}



#Preview {
    DPIRectangle(cornerRadius: 25)
        .frame(width: 200, height: 150)
        .foregroundColor(.blue)
}

