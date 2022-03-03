import SwiftUI

struct CoinView: View {
    
    @EnvironmentObject var manager: MarketManager
    
    let coin: Coins
    
    @State var periodSelection: TimePeriod = .day
    @State private var data = [0.8, 0.32, 0.36, 0.37, 0.19, 0.25, 0.5, 0.16, 0.12, 0.8, 0.32, 0.36, 0.37, 0.32, 0.25, 0.5, 0.16, 0.74,0.68, 0.43, 0.32, 0.99, 0.90, 0.90, 0.40]
    
    enum TimePeriod {
        case onehour
        case day
        case sevenDays
        case month
        case twoMonths
        case threeMonths
    }
    
    var body: some View {
        ZStack{
            Eurosa.Colors.blue1.ignoresSafeArea()
            VStack(spacing: 0){
                ZStack{
                    VStack(alignment: .leading){
                        HStack{
                            TokenIcon(id: coin.databaseId, size: .big)
                            Text(coin.name)
                                .font(Eurosa.Fonts.largeTitle.weight(.medium))
                            Spacer()
                        }
                        priceFormatter(price: coin.quote.usd.price)
                            .font(Eurosa.Fonts.title)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                
                .background(Eurosa.Colors.blue1)
                .foregroundColor(.white)
                
                ScrollView{
                    
                    VStack{
                        HStack{
                            Button("1h") {
                                periodSelection = .onehour
                            }
                            .frame(width: 45)
                            .padding(.vertical, 8)
                            .background(periodSelection == .onehour ? Eurosa.Colors.blue1.opacity(0.2) : Color.white)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                           
                            Button("24h") {
                                periodSelection = .day
                            }
                            .frame(width: 45)
                            .padding(.vertical, 8)
                            .background(periodSelection == .day ? Eurosa.Colors.blue1.opacity(0.2) : Color.white)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                            Button("7d") {
                                periodSelection = .sevenDays
                            }
                            .frame(width: 45)
                            .padding(.vertical, 8)
                            .background(periodSelection == .sevenDays ? Eurosa.Colors.blue1.opacity(0.2) : Color.white)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                            Button("30h") {
                                periodSelection = .month
                            }
                            .frame(width: 45)
                            .padding(.vertical, 8)
                            .background(periodSelection == .month ? Eurosa.Colors.blue1.opacity(0.2) : Color.white)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                            Button("60h") {
                                periodSelection = .twoMonths
                            }
                            .frame(width: 45)
                            .padding(.vertical, 8)
                            .background(periodSelection == .twoMonths ? Eurosa.Colors.blue1.opacity(0.2) : Color.white)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                            Button("90h") {
                                periodSelection = .threeMonths
                            }
                            .frame(width: 45)
                            .padding(.vertical, 8)
                            .background(periodSelection == .threeMonths ? Eurosa.Colors.blue1.opacity(0.2) : Color.white)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 8)
                        .font(Eurosa.Fonts.caption.weight(.medium))
                        .foregroundColor(.black)
                        LineChartView(data: data, title: "24h", legend: "Price change", rateValue: Int(coin.quote.usd.percentChange24H ?? 0)).padding(.horizontal)
                            
                            
                        HStack{
                            VStack(alignment: .leading, spacing: 8){
                                VStack(alignment: .leading){
                                    Text("Market Cap")
                                        .font(Eurosa.Fonts.caption.weight(.semibold))
                                    if let marketCap = coin.quote.usd.marketCap {
                                        Text("$\(Int(marketCap))")
                                    } else {
                                        Text("N/A")
                                    }
                                    
                                }.font(Eurosa.Fonts.caption2)
                                VStack(alignment: .leading){
                                    Text("Volume 24h")
                                        .font(Eurosa.Fonts.caption.weight(.semibold))
                                    if let volume24 = coin.quote.usd.volume24H {
                                        Text("$\(Int(volume24))")
                                    } else {
                                        Text("N/A")
                                    }
                                }.font(Eurosa.Fonts.caption2)
                                VStack(alignment: .leading){
                                    Text("Max Supply")
                                        .font(Eurosa.Fonts.caption.weight(.semibold))
                                    if let maxSupply = coin.maxSupply {
                                        Text("$\(maxSupply)")
                                    } else {
                                        Text("N/A")
                                    }
                                }.font(Eurosa.Fonts.caption2)
                            }.padding(.horizontal, 32)
                            Spacer()
                            HStack {
                                Divider()
                            }
                           
                            .padding(.trailing, 32)
                            
                            VStack(alignment: .leading, spacing: 8){
                                VStack(alignment: .leading) {
                                    Text("Fully Diluted Market Cap")
                                        .font(Eurosa.Fonts.caption.weight(.semibold))
                                    if let fullyDeluted = coin.quote.usd.fullyDilutedMarketCap {
                                        Text("$\(Int(fullyDeluted))")
                                    } else {
                                        Text("N/A")
                                    }
                                }.font(Eurosa.Fonts.caption2)
                                VStack(alignment: .leading) {
                                    Text("Circulating Supply")
                                        .font(Eurosa.Fonts.caption.weight(.semibold))
                                    if let circulatingSupply = coin.circulatingSupply {
                                        Text("\(Int(circulatingSupply))")
                                    } else {
                                        Text("N/A")
                                    }
                                }.font(Eurosa.Fonts.caption2)
                                VStack(alignment: .leading) {
                                    Text("Total Supply")
                                        .font(Eurosa.Fonts.caption.weight(.semibold))
                                    if let totalSupply = coin.totalSupply {
                                        Text("\(Int(totalSupply))")
                                    }
                                }.font(Eurosa.Fonts.caption2)
                            }.padding(.horizontal, 32)
                            
                        }
                        .onTapGesture {
                            withAnimation{
                                data.append(1.3)
                            }
                            
                        }
                            .padding(.vertical)
                            .foregroundColor(.black)
                        if let meta = manager.singleCoinMeta {
                            VStack(alignment: .leading, spacing: 8){
                                TokenWebsite(meta: meta, id: coin.databaseId)
                                TokenReddit(meta: meta)
                                TokenTwitter(meta: meta)
                                TokenAnnouncement(meta: meta)
                                TokenChat(meta: meta)
                                TokenTechnicalDoc(meta: meta)
                                TokenMessageBoard(meta: meta)
                                TokenExplorers(meta: meta)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color.white)
                .cornerRadius(24, corners: [.topLeft, .topRight])
            }
        }
        .navigationBarModifier()
        .onAppear{
            manager.fetchMetaData(id: coin.databaseId)
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
    
    private struct TokenIcon: View {
        
        let id: Int
        let size: Size
        
        enum Size {
            case big
            case small
        }
        
        var body: some View {
            AsyncImage(url: URL(string: Eurosa.Endpoints.CoinMarketCap.logo(id: id)), transaction: Transaction(animation: .spring())) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.8) .cornerRadius(20)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                @unknown default:
                    Image(systemName: "exclamationmark.icloud") .cornerRadius(20)
                }
            }
            .frame(width: size == .small ? 20 : 40, height: size == .small ? 20 : 40)
        }
    }
    
    private struct TokenWebsite: View {
        let meta: Meta
        let id: Int
        let networkManager = NetworkManager()
        
        var body: some View {
            if !meta.urls.website.isEmpty {
                Button(action: {
                    networkManager.goToWebsite(url: meta.urls.website[0])
                }) {
                    VStack(alignment: .leading, spacing: 4){
                        HStack(spacing: 4){
                            TokenIcon(id: id, size: .small)
                            Text("Website")
                                .font(Eurosa.Fonts.callout)
                                .foregroundColor(.black)
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: "link")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .mediaCellModifier()
                }
                
            }
        }
    }
    
    struct TokenMessageBoard: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body: some View {
            if !meta.urls.messageBoard.isEmpty {
                Button(action: {
                    networkManager.goToWebsite(url: meta.urls.messageBoard[0])
                }) {
                    VStack(alignment: .leading, spacing: 4){
                        HStack(spacing: 4){
                            Image(systemName: "doc.text.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Eurosa.Colors.blue1)
                            Text("Message board")
                                .font(Eurosa.Fonts.callout)
                                .foregroundColor(.black)
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: "link")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .mediaCellModifier()
                }
            }
        }
    }
    
    struct TokenExplorers: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body: some View {
            if !meta.urls.explorer.isEmpty {
                if meta.urls.explorer.count == 1 {
                    Button(action: {
                        networkManager.goToWebsite(url: meta.urls.explorer[0])
                    }) {
                        VStack(alignment: .leading, spacing: 4){
                            HStack(spacing: 4){
                                Image(systemName: "text.magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Eurosa.Colors.blue1)
                                Text("Explorers")
                                    .font(Eurosa.Fonts.callout)
                                    .foregroundColor(.black)
                                Spacer()
                                HStack(spacing: 0){
                                    Image(systemName: "link")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .mediaCellModifier()
                    }
                    
                } else {
                    Menu {
                        ForEach(meta.urls.explorer, id: \.self) { item in
                            if item.contains("https://etherscan.io//") {
                                Button("Ethereum scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://bscscan.com/") {
                                Button("Binance scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.solana.com/") || item.contains("https://solscan.io/") {
                                Button("Solana scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://ftmexplorer.com/") || item.contains("https://ftmscan.com/") {
                                Button("FTM scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://polygonscan.com/") {
                                Button("Polygon scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://avascan.info/") {
                                Button("Avalanche scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://polkascan.io/") {
                                Button("Polkascan scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://xrpscan.com/") {
                                Button("XRP scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://tronscan.org/") {
                                Button("Tron scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://algoexplorer.io/") {
                                Button("Algorand scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://blockchain.info/") || item.contains("https://blockchair.com/") {
                                Button("Blockchain scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://atomscan.com/") {
                                Button("Atom scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.near.org/") {
                                Button("Near scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://hash-hash.info/") {
                                Button("Hedera scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://icpexplorer.org/") {
                                Button("ICP scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.elron.com/") {
                                Button("Elron scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explore.vechain.org/") {
                                Button("Vechain scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.thetatoken.org/") {
                                Button("Theta scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://tzstats.com/") {
                                Button("Tezos scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.helium.com/") {
                                Button("Helium scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://bloks.io/") {
                                Button("EOS scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.iota,org/") {
                                Button("Iota scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://flowscan.org/") {
                                Button("Flow scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://thegraph.com/") {
                                Button("Graph scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.harmony.one/") {
                                Button("Harmony scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://neoscan.io") {
                                Button("NEO scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://explorer.chainweb.com/") {
                                Button("Kadena scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://iotexscan.io/") {
                                Button("Iotex scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://minaexplorer.com/") {
                                Button("Mina scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://nemtool.com/") {
                                Button("Nem scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://wavesexplorer/") {
                                Button("Waves scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://cardanoscan.io/") {
                                Button("Cardano scanner") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else {
                                Button("\(item)") {
                                    networkManager.goToWebsite(url: item)
                                }
                            }
                        }
                        //https://etherscan.io// -
                        //https://bscscan.com/ -
                        //https://explorer.solana.com/ -
                        //https://ftmexplorer.com/ -
                        //https://polygonscan.com/ -
                        //https://avascan.info/ -
                        //https://polkascan.io/ -
                        //https://solscan.io/ -
                        //https://xrpscan.com/ -
                        //https://tronscan.org/
                        //https://algoexplorer.io/ -
                        //https://blockchain.info/ -
                        //https://atomscan.com/ -
                        //https://explorer.near.org/ -
                        //https://blockchair.com/ -
                        //https://hash-hash.info/  - hedera
                        //https://ftmscan.com/ -
                        //https://icpexplorer.org/ -
                        //https://explorer.elron.com/ -
                        //https://explore.vechain.org/ -
                        //https://explorer.thetatoken.org/ -
                        //https://tzstats.com/ -
                        //https://explorer.helium.com/ -
                        //https://bloks.io/ -
                        //https://explorer.iota,org/ -
                        //https://flowscan.org/ -
                        //https://thegraph.com/ -
                        //https://explorer.harmony.one/ -
                        //https://neoscan.io -
                        //https://explorer.chainweb.com/ -
                        //https://iotexscan.io/ -
                        //https://minaexplorer.com/ -
                        //https://nemtool.com/ -
                        //https://wavesexplorer/
                    } label: {
                        VStack(alignment: .leading, spacing: 4){
                            HStack(spacing: 4){
                                Image(systemName: "text.magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Eurosa.Colors.blue1)
                                Text("Explorers")
                                    .font(Eurosa.Fonts.callout)
                                    .foregroundColor(.black)
                                Spacer()
                                HStack(spacing: 0){
                                    Image(systemName: "link")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.black)
                                }
                            }
                            
                        }
                        .mediaCellModifier()
                    }
                }
            }
        }
    }
    
    struct TokenTwitter: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body : some View {
            if !meta.urls.twitter.isEmpty {
                Button(action: {
                    networkManager.goToWebsite(url: meta.urls.twitter[0])
                }) {
                    VStack(alignment: .leading, spacing: 4){
                        HStack(spacing: 4){
                            Image("Twitter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Twitter")
                                .font(Eurosa.Fonts.callout)
                                .foregroundColor(.black)
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: "link")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .mediaCellModifier()
                }
            }
        }
    }
    
    struct TokenTechnicalDoc: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body : some View {
            if !meta.urls.technicalDoc.isEmpty {
                Button(action: {
                    networkManager.goToWebsite(url: meta.urls.technicalDoc[0])
                }) {
                    VStack(alignment: .leading, spacing: 4){
                        HStack(spacing: 4){
                            Image(systemName: "doc.badge.gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Eurosa.Colors.blue1)
                            Text("Technical Documentation")
                                .font(Eurosa.Fonts.callout)
                                .foregroundColor(.black)
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: "link")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .mediaCellModifier()
                }
            }
        }
    }
    
    struct TokenReddit: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body : some View {
            if !meta.urls.reddit.isEmpty {
                Button(action:  {
                    networkManager.goToWebsite(url: meta.urls.reddit[0])
                }) {
                    VStack(alignment: .leading, spacing: 4){
                        HStack(spacing: 4){
                            Image("reddit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Reddit")
                                .font(Eurosa.Fonts.callout)
                                .foregroundColor(.black)
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: "link")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }.mediaCellModifier()
                }
            }
        }
    }
    
    private struct TokenAnnouncement: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body: some View {
            if !meta.urls.announcement.isEmpty {
                Button(action: {
                    networkManager.goToWebsite(url: meta.urls.announcement[0])
                }) {
                    VStack(alignment: .leading, spacing: 4){
                        HStack(spacing: 4){
                            Image(systemName: "exclamationmark.bubble.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Eurosa.Colors.blue1)
                            Text("Announcements")
                                .font(Eurosa.Fonts.callout)
                                .foregroundColor(.black)
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: "link")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .font(Eurosa.Fonts.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .mediaCellModifier()
                }
                
            }
        }
    }
    
    private struct TokenChat: View {
        
        let meta: Meta
        let networkManager = NetworkManager()
        
        var body: some View {
            if !meta.urls.chat.isEmpty {
                if meta.urls.chat.count == 1 {
                    Button(action: {
                        networkManager.goToWebsite(url: meta.urls.chat[0])
                    }) {
                        VStack(alignment: .leading, spacing: 4){
                            HStack(spacing: 4){
                                Image(systemName: "bubble.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Eurosa.Colors.blue1)
                                Text("Chat")
                                    .font(Eurosa.Fonts.callout)
                                    .foregroundColor(.black)
                                Spacer()
                                HStack(spacing: 0){
                                    Image(systemName: "link")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.black)
                                }
                            }
                        }.mediaCellModifier()
                    }
                } else {
                    Menu {
                        ForEach(meta.urls.chat, id: \.self) { item in
                            if item.contains("https://t.me/") || item.contains("https://telegram.me/") {
                                Button("Telegram") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else if item.contains("https://discord.gg/") || item.contains("https://discord.com/") || item.contains("https://discordapp.com/") {
                                Button("Discord") {
                                    networkManager.goToWebsite(url: item)
                                }
                            } else {
                                Button("\(item)") {
                                    networkManager.goToWebsite(url: item)
                                }
                            }
                        }
                    } label: {
                        VStack(alignment: .leading, spacing: 4){
                            HStack(spacing: 4){
                                Image(systemName: "bubble.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Eurosa.Colors.blue1)
                                Text("Chat")
                                    .font(Eurosa.Fonts.callout)
                                    .foregroundColor(.black)
                                Spacer()
                                HStack(spacing: 0){
                                    Image(systemName: "link")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .font(Eurosa.Fonts.caption)
                                        .foregroundColor(.black)
                                }
                            }
                        }.mediaCellModifier()
                    }
                }
            }
        }
    }
    
    private struct MediaCellBody: View {
        let link: String
        
        var body: some View {
            HStack(spacing: 0){
                Text(link)
                    .font(Eurosa.Fonts.caption)
                    .foregroundColor(.gray)
                Spacer()
                HStack(spacing: 0){
                    Image(systemName: "link")
                        .font(Eurosa.Fonts.caption)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .font(Eurosa.Fonts.caption)
                }
            }
        }
    }
}
