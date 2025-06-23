//
//  LoginViewModelTests.swift
//  WoW-InventoryTests
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import XCTest
@testable import WoW_Inventory

final class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testAccessToken() throws {
        let testAccessToken = "testAccessToken"

        viewModel.setAccessToken(testAccessToken)

        let expectedAccessToken = testAccessToken
        let accessToken = viewModel.getAccessToken()
        XCTAssertEqual(accessToken,
                       expectedAccessToken)
    }
}
