//
//  Math_OperationsTests.swift
//  Math OperationsTests
//
//  Created by Batuhan Berk Ertekin on 9.08.2024.
//

import XCTest
@testable import Math_Operations

final class Math_OperationsTests: XCTestCase {

    
    var mathOperations: MathOperations!
    
    override func setUpWithError() throws {
        mathOperations = MathOperations()
    }

    override func tearDownWithError() throws {
        mathOperations = nil
    }

   
    func testAddition() {
          let result = mathOperations.add(number1: 3, number2: 5)
          XCTAssertEqual(result, 8)
      }
      
      func testSubtraction() {
          let result = mathOperations.subtract(number1: 10, number2: 3)
          XCTAssertEqual(result, 7)
      }
      
      func testMultiplication() {
          let result = mathOperations.multiply(number1: 100, number2: 5)
          XCTAssertEqual(result, 500)
      }
      
      func testDivision() {
          let result = mathOperations.divide(number1: 40, number2: 4)
          XCTAssertEqual(result, 10)
      }
      
      func testDivisionByZero() {
          let result = mathOperations.divide(number1: 10, number2: 0)
          XCTAssertEqual(result, 0)
      }
    

    
    
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
