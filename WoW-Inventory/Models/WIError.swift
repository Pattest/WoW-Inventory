//
//  WIError.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 26/10/2023.
//

import Foundation

struct WIError: Decodable {

    enum CodingKeys: String, CodingKey {
        case error
        case errorDescription = "error_description"
    }

    let error: String
    let errorDescription: String

    static func decodeError(from data: Data) -> WIError? {
        do {
            let decoder = JSONDecoder()
            let error = try decoder.decode(WIError.self, from: data)
            return error
        } catch {
            return nil
        }
    }
}
