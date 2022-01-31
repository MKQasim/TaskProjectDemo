//
//  LoginApiResourceUnitTests.swift
//  TaskProjectDemoTests
//
//  Created by Muhammad Qasim Muhammad Mubeen on 31/01/2022.
//

import XCTest
@testable import TaskProjectDemo

class LoginApiResourceUnitTests: XCTestCase {

    func testLogin_API_Validation_With_EmptyString_Returns_Validations_Failure_Response(){
        let request = KQLogin.Api.Request(email: "", password: "")
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
        let expectations = expectation(description:"Failure_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLogin_API_Validation_With_EmptyEmail_Returns_Validations_Failure_Response(){
        let request = KQLogin.Api.Request(email: "", password: "12345678")
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
        
        let expectations = expectation(description:"Failure_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testLogin_API_Validation_With_EmptyPassword_Returns_Validations_Failure_Response(){
        let request = KQLogin.Api.Request(email: "kamqasim1@gmail.com", password: "")
        let validationResponse = KQLoginWorker().validateInputs(request: request)
        XCTAssertFalse(validationResponse.isValidate)
        XCTAssertNotNil(validationResponse.message)
        XCTAssertEqual(validationResponse.message, "Email or password can not be empty")
        
        let expectations = expectation(description:"Failure_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLogin_Worker_Validation_With_ValidEmail_Returns_Validations_Failure_Response(){
        let request = KQLogin.Api.Request(email: "kamqasim1@gmail.com", password: "")
        let validationResponse = !KQLoginWorker().isValidEmail(email: "kamqasim1@gmail.co")
        XCTAssertFalse(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, false)
        
        
        let expectations = expectation(description:"Failure_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testLogin_Worker_Validation_With_ValidPassword_Returns_Validations_Failure_Response(){
        let request = KQLogin.Api.Request(email: "kamqasim1@gmail.com", password: "")
        let validationResponse = KQLoginWorker().isValidEmail(email: "123456")
        XCTAssertFalse(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, false)
        let expectations = expectation(description:"Failure_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLogin_Worker_Validation_With_ValidEmail_Returns_Validations_Success_Response(){
        let request = KQLogin.Api.Request(email: "kamqasim1@gmail.com", password: "")
        let validationResponse = KQLoginWorker().isValidEmail(email: "kamqasim1@gmail.com")
        XCTAssertTrue(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, true)
        
        let expectations = expectation(description:"Success_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLogin_Worker_Validation_With_ValidPassword_Returns_Validations_Success_Response(){
        let request = KQLogin.Api.Request(email: "kamqasim1@gmail.com", password: "")
        let validationResponse = KQLoginWorker().isValidPassword(testStr: "12345678")
        XCTAssertTrue(validationResponse)
        XCTAssertNotNil(validationResponse)
        XCTAssertEqual(validationResponse, true)
        
        let expectations = expectation(description:"Success_Response")
        KQLoginInteractor().userLogin(parameters: ["email":request.email,"password":request.password]) { loginModel, error in
            XCTAssertNotNil(loginModel)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
