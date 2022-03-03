import SwiftUI

struct Signals: View {
    
    enum SignalTabs {
        case signals
        case statistics
        case compoundInterest
    }
    
    @State var tabSelection: SignalTabs = .signals
    
    var body: some View {
        NavigationView{
            ZStack{
                Eurosa.Colors.blue1.ignoresSafeArea()
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16){
                            Button(action: {
                                tabSelection = .signals
                            }) {
                                Text("SIGNALS")
                                    .opacity(tabSelection == .signals ? 1 : 0.7)
                            }
                            Button(action: {
                                tabSelection = .statistics
                            }) {
                                Text("STATISTCS")
                                    .opacity(tabSelection == .statistics ? 1 : 0.7)
                            }
                            Button(action: {
                                tabSelection = .compoundInterest
                            }) {
                                Text("COMPOUND INTEREST")
                                    .opacity(tabSelection == .compoundInterest ? 1 : 0.7)
                            }
                        }
                        .font(Eurosa.Fonts.caption.weight(.medium))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 10)
                    .background(Eurosa.Colors.blue1)
                    VStack(spacing: 0){
                        HStack(spacing: 20){
                            Menu(content: {
                                Button(action: {
                                    mockSignals = mockSignals.sorted(by: { $0.name < $1.name })
                                }) {
                                    Text("Filter x")
                                        .foregroundColor(.black)
                                }
                               
                                Text("Sort x")
                                    .foregroundColor(.black)
                            }, label: {
                                Text("Filter")
                            }).preferredColorScheme(.light)
                            Text("Sort")
                            
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .font(Eurosa.Fonts.callout.weight(.regular))
                        .background(Color.white.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 3))
                        ScrollView{
                            switch tabSelection {
                            case .signals:
                                VStack(spacing: 12){
                                    ForEach(mockSignals) { item in
                                        TempleteSignal(signal: item)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                            case .statistics:
                                ForEach(1..<50) { item in
                                    Text("Statistics")
                                }
                            case .compoundInterest:
                                ForEach(1..<50) { item in
                                    Text("Compound Interest")
                                }
                            }
                        }
                    }
                    
                    .background(Color.white)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: -3)
                }
            }
            .navigationBarModifier()
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Eurosa.Titles.signals
                        .titleModifier()
                }
            }
        }
    }
    
    
    private struct TempleteSignal: View {
        let networkManager = NetworkManager()
        let signal: MockSignal
        
        @State var isExpanded = false
        
        var body: some View {
            Button(action: {
                withAnimation{
                    isExpanded.toggle()
                }
            }) {
                VStack(alignment: .leading){
                    ZStack{
                        HStack{
                            Text(signal.status.rawValue)
                                .font(Eurosa.Fonts.caption2)
                            Spacer()
                            Text(signal.date)
                                .font(Eurosa.Fonts.caption2)
                        }
                        .padding(.trailing, 8)
                        .padding(.leading, 14)
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: signal.status.gradientColors, startPoint: .leading, endPoint: .trailing))
                    HStack{
                        Text(signal.name)
                            .foregroundColor(.black)
                            .font(Eurosa.Fonts.body)
                        Spacer()
                    }.padding(.bottom, 8)
                        .padding(.horizontal, 12)
                    if isExpanded {
                        HStack(spacing: 0){
                            
                            VStack(spacing: 0){
                                Text(signal.buySlippage)
                                    .font(Eurosa.Fonts.headline)
                                Text("Buy Slippage")
                                    .font(Eurosa.Fonts.caption2)
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 0){
                                Text(signal.sellSlippage)
                                    .font(Eurosa.Fonts.headline)
                                Text("Sell Slippage")
                                    .font(Eurosa.Fonts.caption2)
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 0){
                                Text(signal.liquidity)
                                    .font(Eurosa.Fonts.headline)
                                Text("BNB Liquidity")
                                    .font(Eurosa.Fonts.caption2)
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .padding(.horizontal, 12)
                        
                        Divider()
                        
                        HStack(spacing: 0){
                            
                            Button(action: {
                                networkManager.goToPoocoin(address: signal.address)
                            }) {
                                Text("Chart")
                            }.buttonStyle(.plain)
                            
                            Spacer()
                            Button(action: {
                                networkManager.goToBscScanner(address: signal.address)
                            }) {
                                Text("Scanner")
                            }.buttonStyle(.plain)
                            
                            Spacer()
                            Text("\(String(signal.address.prefix(5)))...\(String(signal.address.suffix(4)))")
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 2)
                        .font(Eurosa.Fonts.caption)
                        .foregroundColor(Eurosa.Colors.blue1)
                    }
                }
                .maxWidth(align: .leading)
                .padding(.bottom, 8)
                .background(Color.white)
                .cornerRadius(8)
                .defaultShadow()
            }
            .buttonStyle(.plain)
        }
    }
}
