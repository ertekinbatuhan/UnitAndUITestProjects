//
//  SimpleUnitTestTests.swift
//  SimpleUnitTestTests
//
//  Created by Batuhan Berk Ertekin on 9.08.2024.
//

import XCTest
@testable import SimpleUnitTest

final class SimpleUnitTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidFirstName() {
          
          let personal = Personal(firstName: "Batuhan", lastName: "Berk")
          XCTAssertTrue(personal.validFirstName())
          
      }
    
      func testInvalidLastName() {
          
          let personal = Personal(firstName: "Harvey", lastName: "Sp")
          XCTAssertFalse(personal.validLastName())
      }
      
      func testAddPersonal(){
          
          let personal = Personal(firstName: "Batuhan", lastName: "Ertekin")
          let personal2 = Personal(firstName: "Cito", lastName: "Ankara")
          personal.addPersonal(personal: personal)
          personal.addPersonal(personal: personal2)
          
          XCTAssertEqual(personal.worker.count,2)
          XCTAssertFalse(personal.worker.count == 1)
          XCTAssertTrue(personal.firstName.count == 7)
          XCTAssertFalse(personal2.lastName.count > 7 )
      
      }

    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
