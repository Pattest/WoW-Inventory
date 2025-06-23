//
//  WITargetType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Alamofire
import Foundation

enum WIRequestTask {
    case requestParameters(parameters: Parameters, encoding: ParameterEncoding)

    var parameters: Parameters {
        switch self {
        case .requestParameters(let parameters, _):
            return parameters
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .requestParameters(_, let encoding):
            return encoding
        }
    }
}

protocol WITargetType {
    var strBaseURL: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: WIRequestTask { get }
    var headers: HTTPHeaders? { get }
    var parameters: [String: Any] { get }
}

extension WITargetType {

    var url: URL {
        let trimmedPath = path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        guard !trimmedPath.isEmpty else {
            return baseURL
        }

        let baseURLString = baseURL.absoluteString.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        return URL(string: "\(baseURLString)/\(trimmedPath)")!
    }

    var headers: HTTPHeaders? {
        return [
            "Content-type": "application/json",
            "Authorization": "Bearer \(WICredentials.shared.loadAccessToken())"
        ]
    }
}
