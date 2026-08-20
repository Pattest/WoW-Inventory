//
//  HomeViewModelTests.swift
//  WoW-InventoryTests
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import XCTest
@testable import WoW_Inventory

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testGetCellTypes() throws {
        let cellTypes = viewModel.cellTypes

        let expectedCount = 1
        XCTAssertEqual(cellTypes.count,
                       expectedCount)

        let expectedCellType: HomeCellType = .mount
        XCTAssertEqual(cellTypes[0], 
                       expectedCellType)
    }

}
