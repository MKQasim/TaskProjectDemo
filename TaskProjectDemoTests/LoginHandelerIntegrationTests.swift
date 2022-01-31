//
//  LoginHandelerIntegrationTests.swift
//  TaskProjectDemoTests
//
//  Created by Muhammad Qasim Muhammad Mubeen on 31/01/2022.
//

import XCTest
@testable import TaskProjectDemo

class LoginHandelerIntegrationTests: XCTestCase {

    func testLoginHandler_With_Valid_Request_Returns_LoginData(){
        let request = KQLogin.Api.Request(email: "kamqasim1@gmail.com", password: "12345678")
        let businessHandler = UserBusiness()
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
        let loginExpectations = expectation(description: "Valid_Request_Returns_LoginData")
        businessHandler.login(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            loginExpectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
