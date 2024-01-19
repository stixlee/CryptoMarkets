//
//  CoinResponse.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/14/24.
//

import Foundation

struct CoinResponse: Codable {
    
    let id: String
    let symbol: String
    let name: String
    let rank: Int
    let slug: String
    let platformId: String?
    let blockTime: Int
    let hashingAlgorithm: String?
    let hasPreviewListing: Bool
    let publicNotice: String?
    let otherNotices: [String]
    let info: CoinDescription
//    let links: CoinLinks
    let images: ImageLinks
    let countryOfOrigin: String
    let genesis: String?
    let sentimentUpPercent: Double
    let sentimentDownPercent: Double
    let numberWatching: Int
    let marketData: MarketData
    let lastUpdated: String
//    let tickers: [Ticker]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case rank = "market_cap_rank"
        case slug = "web_slug"
        case platformId = "asset_platform_id"
        case blockTime = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
        case hasPreviewListing = "preview_listing"
        case publicNotice = "public_notice"
        case otherNotices = "additional_notices"
        case info = "description"
//        case links = "links"
        case images = "image"
        case countryOfOrigin = "country_origin"
        case genesis = "genesis_date"
        case sentimentUpPercent = "sentiment_votes_up_percentage"
        case sentimentDownPercent = "sentiment_votes_down_percentage"
        case numberWatching = "watchlist_portfolio_users"
        case marketData = "market_data"
        case lastUpdated = "last_updated"
//        case tickers = "tickers"
    }
}

struct CoinDescription: Codable {
    let en: String
}

struct CoinLinks: Codable {
    let homepage: [String]
    let sites: [String]
    let forums: [String]
    let chat: [String]
    let announcements: [String]
    let twitter: String
    let facebook: String
    let bitcoinTalk: String?
    let telegram: String
    let subreddit: String
    let repos: RepositoryLinks
    
    enum CodingKeys: String, CodingKey {
        case homepage = "homepage"
        case sites = "blockchain_site"
        case forums = "official_forum_url"
        case chat = "chat_url"
        case announcements = "announcement_url"
        case twitter = "twitter_screen_name"
        case facebook = "facebook_username"
        case bitcoinTalk = "bitcointalk_thread_identifier"
        case telegram = "telegram_channel_identifier"
        case subreddit = "subreddit_url"
        case repos = "repos_url"
    }
}

struct RepositoryLinks: Codable {
    let github: [String]
    let bitbucket: [String]
}

struct ImageLinks: Codable {
    let thumb: String
    let small: String
    let large: String
}

struct DoubleCollection: Codable {
    let usd: Double
    let btc: Double
}

struct IntCollection: Codable {
    let usd: Int
    let btc: Int
}

struct StringCollection: Codable {
    let usd: String
    let btc: String
}

struct ConvertedDoubleCollection: Codable {
    let usd: Double
    let btc: Double
    let eth: Double
}

struct MarketData: Codable {
    let price: DoubleCollection
    let marketCap: DoubleCollection
    let percentChange24h: Double
//    let tvl: Double?
//    let mcapRatio: Double?
//    let fdvRatio: Double?
//    let roi: Double?
//    let allTimeHigh: DoubleCollection
//    let athPercentChange: DoubleCollection
//    let athDate: StringCollection
//    let allTimeLow: DoubleCollection
//    let atlPercentChange: DoubleCollection
//    let atlDate: StringCollection
//    let fullyDilutedValuation: DoubleCollection
//    let mcapFdvRatio: Double
//    let volume: IntCollection
//    let high24h: DoubleCollection
//    let low24h: DoubleCollection
//    let priceChange24h: Double
//    let percentChange7d: Double
//    let percentChange14d: Double
//    let percentChange30d: Double
//    let percentChange60d: Double
//    let percentChange200d: Double
//    let percentChange1y: Double
//    let marketCapChange24h: Double
//    let percentChangeMarketCap24h: Double
//    let priceChangeInCurrency24h: DoubleCollection
//    let percentChangeInCurrency1h: DoubleCollection
//    let percentChangeInCurrency24h: DoubleCollection
//    let percentChangeInCurrency7d: DoubleCollection
//    let percentChangeInCurrency14d: DoubleCollection
//    let percentChangeInCurrency30d: DoubleCollection
//    let percentChangeInCurrency60d: DoubleCollection
//    let percentChangeInCurrency200d: DoubleCollection
//    let percentChangeInCurrency1y: DoubleCollection
//    let marketCapChaningInCurrency24h: DoubleCollection
//    let percentChangeMarketCapInCurrency24h: DoubleCollection
//    let totalSupply: Int
//    let maxSupply: Int
//    let circulatingSupply: Int
//    let lastUpdated: String


