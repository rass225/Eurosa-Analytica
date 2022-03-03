import SwiftUI

extension Market {
    struct MarketTokenRank: View {
        let rank: Int?
        
        var body: some View {
            Text("\(rank ?? 0)")
                .font(.caption2)
                .foregroundColor(Eurosa.Colors.gray)
                .padding([.leading, .top], 4)
        }
    }
}

