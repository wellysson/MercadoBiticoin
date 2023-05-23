//
//  ExchangeDetailCoordinator.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 22/05/23.
//

import Foundation
import UIKit

protocol ExchangeDetailCoordinatorProtocol: AnyObject {
    func openWebsite(with url: URL)
}

class ExchangeDetailCoordinator: ExchangeDetailCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    private var view: ExchangeDetailView?
    private var interactor: ExchangeDetailInteractor?
    private var presenter: ExchangeDetailPresenter?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start(exchange: Exchange, exchangeIcon: ExchangeIcon?) {
        self.view = ExchangeDetailView()
        self.interactor = ExchangeDetailInteractor(exchange: exchange, exchangeIcon: exchangeIcon, presenter: self.presenter)
        self.presenter = ExchangeDetailPresenter(view: self.view, interactor: self.interactor, coordinator: self)
        self.view?.presenter = presenter
        self.interactor?.presenter = presenter
        
        self.navigationController?.pushViewController(self.view!, animated: true)
    }

    func openWebsite(with url: URL) {
        UIApplication.shared.open(url)
    }
}
