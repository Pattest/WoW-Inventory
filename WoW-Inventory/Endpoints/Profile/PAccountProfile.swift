//
//  Warcraft.swift
//  Sport_RxSwift
//
//  Created by Baptiste Cadoux on 20/06/2019.
//  Copyright © 2019 Interactive Mobility. All rights reserved.
//

import Moya

enum PAccountProfile {
    case mounts
}

extension PAccountProfile: ProfileTargetType {

    var baseURL: URL {
        return URL(string: "\(profileBaseURL)/user/wow/")!
    }
    
    var path: String {
        switch self {
        case .mounts:
            return "collections/mounts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mounts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mounts:
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default)
        }
    }
}
