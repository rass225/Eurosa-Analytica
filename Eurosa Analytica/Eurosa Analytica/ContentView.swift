import SwiftUI

struct ContentView: View {
    
    enum Tabs {
        case porfolio
        case signals
        case market
        case profile
    }
    
    @State var tabSelection: Tabs = .porfolio
    
    var body: some View {
        ZStack{
//            Color.white.ignoresSafeArea()
            Eurosa.Colors.blue1.ignoresSafeArea()
            VStack(spacing: 0){
                switch tabSelection {
                case .porfolio : Portfolio()
                case .signals  : Signals()
                case .market   : Market()
                case .profile  : Profile()
                }
                HStack(spacing: 0){
                    Spacer()
                    Button(action: {
                        tabSelection = .market
                    }) {
                        switch tabSelection {
                        case .market: Eurosa.Icons.marketSelected
                        default: Eurosa.Icons.marketUnselected
                        }
                    }
                    Spacer()
                    Button(action: {
                        tabSelection = .porfolio
                    }) {
                        switch tabSelection {
                        case .porfolio: Eurosa.Icons.portfolioSelected
                        default: Eurosa.Icons.portfolioUnselected
                        }
                    }
                    Spacer()
                    Button(action: {
                        tabSelection = .signals
                    }) {
                        Eurosa.Icons.signal
                            .font(tabSelection == .signals ? .headline : .callout)
                    }
                    Spacer()
                    Button(action: {
                        tabSelection = .profile
                    }) {
                        switch tabSelection {
                        case .profile: Eurosa.Icons.profileSelected
                        default: Eurosa.Icons.profileUnselected
                        }
                    }
                    Spacer()
                }
//                .foregroundColor(Eurosa.Colors.blue1)
                .foregroundColor(.white)
                .padding(.top)
                .padding(.bottom, 8)
//                .background(Color.white.shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: -3))
                .background(Eurosa.Colors.blue1.shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: -3))
            }
        }
    }
}
