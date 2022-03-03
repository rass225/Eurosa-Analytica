import Foundation
import SwiftUI

class MarketManager: ObservableObject {
    
    @Published var allCcins  : [Coins] = []
    @Published var newCoins  : [Coins] = []
    @Published var trending  : [Coins] = []
    @Published var gainers   : [Coins] = []
    @Published var losers    : [Coins] = []
    @Published var mostVisited: [Coins] = []
    @Published var singleCoinMeta: Meta? = Meta(urls: Urls(website: [], technicalDoc: [], twitter: [], reddit: [], messageBoard: [], announcement: [], chat: [], explorer: [], sourceCode: []), id: 0, name: "", dateAdded: "", dateLaunched: "")
   
    let client = APIClient()
    
    init() {
        reload()
    }
    
    func reload() {
        fetchAllCoins()
        fetchGainers()
        fetchNewCoins()
        fetchTrending()
        fetchLosers()
        fetchMostVisited()
    }
    
    func fetchAllCoins() {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.latest) { (responde: Result<Welcome, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    self.allCcins = success.tokens
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchNewCoins() {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.new) { (responde: Result<Welcome, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    self.newCoins = success.tokens
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchTrending() {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.trending) { (responde: Result<Welcome, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    self.trending = success.tokens
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchGainers() {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.gainers) { (responde: Result<Welcome, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    self.gainers = success.tokens
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchLosers() {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.losers) { (responde: Result<Welcome, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    self.losers = success.tokens
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchMostVisited() {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.mostVisited) { (responde: Result<Welcome, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    self.mostVisited = success.tokens
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchMetaData(id: Int) {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.metaData(id: id)) { (responde: Result<MetaData, Error>) in
            switch responde {
            case .success(let success):
                DispatchQueue.main.async {
                    if let meta = success.data["\(id)"] {
                        self.singleCoinMeta = meta
                    }
                }
            case .failure(let failure):
                print(failure)
                self.singleCoinMeta = nil
            }
        }
    }
    
    func fetchHistoricData(id: Int) {
        client.fetch(url: Eurosa.Endpoints.CoinMarketCap.historicData(id: id)) { (responde: Result<HisotricPrice, Error>) in
            switch responde {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
                self.singleCoinMeta = nil
            }
        }
    }
}
