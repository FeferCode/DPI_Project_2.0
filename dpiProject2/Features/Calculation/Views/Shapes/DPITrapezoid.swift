import SwiftUI

struct DPITrapezoid: Shape {
    let topWidth: CGFloat
    let bottomWidth: CGFloat
    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        Path { path in
            let height = rect.height
            let maxWidth = rect.width

            // Ensure widths don't exceed rectangle bounds
            let actualTopWidth = min(topWidth, maxWidth)
            let actualBottomWidth = min(bottomWidth, maxWidth)

            // Calculate offsets to center the trapezoid
            let topOffset = (maxWidth - actualTopWidth) / 2
            let bottomOffset = (maxWidth - actualBottomWidth) / 2

            // Create the points for the trapezoid
            let topLeft = CGPoint(x: topOffset, y: 0)
            let topRight = CGPoint(x: topOffset + actualTopWidth, y: 0)
            let bottomRight = CGPoint(x: bottomOffset + actualBottomWidth, y: height)
            let bottomLeft = CGPoint(x: bottomOffset, y: height)

            // Start drawing the path
            path.move(to: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y))

            // Top edge with rounded corners
            path.addLine(to: CGPoint(x: topRight.x - cornerRadius, y: topRight.y))
            path.addArc(center: CGPoint(x: topRight.x - cornerRadius, y: topRight.y + cornerRadius),
                       radius: cornerRadius,
                       startAngle: Angle(degrees: -90),
                       endAngle: Angle(degrees: 0),
                       clockwise: false)

            // Right edge
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - cornerRadius))
            path.addArc(center: CGPoint(x: bottomRight.x - cornerRadius, y: bottomRight.y - cornerRadius),
                       radius: cornerRadius,
                       startAngle: Angle(degrees: 0),
                       endAngle: Angle(degrees: 90),
                       clockwise: false)

            // Bottom edge
            path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y))
            path.addArc(center: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y - cornerRadius),
                       radius: cornerRadius,
                       startAngle: Angle(degrees: 90),
                       endAngle: Angle(degrees: 180),
                       clockwise: false)

            // Left edge
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + cornerRadius))
            path.addArc(center: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y + cornerRadius),
                       radius: cornerRadius,
                       startAngle: Angle(degrees: 180),
                       endAngle: Angle(degrees: 270),
                       clockwise: false)

            path.closeSubpath()
        }
    }
}

#Preview {
    DPITrapezoid(
        topWidth: 140,
        bottomWidth: 210,
        cornerRadius: 20
    ).frame(width: 300, height: 150)
        .foregroundColor(.blue)
}
