import SwiftUI

struct Market: View {
    
    @EnvironmentObject var manager: MarketManager
    @State var tabSelection: MarketTabs = .all
    
    enum MarketTabs {
        case all
        case new
        case trending
        case gainers
        case losers
        case mostVisited
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Eurosa.Colors.blue1.ignoresSafeArea()
                VStack(spacing: 0){
                    
                    MarketListCategory(tabSelection: $tabSelection)
                    
                    ScrollView{
                        VStack(spacing: 12){
                            switch tabSelection {
                            case .all:
                                ForEach(manager.allCcins) { item in
                                    NavigationLink(destination: CoinView(coin: item)) {
                                        ZStack(alignment: .topLeading){
                                            HStack{
                                                MarketTokenIcon(id: item.databaseId)
                                                MarketTokenName(name: item.name, platform: item.platform)
                                                Spacer()
                                                MarketTokenData(price: item.quote.usd.price, data: item.quote.usd.marketCap)
                                            }.tokenCellModifier()
                                            MarketTokenRank(rank: item.cmcRank)
                                        }
                                    }
                                }
                            case .new:
                                ForEach(manager.newCoins) { item in
                                    NavigationLink(destination: CoinView(coin: item)) {
                                        ZStack(alignment: .topLeading){
                                            HStack{
                                                MarketTokenIcon(id: item.databaseId)
                                                MarketTokenName(name: item.name, platform: item.platform)
                                                Spacer()
                                                MarketTokenData(price: item.quote.usd.price, data: item.selfReportedMarketCap)
                                            }.tokenCellModifier()
                                            MarketTokenRank(rank: item.cmcRank)
                                        }
                                    }
                                }
                            case .trending:
                                ForEach(manager.trending) { item in
                                    NavigationLink(destination: CoinView(coin: item)) {
                                        ZStack(alignment: .topLeading){
                                            HStack{
                                                MarketTokenIcon(id: item.databaseId)
                                                MarketTokenName(name: item.name, platform: item.platform)
                                                Spacer()
                                                MarketTokenData(price: item.quote.usd.price, data: item.quote.usd.marketCap)
                                            }.tokenCellModifier()
                                            MarketTokenRank(rank: item.cmcRank)
                                        }
                                    }
                                }
                            case .gainers:
                                ForEach(manager.gainers) { item in
                                    NavigationLink(destination: CoinView(coin: item)) {
                                        ZStack(alignment: .topLeading){
                                            HStack{
                                                MarketTokenIcon(id: item.databaseId)
                                                MarketTokenName(name: item.name, platform: item.platform)
                                                Spacer()
                                                MarketTokenData(price: item.quote.usd.price, data: item.quote.usd.percentChange24H, isGainer: true)
                                            }.tokenCellModifier()
                                            MarketTokenRank(rank: item.cmcRank)
                                        }
                                    }
                                }
                            case .losers:
                                ForEach(manager.losers) { item in
                                    NavigationLink(destination: CoinView(coin: item)) {
                                        ZStack(alignment: .topLeading){
                                            HStack{
                                                MarketTokenIcon(id: item.databaseId)
                                                MarketTokenName(name: item.name, platform: item.platform)
                                                Spacer()
                                                MarketTokenData(price: item.quote.usd.price, data: item.quote.usd.percentChange24H, isGainer: true)
                                            }.tokenCellModifier()
                                            MarketTokenRank(rank: item.cmcRank)
                                        }
                                    }
                                }
                            case .mostVisited:
                                ForEach(manager.mostVisited) { item in
                                    NavigationLink(destination: CoinView(coin: item)) {
                                        ZStack(alignment: .topLeading){
                                            HStack{
                                                MarketTokenIcon(id: item.databaseId)
                                                MarketTokenName(name: item.name, platform: item.platform)
                                                Spacer()
                                                MarketTokenData(price: item.quote.usd.price, data: item.quote.usd.marketCap, isGainer: false)
                                            }.tokenCellModifier()
                                            MarketTokenRank(rank: item.cmcRank)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                    }
                    .background(Color.white)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: -3)
                }
                .navigationBarModifier()
            }
           
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Eurosa.Titles.market
                        .titleModifier()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        manager.reload()
                    }) {
                        Eurosa.Icons.refresh
                            .foregroundColor(.white)
                            .font(Eurosa.Fonts.caption)
                    }
                }
            } 
        }.accentColor(.white)
    }
}


