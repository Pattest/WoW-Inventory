//
//  Warcraft.swift
//  Sport_RxSwift
//
//  Created by Baptiste Cadoux on 20/06/2019.
//  Copyright © 2019 Interactive Mobility. All rights reserved.
//

import Moya
import Foundation

enum PAccountProfile {
    case mounts
}

extension PAccountProfile: ProfileTargetType {

    var strBaseURL: String {
        return "\(WICredentials.shared.baseURL)/profile/user/wow/"
    }

    var baseURL: URL {
        return URL(string: strBaseURL)!
    }

    var path: String {
        switch self {
        case .mounts:
            return "/collections/mounts"
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
                encoding: URLEncoding.default
            )
        }
    }
}
