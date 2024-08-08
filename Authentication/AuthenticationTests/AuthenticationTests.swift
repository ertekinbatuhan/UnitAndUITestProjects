//
//  AuthenticationTests.swift
//  AuthenticationTests
//
//  Created by Batuhan Berk Ertekin on 8.08.2024.
//

import XCTest
@testable import Authentication

final class AuthenticationTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    private var loginService : MockLoginService!
    private var output : MockRootViewModelOutput!
        

    override func setUpWithError() throws {
        
        loginService = MockLoginService()
        viewModel = RootViewModel(loginService: loginService)
        output = MockRootViewModelOutput()
        
        viewModel.output = output
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginService = nil
        output = nil
    }
    
    
    func testShowLogin_whenLoginServiceReturnsEmtpyUserAccessToken() throws {
        
        loginService.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
    func testShowMainApp_whenLoginServiceReturnsUserAccessToken() throws {
        
        loginService.storage["ACCESS_TOKEN"] = "4334433KFDSO32"
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .mainApp)
    }
    
    func testShowMainApp_whenLoginServiceReturnsEmptyString() throws {
        
        loginService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
}


class MockLoginService : LoginService {
    var userAccessTokenKey: String {
        
        return "ACCESS_TOKEN"
    }
    var storage  : [String : String] = [:]
    
    func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
}

class MockRootViewModelOutput : RootViewModelOutput {
    
    enum Check {
        case login
        case mainApp
        
    }
    var checkArray : [Check] = []
    
    func showMain() {
        checkArray.append(.mainApp)
    }
    
    func showLogin() {
        checkArray.append(.login)
    }
    
    
}
