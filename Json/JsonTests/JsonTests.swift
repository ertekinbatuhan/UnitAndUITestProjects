//
//  JsonTests.swift
//  JsonTests
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import XCTest
@testable import Json

final class JsonTests: XCTestCase {
    
    private var sutUserViewModel : UserViewModel!
    private var userService : MockUserService!
    private var viewModelProtocol : MockUserViewModelProtocol!
  
    override func setUpWithError() throws {
        userService = MockUserService()
        sutUserViewModel = UserViewModel(userService: userService)
        viewModelProtocol = MockUserViewModelProtocol()
        sutUserViewModel.viewModelProtocol = viewModelProtocol
    }
    
    override func tearDownWithError() throws {
        userService = nil
        sutUserViewModel  = nil
    }
    
    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        
        let mockUser = User(id: 1, name: "Batuhan", username: "ertekin", email: "batuhan@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        sutUserViewModel.fetchUsers()
        
        XCTAssertEqual(viewModelProtocol.updateViewArray.first?.userName, "ertekin")
    }
    
    func testUpdateView_whenAPIFailer_showsNoUser() throws {
        
        userService.fetchUserMockResult = .failure(NSError())
        sutUserViewModel.fetchUsers()
        XCTAssertEqual(viewModelProtocol.updateViewArray.first?.name, "No user")
    }


}

class MockUserService : UserService {
    
    var fetchUserMockResult : Result<Json.User, any Error>?
    
    func fetchUser(completion: @escaping (Result<Json.User, any Error>) -> Void) {
        
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
    
}

class MockUserViewModelProtocol : UserViewModelProtocol {
    
    var updateViewArray : [(name : String ,userName : String ,email : String)] = []
    
    func updateView(name: String, userName: String, email: String) {
        updateViewArray.append((name,userName,email))
    }
    
    
}
