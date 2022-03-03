import SwiftUI

extension Market {
    struct MarketTokenIcon: View {
        
        let id: Int
        
        var body: some View {
            AsyncImage(url: URL(string: Eurosa.Endpoints.CoinMarketCap.logo(id: id)), transaction: Transaction(animation: .spring())) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.3) .cornerRadius(20)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure(_):
                    Eurosa.Icons.error
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                @unknown default:
                    Eurosa.Icons.error
                        .cornerRadius(20)
                }
            }.frame(width: 30, height: 30)
        }
    }
}

