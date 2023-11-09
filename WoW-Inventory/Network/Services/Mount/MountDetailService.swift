//
//  MountDetailService.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 23/10/2023.
//

import Foundation

protocol MountDetailServiceProtocol {
    func fetchCreatureDisplayMedia(id: Int, handler: @escaping ([Asset]) -> Void)
}

class MountDetailService: MountDetailServiceProtocol {

    func fetchCreatureDisplayMedia(id: Int,
                                   handler: @escaping ([Asset]) -> Void) {
        DataLoader.shared.fetchCreatureDisplayMedia(id: id) { response in
            guard let response else { return handler([]) }

            do {
                let data = response.data
                let decoder = JSONDecoder()
                let assetData = try decoder.decode(ResponseAsset.self, from: data)
                handler(assetData.assets)

            } catch {
                print("MountDetailService > fetchCreatureDisplayMedia: \(error.localizedDescription)")
                handler([])
            }
        }
    }
}
