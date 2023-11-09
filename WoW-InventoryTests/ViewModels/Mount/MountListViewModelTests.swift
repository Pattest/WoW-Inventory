//
//  MountListViewModelTests.swift
//  WoW-InventoryTests
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import XCTest
@testable import WoW_Inventory

final class MountListViewModelTests: XCTestCase {

    var viewModel: MountListViewModel!

    override func setUpWithError() throws {
        viewModel = MountListViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func funcTestMounts() throws {
        XCTAssertNil(viewModel.selectedMount)

        viewModel.mounts = MockLoader.shared.loadJsonArray(fileName: "Mounts")
        let selectedMount = viewModel.mounts[3]
        viewModel.selectedMount = selectedMount

        let expectedName = "Loup des bois"
        XCTAssertEqual(viewModel.selectedMount!.detail.name,
                       expectedName)
    }

}
