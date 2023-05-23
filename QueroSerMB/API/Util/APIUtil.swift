//
//  Util.swift
//  QueroSerMB
//
//  Created by Wellysson Avelar on 21/05/23.
//

import Foundation

class APIUtil {
    static func parseResult(value: Any) -> String {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else { return "" }
        
        let rawResult = String(data: jsonData, encoding: .utf8) ?? ""
        let formatedResult = rawResult.replacingOccurrences(of: "\n", with: "")
        return formatedResult
    }
}
