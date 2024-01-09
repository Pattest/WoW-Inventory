//
//  GDWoWToken.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 09/01/2024.
//

import Moya
import Foundation

enum GDWoWToken {
    case index
}

extension GDWoWToken: GameDataTargetType {

    var namespace: String {
        return "dynamic-eu"
    }

    var baseURL: URL {
        return URL(string: "\(strBaseURL)/token")!
    }

    var path: String {
        switch self {
        case .index:
            return "/index"
        }
    }

    var method: Moya.Method {
        switch self {
        case .index:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .index:
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.queryString
            )
        }
    }
}
