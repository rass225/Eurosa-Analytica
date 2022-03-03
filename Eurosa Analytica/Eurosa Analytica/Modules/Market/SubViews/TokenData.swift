import SwiftUI

extension Market {
    struct MarketTokenData: View {
        
        let price: Double
        let data: Double?
        var isGainer: Bool = false
        
        var body: some View {
            VStack(alignment: .trailing, spacing: 4){
                priceFormatter(price: price)
                    .font(Eurosa.Fonts.body)
                    .foregroundColor(.black)
                if isGainer {
                    if let priceChange = data {
                        if priceChange > 0 {
                            Text("\(priceChange, specifier: "%.2f")%")
                                .foregroundColor(Eurosa.Colors.green3)
                                .font(Eurosa.Fonts.caption2)
                        } else {
                            Text("\(priceChange, specifier: "%.2f")%")
                                .foregroundColor(Eurosa.Colors.red)
                                .font(Eurosa.Fonts.caption2)
                        }
                    }
                } else {
                    if let marketCap = data {
                        Text("$\(Int(marketCap))")
                            .font(Eurosa.Fonts.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        
        func priceFormatter(price: Double) -> Text {
            if price < 0.000000000001 {
                return Text("$\(price, specifier: "%.14f")")
            } else if price < 0.00000000001 {
                return Text("$\(price, specifier: "%.13f")")
            } else if price < 0.0000000001 {
                return Text("$\(price, specifier: "%.12f")")
            } else if price < 0.000000001 {
                return Text("$\(price, specifier: "%.11f")")
            } else if price < 0.00000001 {
                return Text("$\(price, specifier: "%.10f")")
            } else if price < 0.0000001 {
                return Text("$\(price, specifier: "%.10f")")
            } else if price < 0.0000001 {
                return Text("$\(price, specifier: "%.9f")")
            } else if price < 0.000001 {
                return Text("$\(price, specifier: "%.8f")")
            } else if price < 0.00001 {
                return Text("$\(price, specifier: "%.7f")")
            } else if price < 0.0001 {
                return Text("$\(price, specifier: "%.6f")")
            } else if price < 0.001 {
                return Text("$\(price, specifier: "%.5f")")
            } else if price < 0.01 {
                return Text("$\(price, specifier: "%.4f")")
            } else if price < 0.1 {
                return Text("$\(price, specifier: "%.3f")")
            }
            else {
                return Text("$\(price, specifier: "%.2f")")
            }
        }
    }
}


