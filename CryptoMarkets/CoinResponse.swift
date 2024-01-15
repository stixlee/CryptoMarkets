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
    let hashingAlgorithm: String
    let hasPreviewListing: Bool
    let publicNotice: String?
    let otherNotices: [String]
    let info: CoinDescription
    let links: CoinLinks
    let images: ImageLinks
    let countryOfOrigin: String
    let genesis: String
    let sentimentUpPercent: Double
    let sentimentDownPercent: Double
    let numberWatching: Int
    let marketData: MarketData

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
        case links = "links"
        case images = "image"
        case countryOfOrigin = "country_origin"
        case genesis = "genesis_date"
        case sentimentUpPercent = "sentiment_votes_up_percentage"
        case sentimentDownPercent = "sentiment_votes_down_percentage"
        case numberWatching = "watchlist_portfolio_users"
        case marketData = "market_data"
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


struct MarketData: Codable {
    let price: DoubleCollection
    let marketCap: DoubleCollection
    let tvl: Double?
    let mcapRatio: Double?
    let fdvRatio: Double?
    let roi: Double?
    let allTimeHigh: DoubleCollection
    let athPercentChange: DoubleCollection
    let athDate: StringCollection
    let allTimeLow: DoubleCollection
    let atlPercentChange: DoubleCollection
    let atlDate: StringCollection
    let fullyDilutedValuation: DoubleCollection
    let mcapFdvRatio: Double
    let volume: IntCollection
    let high24h: DoubleCollection
    let low24h: DoubleCollection

    enum CodingKeys: String, CodingKey {
        case price = "current_price"
        case marketCap = "market_cap"
        case tvl = "total_value_locked"
        case mcapRatio = "mcap_to_tvl_ratio"
        case fdvRatio = "fdv_to_tvl_ratio"
        case roi = "roi"
        case allTimeHigh = "ath"
        case athPercentChange = "ath_change_percentage"
        case athDate = "ath_date"
        case allTimeLow = "atl"
        case atlPercentChange = "atl_change_percentage"
        case atlDate = "atl_date"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case mcapFdvRatio = "market_cap_fdv_ratio"
        case volume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"

    }
}



