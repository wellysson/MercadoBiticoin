//
//  ExchangeDetailInteractor.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 22/05/23.
//

import Foundation
protocol ExchangeDetailInteractorProtocol: AnyObject {
    func fetchExchangeDetails()
    func openExchangeWebsite()
}

class ExchangeDetailInteractor: ExchangeDetailInteractorProtocol {
    weak var presenter: ExchangeDetailPresenterProtocol?
    let exchange: Exchange
    let exchangeIcon: ExchangeIcon?
    init(exchange: Exchange, exchangeIcon: ExchangeIcon?, presenter: ExchangeDetailPresenterProtocol?) {
        self.presenter = presenter
        self.exchange = exchange
        self.exchangeIcon = exchangeIcon
    }

    func fetchExchangeDetails() {
        let exchange = ExchangeViewModel(exchange: self.exchange, exchangeIcon: self.exchangeIcon)
        presenter?.exchangeDetailsFetched(exchange)
    }

    func openExchangeWebsite() {
        let url = URL(string: self.exchange.website)!
        presenter?.openWebsite(with: url)
    }
}

