//
//  LoginValidationUnitTests.swift
//  TaskProjectDemoTests
//
//  Created by Muhammad Qasim Muhammad Mubeen on 30/01/2022.
//

import XCTest
@testable import TaskProjectDemo

class LoginValidationUnitTests: XCTestCase {


    func testLogin_Worker_Validation_With_EmptyString_Returns_Validations_Failure(){
        let request = KQLogin.Something.Request(email: "", password: "")
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
    }
    
    func testLogin_Worker_Validation_With_EmptyEmail_Returns_Validations_Failure(){
        let request = KQLogin.Something.Request(email: "", password: "12345678")
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
    }
    
    func testLogin_Worker_Validation_With_EmptyPassword_Returns_Validations_Failure(){
        let request = KQLogin.Something.Request(email: "kamqasim1@gmail.com", password: "")
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
    }
    
    func testLogin_Worker_Validation_With_ValidEmail_Returns_Validations_Failure(){
        let validationResponse = !KQLoginWorker().isValidEmail(email: "kamqasim1@gmail.co")
        XCTAssertFalse(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, false)
        
    }
    
    func testLogin_Worker_Validation_With_ValidPassword_Returns_Validations_Failure(){
        let validationResponse = KQLoginWorker().isValidEmail(email: "123456")
        XCTAssertFalse(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, false)
    }
    
    func testLogin_Worker_Validation_With_ValidEmail_Returns_Validations_Success(){
        let validationResponse = KQLoginWorker().isValidEmail(email: "kamqasim1@gmail.com")
        XCTAssertTrue(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, true)
    }
    
    func testLogin_Worker_Validation_With_ValidPassword_Returns_Validations_Success(){
        let validationResponse = KQLoginWorker().isValidPassword(testStr: "12345678")
        XCTAssertTrue(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, true)
    }
}
