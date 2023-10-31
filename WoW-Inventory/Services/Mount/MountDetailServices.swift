//
//  MountDetailServices.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 23/10/2023.
//

import Moya

class MountDetailServices {

    func fetchCreatureDisplayMedia(id: Int,
                                   handler: @escaping ([Asset]) -> Void) {
        MoyaProvider<GDCreature>().request(.creatureDisplayMedia(id: id)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let assetData = try decoder.decode(ResponseAsset.self, from: data)
                    handler(assetData.assets)

                } catch {
                    print("fetchCreatureDisplay: \(error.localizedDescription)")
                    handler([])
                }

            case let .failure(error):
                print("fetchCreatureDisplay: \(error)")
                handler([])
            }
        }
    }
}