    enum CodingKeys: String, CodingKey {
        case price = "current_price"
        case marketCap = "market_cap"
        case percentChange24h = "price_change_percentage_24h"
//        case tvl = "total_value_locked"
//        case mcapRatio = "mcap_to_tvl_ratio"
//        case fdvRatio = "fdv_to_tvl_ratio"
//        case roi = "roi"
//        case allTimeHigh = "ath"
//        case athPercentChange = "ath_change_percentage"
//        case athDate = "ath_date"
//        case allTimeLow = "atl"
//        case atlPercentChange = "atl_change_percentage"
//        case atlDate = "atl_date"
//        case fullyDilutedValuation = "fully_diluted_valuation"
//        case mcapFdvRatio = "market_cap_fdv_ratio"
//        case volume = "total_volume"
//        case high24h = "high_24h"
//        case low24h = "low_24h"
//        case priceChange24h = "price_change_24h"
//        case percentChange7d = "price_change_percentage_7d"
//        case percentChange14d = "price_change_percentage_14d"
//        case percentChange30d = "price_change_percentage_30d"
//        case percentChange60d = "price_change_percentage_60d"
//        case percentChange200d = "price_change_percentage_200d"
//        case percentChange1y = "price_change_percentage_1y"
//        case marketCapChange24h = "market_cap_change_24h"
//        case percentChangeMarketCap24h = "market_cap_change_percentage_24h"
//        case priceChangeInCurrency24h = "price_change_24h_in_currency"
//        case percentChangeInCurrency1h = "price_change_percentage_1h_in_currency"
//        case percentChangeInCurrency24h = "price_change_percentage_24h_in_currency"
//        case percentChangeInCurrency7d = "price_change_percentage_7d_in_currency"
//        case percentChangeInCurrency14d = "price_change_percentage_14d_in_currency"
//        case percentChangeInCurrency30d = "price_change_percentage_30d_in_currency"
//        case percentChangeInCurrency60d = "price_change_percentage_60d_in_currency"
//        case percentChangeInCurrency200d = "price_change_percentage_200d_in_currency"
//        case percentChangeInCurrency1y = "price_change_percentage_1y_in_currency"
//        case marketCapChaningInCurrency24h = "market_cap_change_24h_in_currency"
//        case percentChangeMarketCapInCurrency24h = "market_cap_change_percentage_24h_in_currency"
//        case totalSupply = "total_supply"
//        case maxSupply = "max_supply"
//        case circulatingSupply = "circulating_supply"
//        case lastUpdated = "last_updated"
   }
    
}

struct Ticker: Codable {
    
    let base: String
    let target: String
    let market: MarketMetaData
    let last: Double
    let volume: Double
    let convertedLast: ConvertedDoubleCollection
    let convertedVolume: ConvertedDoubleCollection
    let trustScore: String
    let spreadPercentage: Double
    let timestamp: String
    let lastTradedAt: String
    let lastFetchAt: String
    let isAnomaly: Bool
    let isStale: Bool
    let urlString: String?
    let tokenUrlString: String?
    let coinId: String?
    let targetId: String?
    
    enum CodingKeys: String, CodingKey {
        case base = "base"
        case target = "target"
        case market = "market"
        case last = "last"
        case volume = "volume"
        case convertedLast = "converted_last"
        case convertedVolume = "converted_volume"
        case trustScore = "trust_score"
        case spreadPercentage = "bid_ask_spread_percentage"
        case timestamp = "timestamp"
        case lastTradedAt = "last_traded_at"
        case lastFetchAt = "last_fetch_at"
        case isAnomaly = "is_anomaly"
        case isStale = "is_stale"
        case urlString = "trade_url"
        case tokenUrlString = "token_info_url"
        case coinId = "coin_id"
        case targetId = "target_coin_id"
    }
}

struct MarketMetaData: Codable {
    let name: String
    let identifier: String
    let hasTradingIncentive: Bool
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case identifier = "identifier"
        case hasTradingIncentive = "has_trading_incentive"
    }
}


