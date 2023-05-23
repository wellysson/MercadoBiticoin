//
//  ExchangeViewModel.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 22/05/23.
//

import Foundation

class ExchangeViewModel {
    var exchange: Exchange
    var exchangeIcon: ExchangeIcon?
    
    init(exchange: Exchange, exchangeIcon: ExchangeIcon?) {
        self.exchange = exchange
        self.exchangeIcon = exchangeIcon
    }
}
