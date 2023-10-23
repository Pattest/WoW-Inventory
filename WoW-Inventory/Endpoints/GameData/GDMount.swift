//
//  GDMount.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Moya

enum GDMount {
    case mounts
    case mount(id: Int)
}

extension GDMount: GameDataTargetType {
    
    var baseURL: URL {
        return URL(string: "\(strBaseURL)/mount/")!
    }
    
    var path: String {
        switch self {
        case .mounts:
            return ""
        case .mount(let id):
            return "\(id)"
        }
    }
    
    var method: Method {
        switch self {
        case .mounts,
                .mount:
            return .get
        }
    }
    
    var task: Task {
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
