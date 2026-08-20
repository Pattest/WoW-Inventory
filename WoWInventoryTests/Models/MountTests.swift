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

    func testGetId() throws {
        let expectedId = 6

        XCTAssertEqual(mount.id,
                       expectedId)
    }

    func testGetName() throws {
        let expectedName = "Cheval bai"

        XCTAssertEqual(mount.name,
                       expectedName)
    }

    func testGetFaction() {
        let expectedFaction = FactionType.alliance.rawValue

        XCTAssertEqual(mount.faction!.name.uppercased(),
                       expectedFaction)
    }

    func testGetDescription() throws {
        let expectedDescription = "Très apprécié des gardes de Hurlevent en raison de sa patience et de son endurance."
        XCTAssertEqual(mount.getDescription(),
                       expectedDescription)
    }

    func testGetCreatureDisplays() throws {
        let creatureDisplay = mount.getCreatureDisplays().first

        XCTAssertNotNil(creatureDisplay)

        let expectedId = 2404
        XCTAssertEqual(creatureDisplay!.id,
                       expectedId)
    }
}
