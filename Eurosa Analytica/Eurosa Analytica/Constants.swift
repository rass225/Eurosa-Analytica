import Foundation
import SwiftUI

public enum Eurosa {
    
    enum Colors {
        static let blue1 = Color.init(red: 0.2, green: 0.5, blue: 0.8, opacity: 1)
        static let green = Color.init(red: 0, green: 0.6, blue: 0)
        static let green2 = Color.init(red: 0, green: 0.8, blue: 0)
        static let green3 = Color.init(red: 0, green: 0.5, blue: 0)
        static let orange = Color.init(red: 0.95, green: 0.5, blue: 0)
        static let orange2 = Color.init(red: 1, green: 0.7, blue: 0.1)
        static let red = Color.init(red: 0.7, green: 0, blue: 0)
        static let gray = Color.init(red: 0.75, green: 0.75, blue: 0.75)
        
        enum Chart {
            static let blue = Color.init(red: 0.3, green: 0.3, blue: 1, opacity: 1)
            static let red = Color.init(red: 1, green: 0.3, blue: 0.3, opacity: 1)
            static let green = Color.init(red: 0.3, green: 1, blue: 0.3, opacity: 1)
            static let fourth = Color.init(red: 0.3, green: 0.35, blue: 0.95, opacity: 1)
            static let fifth = Color.init(red: 0.85, green: 0.45, blue: 0.45, opacity: 1)
            static let sixth = Color.init(red: 0.45, green: 0.85, blue: 0.45, opacity: 1)
            static let seventh = Color.init(red: 1, green: 0.65, blue: 0)
            static let eight = Color.init(red: 0.65, green: 1, blue: 0)
            static let nineth = Color.init(red: 0, green: 0.65, blue: 1)
        }
        
        enum Gradient {
            static let blue1 = RadialGradient(colors: [.blue, Eurosa.Colors.blue1.opacity(0.5)], center: .center, startRadius: 70, endRadius: 150)
        }
    }
    
    enum Size {
        static let fullWidth = UIScreen.main.bounds.width
        static let fullHieght = UIScreen.main.bounds.height
        static let halfHight = UIScreen.main.bounds.height / 2
        static let halfWidth = UIScreen.main.bounds.width / 2
    }
    
    enum Fonts {
        static let caption2 = Font.caption2.weight(.regular)
        static let body = Font.body.weight(.regular)
        static let headline = Font.headline.weight(.semibold)
        static let caption = Font.caption.weight(.regular)
        static let callout = Font.callout.weight(.regular)
        static let largeTitle = Font.largeTitle.weight(.semibold)
        static let title = Font.title3.weight(.regular)
    }
    
    enum Icons {
        static let add = Image(systemName: "plus")
        static let burger = Image(systemName: "line.3.horizontal")
        static let marketSelected = Image(systemName: "house.fill")
        static let marketUnselected = Image(systemName: "house")
        static let portfolioSelected = Image(systemName: "briefcase.fill")
        static let portfolioUnselected = Image(systemName: "briefcase")
        static let profileSelected = Image(systemName: "person.fill")
        static let profileUnselected = Image(systemName: "person")
        static let signal = Image(systemName: "badge.plus.radiowaves.forward")
        static let error = Image(systemName: "exclamationmark.triangle")
        static let refresh = Image(systemName: "arrow.counterclockwise")
    }
    
    enum Titles {
        static let signals = Text("Signals")
        static let portfolio = Text("Portfolio")
        static let market = Text("Market")
    }
    
    enum Endpoints {
        enum CoinMarketCap {
            static private let base = "https://pro-api.coinmarketcap.com/v1/cryptocurrency"
            static let all = base + "/map?listing_status=active"
            static let inactive = base + "/map?listing_status=inactive"
            static let untracked = base + "/map?listing_status=untracked"
            static let new = base + "/listings/new?limit=25"
            static let latest = base + "/listings/latest"
            static let trending = base + "/trending/latest"
            static let gainers = base + "/trending/gainers-losers"
            static let losers = base + "/trending/gainers-losers?sort_dir=asc"
            static let mostVisited = base + "/trending/most-visited"
            static func metaData(id: Int) -> String {
                return base + "/info?id=\(id)"
            }
            static func historicData(id: Int) -> String {
                return base + "/quotes/historical?id=\(id)"
            }
            static func coin(id: String) -> String {
                return base + "/info?id=\(id)"
            }
            static func latestPaging(start: Int) -> String {
                return base + "/listings/latest?start=\(start)"
            }
            static func logo(id: Int) -> String {
                return "https://s2.coinmarketcap.com/static/img/coins/64x64/\(id).png"
            }
        }
    }
}
