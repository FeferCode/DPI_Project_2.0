import SwiftUI

struct DPIMonitorView: View {
    @State var width: CGFloat
    @State var height: CGFloat

    let color = LinearGradient(
        colors: [MainTabItems.calculations.selectedColor.opacity(0.25),
                 MainTabItems.calculations.selectedColor.opacity(0.75)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    let color2 = LinearGradient(
        colors: [MainTabItems.home.selectedColor.opacity(0.25),
                 MainTabItems.home.selectedColor.opacity(0.75)],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )

    var body : some View {
        VStack {
            ZStack {
                DPIRectangle(cornerRadius: 25)
                    .fill(color)
                    .frame(width: 340, height: 120)
                DPIRectangle(cornerRadius: 25)
                    .fill(color)
                    .frame(width: 320, height: 100)
            }
            DPITrapezoid(
                topWidth: 30,
                bottomWidth: 60,
                cornerRadius: 5
            ).fill(color)
                .padding(.top, -5)
            .frame(width: 60, height: 40)
        }
    }
}

#Preview {
    DPIMonitorView(width: 210, height: 100)
}
