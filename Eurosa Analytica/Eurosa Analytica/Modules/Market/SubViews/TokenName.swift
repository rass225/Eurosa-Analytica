import SwiftUI

extension Market {
    struct MarketTokenName: View {
        let name: String
        let platform: Platform?
        
        var body: some View {
            VStack(alignment: .leading){
                Text(name)
                    .font(Eurosa.Fonts.callout)
                    .foregroundColor(.black)
                if let platform = platform {
                    Text(platform.symbol)
                        .font(Eurosa.Fonts.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
