//
//  ExchangesIcons.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 21/05/23.
//

import Foundation

// MARK: - ExchangeIcon
struct ExchangeIcon: Codable {
    let exchangeID: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case exchangeID = "exchange_id"
        case url
    }
}
