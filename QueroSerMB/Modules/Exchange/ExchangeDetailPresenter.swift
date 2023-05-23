//
//  ExchangeDetailPresenter.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 22/05/23.
//

import Foundation

protocol ExchangeDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func openWebsiteButtonTapped()
    func exchangeDetailsFetched(_ exchange: ExchangeViewModel)
    func openWebsite(with url: URL)
}

class ExchangeDetailPresenter: ExchangeDetailPresenterProtocol {
    weak var view: ExchangeDetailViewProtocol?
    var interactor: ExchangeDetailInteractorProtocol?
    var coordinator: ExchangeDetailCoordinatorProtocol?
    
    init(view: ExchangeDetailViewProtocol? = nil, interactor: ExchangeDetailInteractorProtocol? = nil, coordinator: ExchangeDetailCoordinatorProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        interactor?.fetchExchangeDetails()
    }

    func openWebsiteButtonTapped() {
        interactor?.openExchangeWebsite()
    }

    func exchangeDetailsFetched(_ exchange: ExchangeViewModel) {
        view?.updateUI(with: exchange)
    }

    func openWebsite(with url: URL) {
        coordinator?.openWebsite(with: url)
    }
}
