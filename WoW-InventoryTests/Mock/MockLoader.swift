//
//  MockLoader.swift
//  WoW-InventoryTests
//
//  Created by Baptiste Cadoux on 31/10/2023.
//

import Foundation

class MockLoader {

    static let shared = MockLoader()

    func loadJson<T: Decodable>(fileName: String, extName: String = "json") -> T? {

        guard let dataSourceURL = Bundle.main.url(forResource: fileName,
                                                  withExtension: extName)
        else {
            return nil
        }

        let data = try! Data(contentsOf: dataSourceURL)
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            return result

        } catch {
            print(error.localizedDescription)
        }

        return nil
    }
}
