import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Status
    let tokens: [Coins]
    
    enum CodingKeys: String, CodingKey {
        case status
        case tokens = "data"
    }
}

// MARK: - Coins
struct Coins: Codable, Identifiable {
    var id = UUID()
    let databaseId: Int
    let name: String
    let symbol: String
    let slug: String
    let numMarketPairs: Int?
    let dateAdded: String
    let maxSupply: Int?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let platform: Platform?
    let cmcRank: Int?
    let selfReportedCirculatingSupply: Double?
    let selfReportedMarketCap: Double?
    let lastUpdated: String
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case databaseId = "id"
        case name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case platform
        case cmcRank = "cmc_rank"
        case selfReportedCirculatingSupply = "self_reported_circulating_supply"
        case selfReportedMarketCap = "self_reported_market_cap"
        case lastUpdated = "last_updated"
        case quote
    }
}

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Usd
struct Usd: Codable {
    let price: Double
    let volume24H: Double?
    let volumeChange24H: Double?
    let percentChange1H: Double?
    let percentChange24H: Double?
    let percentChange7D: Double?
    let percentChange30D: Double?
    let percentChange60D: Double?
    let percentChange90D: Double?
    let marketCap: Double?
    let marketCapDominance: Double?
    let fullyDilutedMarketCap: Double?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case lastUpdated = "last_updated"
    }
}

// MARK: - Status
struct Status: Codable {
    let timestamp: String
    let errorCode: Int
    let errorMessage: String?
    let elapsed, creditCount: Int
    let notice: String?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case elapsed
        case creditCount = "credit_count"
        case notice
        case totalCount = "total_count"
    }
}

// MARK: - Platform
struct Platform: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let symbol: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case address = "token_address"
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    let data: [String: Meta]
    let status: Status
}

// MARK: - Meta
struct Meta: Codable {
    let urls: Urls
    let id: Int
    let name: String
    let dateAdded: String
    let dateLaunched: String?

    enum CodingKeys: String, CodingKey {
        case urls, id, name
        case dateAdded = "date_added"
        case dateLaunched = "date_launched"
    }
}

// MARK: - Urls
struct Urls: Codable {
    let website: [String]
    let technicalDoc: [String]
    let twitter: [String]
    let reddit: [String]
    let messageBoard: [String]
    let announcement: [String]
    let chat: [String]
    let explorer: [String]
    let sourceCode: [String]

    enum CodingKeys: String, CodingKey {
        case website
        case technicalDoc = "technical_doc"
        case twitter, reddit
        case messageBoard = "message_board"
        case announcement, chat, explorer
        case sourceCode = "source_code"
    }
}


// MARK: - HisotricPrice
struct HisotricPrice: Codable {
    let data: DataClass
    let status: Status
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let name, symbol: String
    let isActive, isFiat: Int
    let quotes: [QuoteElement]

    enum CodingKeys: String, CodingKey {
        case id, name, symbol
        case isActive = "is_active"
        case isFiat = "is_fiat"
        case quotes
    }
}

// MARK: - QuoteElement
struct QuoteElement: Codable {
    let timestamp: String
    let quote: QuoteQuote
}

// MARK: - QuoteQuote
struct QuoteQuote: Codable {
    let usd: PriceEntity

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Usd
struct PriceEntity: Codable {
    let price: Double
    let volume24H: Int
    let marketCap: Double
    let circulatingSupply: Int
    let totalSupply: Int
    let timestamp: String

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case marketCap = "market_cap"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case timestamp
    }
}
