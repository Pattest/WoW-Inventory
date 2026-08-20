//
//  MountDetailViewModelTests.swift
//  WoW-InventoryTests
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import XCTest
@testable import WoW_Inventory

final class MountDetailViewModelTests: XCTestCase {

    var viewModel: MountDetailViewModel!

    override func setUpWithError() throws {
        viewModel = MountDetailViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

}
