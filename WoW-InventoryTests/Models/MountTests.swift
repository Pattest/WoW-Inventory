//
//  MountTests.swift
//  WoW-InventoryTests
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import XCTest
@testable import WoW_Inventory

final class MountTests: XCTestCase {

    var mount: Mount.Detail!

    override func setUpWithError() throws {
        mount = MockLoader.shared.loadJson(fileName: "Mount")
    }

    override func tearDownWithError() throws {
        mount = nil
    }

    func testMountAttributes() throws {
        // Id
        XCTAssertEqual(mount.id,
                       6)

        // Name
        XCTAssertEqual(mount.name,
                       "Cheval bai")

        // Faction
        XCTAssertEqual(mount.faction!.name.uppercased(),
                       FactionType.alliance.rawValue)
    }

    func testGetDescription() throws {
        XCTAssertEqual(mount.getDescription(),
                       "Très apprécié des gardes de Hurlevent en raison de sa patience et de son endurance.")
    }

    func testGetCreatureDisplays() throws {
        let creatureDisplay = mount.getCreatureDisplays().first

        XCTAssertNotNil(creatureDisplay)

        XCTAssertEqual(creatureDisplay!.id,
                       2404)
    }
}
