//
//  Exchange.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 20/05/23.
//

import Foundation

// MARK: - ExchangeElement
struct Exchange: Codable {
    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd, dataTradeEnd, dataOrderbookStart, dataOrderbookEnd, dataTradeStart: String?
    let dataSymbolsCount: Int
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double
    let exchangeID, name, website: String
    let metricID: [String?]?

    enum CodingKeys: String, CodingKey {
        case dataStart = "data_start"
        case dataQuoteEnd = "data_quote_end"
        case dataTradeEnd = "data_trade_end"
        case exchangeID = "exchange_id"
        case dataSymbolsCount = "data_symbols_count"
        case dataQuoteStart = "data_quote_start"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case volume1DayUsd = "volume_1day_usd"
        case website
        case dataEnd = "data_end"
        case name
        case metricID = "metric_id"
    }
}

