//
//  HomeRepository.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 21/05/23.
//

import Foundation
protocol HomeRepositoryProtocol: AnyObject {
    func getExchanges(complete: @escaping ((_ exchanges: [Exchange],_ error: Error?) -> Void))
    func getExchangesIcons(complete: @escaping ((_ exchangesIcons: [ExchangeIcon],_ error: Error?) -> Void))
}

class HomeRepository: HomeRepositoryProtocol {
    func getExchanges(complete: @escaping ((_ exchanges: [Exchange],_ error: Error?) -> Void)) {
        CoinAPI.shared.metadataExchanges { (jsonResponse, error) in
            guard let jsonResponse = jsonResponse else {
                complete([], error)
                return
            }
            var exchanges: [Exchange] = []
            do {
                print(jsonResponse)
                let resp = APIUtil.parseResult(value: jsonResponse)
                exchanges = try JSONDecoder().decode([Exchange].self, from: resp.data(using: .utf8)!)
                complete(exchanges, error)
            } catch let error as NSError {
                let parseError = CustomError.parseError
                complete([], parseError)
            }
        }
    }
    
    func getExchangesIcons(complete: @escaping ((_ exchangesIcons: [ExchangeIcon],_ error: Error?) -> Void)) {
        CoinAPI.shared.metadataExchangesIcons { (jsonResponse, error) in
            guard let jsonResponse = jsonResponse else {
                complete([], error)
                return
            }
            var exchangesIcons: [ExchangeIcon] = []
            do {
                let resp = APIUtil.parseResult(value: jsonResponse)
                exchangesIcons = try JSONDecoder().decode([ExchangeIcon].self, from: resp.data(using: .utf8)!)
                complete(exchangesIcons, error)
            } catch let error as NSError {
                let parseError = CustomError.parseError
                complete([], parseError)
            }
        }
    }
}

public enum CustomError: Error {
    case parseError
    
    public var errorDescription: String? {
        switch self {
        case .parseError:
            return "Erro ao realizar parse dos objetos"
        }
    }
}
