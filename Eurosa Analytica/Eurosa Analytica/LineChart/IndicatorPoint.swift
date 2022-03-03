import SwiftUI

struct IndicatorPoint: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Eurosa.Colors.blue1)
            Circle()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 4))
        }
        .frame(width: 14, height: 14)
        .shadow(color: Eurosa.Colors.blue1.opacity(0.2), radius: 6, x: 0, y: 6)
    }
}
