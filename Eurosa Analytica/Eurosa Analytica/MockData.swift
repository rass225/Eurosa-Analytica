import Foundation
import SwiftUI

let tokens: [Tokens] = [
    Tokens(name: "Bitcoin", value: 765000, amount: 17.8, image: "BTC"),
    Tokens(name: "Ethereum", value: 369000, amount: 122.9, image: "Ethereum"),
    Tokens(name: "Cardano", value: 189000, amount: 164000, image: "Cardano"),
    Tokens(name: "XRP", value: 76000, amount: 96200, image: "XRP"),
    Tokens(name: "Chainlink", value: 40000, amount: 2274, image: "Chainlink"),
    Tokens(name: "Matic", value: 639000, amount: 341711, image: "Matic"),
    Tokens(name: "Polkadot", value: 120000, amount: 99, image: "Polkadot"),
    Tokens(name: "Solana", value: 110000, amount: 99, image: "Solana"),
    Tokens(name: "Avalanche", value: 100000, amount: 99, image: "Avalanche"),
    Tokens(name: "Vechain", value: 100000, amount: 99, image: "Vechain"),
    Tokens(name: "Terra", value: 100000, amount: 99, image: "Terra"),
    Tokens(name: "Harmony", value: 100000, amount: 99, image: "Harmony")
    
]

struct Tokens: Identifiable {
    var id = UUID()
    let name: String
    let value: Int
    let amount: Double
    let image: String
}

var mockSignals: [MockSignal] = [
    MockSignal(name: "Shiba Inu", date: "01/07/1997 22:15:17", address: "0x2859e4544c4bb03966803b044a93563bd2d0dd4d", buySlippage: "2%", sellSlippage: "3%", status: .pending, liquidity: "3000", liquidityType: "BNB"),
    MockSignal(name: "Shiba Inu", date: "01/07/1997 22:15:17", address: "0x2859e4544c4bb03966803b044a93563bd2d0dd4d", buySlippage: "2%", sellSlippage: "3%", status: .live, liquidity: "3000", liquidityType: "BNB"),
    MockSignal(name: "Coinswap Space", date: "01/07/1997 22:15:17", address: "0x3bc5798416c1122bcfd7cb0e055d50061f23850d", buySlippage: "1%", sellSlippage: "1%", status: .pending, liquidity: "1075", liquidityType: "BNB"),
    MockSignal(name: "Hyve", date: "07/01/2007 22:15:17", address: "0xee88c8c7d02bce62c472dcd68a746bbe2ef07189", buySlippage: "7%", sellSlippage: "7%", status: .pending, liquidity: "832", liquidityType: "BNB")
]

struct MockSignal: Identifiable {
    var id = UUID()
    let name: String
    let date: String
    let address: String
    let buySlippage: String
    let sellSlippage: String
    let status: SignalStatus
    let liquidity: String
    let liquidityType: String
}

enum SignalStatus: String {
    case pending = "PENDING"
    case live = "LIVE"
    
    var color: Color {
        switch self {
        case .pending:
            return Eurosa.Colors.orange
        case .live:
            return Eurosa.Colors.green
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .pending:
            return [Eurosa.Colors.orange, Eurosa.Colors.orange2]
        case .live:
            return [Eurosa.Colors.green, Eurosa.Colors.green2]
        }
    }
    
}

let mockMarketCoins: [MockMarketCoin] = [
    MockMarketCoin(name: "Bitcoin", logo: "BTC", price: 43948.29),
    MockMarketCoin(name: "Ethereum", logo: "Ethereum", price: 3094.74),
    MockMarketCoin(name: "Cardano", logo: "Cardano", price: 1.09),
    MockMarketCoin(name: "XRP", logo: "XRP", price: 0.822),
    MockMarketCoin(name: "Chainlink", logo: "Chainlink", price: 17.08),
    MockMarketCoin(name: "Matic", logo: "Matic", price: 1.84),
    MockMarketCoin(name: "Polkadot", logo: "Polkadot", price: 19.92),
    MockMarketCoin(name: "Solana", logo: "Solana", price: 101.56),
    MockMarketCoin(name: "Avalanche", logo: "Avalanche", price: 88.64),
    MockMarketCoin(name: "Vechain", logo: "Vechain", price: 0.0591),
    MockMarketCoin(name: "Terra", logo: "Terra", price: 55.94),
    MockMarketCoin(name: "Harmony", logo: "Harmony", price: 0.194)
]

struct MockMarketCoin: Identifiable {
    var id = UUID()
    let name: String
    let logo: String
    let price: Double
}


