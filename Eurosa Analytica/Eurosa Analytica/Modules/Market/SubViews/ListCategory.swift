import SwiftUI

extension Market {
    struct MarketListCategory: View {
        
        @Binding var tabSelection: Market.MarketTabs
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16){
                    Button(action: {
                        tabSelection = .all
                    }) {
                        Text("ALL COINS")
                            .opacity(tabSelection == .all ? 1 : 0.7)
                    }
                    Button(action: {
                        tabSelection = .new
                    }) {
                        Text("NEW COINS")
                            .opacity(tabSelection == .new ? 1 : 0.7)
                    }
                    Button(action: {
                        tabSelection = .trending
                    }) {
                        Text("TRENDING")
                            .opacity(tabSelection == .trending ? 1 : 0.7)
                    }
                    Button(action: {
                        tabSelection = .gainers
                    }) {
                        Text("GAINERS")
                            .opacity(tabSelection == .gainers ? 1 : 0.7)
                    }
                    Button(action: {
                        tabSelection = .losers
                    }) {
                        Text("LOSERS")
                            .opacity(tabSelection == .losers ? 1 : 0.7)
                    }
                    Button(action: {
                        tabSelection = .mostVisited
                    }) {
                        Text("MOST VISITED")
                            .opacity(tabSelection == .mostVisited ? 1 : 0.7)
                    }
                }
                
                .font(Eurosa.Fonts.caption.weight(.medium))
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            .padding(.bottom, 10)
            .background(Eurosa.Colors.blue1)
        }
    }
}

