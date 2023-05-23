//
//  HomeRepository.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 21/05/23.
//

import Foundation

class HomeRepository {
    static func getExchanges(complete: @escaping ((_ exchanges: [Exchange],_ error: Error?) -> Void)) {
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
                print("Erro na no parse Json: \(error.localizedDescription)")
                let parseError = CustomError.parseError
                complete([], parseError)
            }
//            print(exchanges.first?.dataOrderbookStart?.toDate(withFormat: DateFormat.yyyyMMddTHHmmSSSZ.rawValue))
//            print("Metadata - List all exchanges : \(jsonResponse)")
//            print("error: \(String(describing: error))")
        }
    }
    
    static func getExchangesIcons(complete: @escaping ((_ exchangesIcons: [ExchangeIcon],_ error: Error?) -> Void)) {
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
                print("Erro na no parse Json: \(error.localizedDescription)")
                let parseError = CustomError.parseError
                complete([], parseError)
            }
            
//            print(exchanges.first?.dataOrderbookStart?.toDate(withFormat: DateFormat.yyyyMMddTHHmmSSSZ.rawValue))
//            print("Metadata - List all exchanges : \(jsonResponse)")
//            print("error: \(String(describing: error))")
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
