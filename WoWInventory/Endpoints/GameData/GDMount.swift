//
//  GDMount.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Alamofire
import Foundation

enum GDMount {
    case mounts
    case mount(id: Int)
}

extension GDMount: GameDataTargetType {

    var namespace: String {
        return "static-eu"
    }

    var baseURL: URL {
        return URL(string: "\(strBaseURL)/mount")!
    }

    var path: String {
        switch self {
        case .mounts:
            return "/"
        case .mount(let id):
            return "/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .mounts,
                .mount:
            return .get
        }
    }

    var task: WIRequestTask {
        switch self {
        case .mounts,
                .mount:
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.queryString
            )
        }
    }
}
