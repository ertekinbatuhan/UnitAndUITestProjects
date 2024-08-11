//
//  ProgrammaticTestUITests.swift
//  ProgrammaticTestUITests
//
//  Created by Batuhan Berk Ertekin on 11.08.2024.
//

import XCTest

final class ProgrammaticTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtons(){
        let app = XCUIApplication()
        app.launch()
        let nextButton = app.staticTexts["Next Page"]
        let navigationBarButton = app.navigationBars["Items"].buttons["Back"]
        nextButton.tap()
        navigationBarButton.tap()
    }
    
    func testTextFields() {
        // Given
        let app = XCUIApplication()
        app.launch()

        // When
        let firstTextField = app.textFields["First Text Field"]
        let secondTextField = app.textFields["Second Text Field"]
        
        firstTextField.tap()
        firstTextField.typeText("This is a test")
        
        secondTextField.tap()
        secondTextField.typeText("This is a test")
        
        // Then
        XCTAssertEqual(firstTextField.value as? String, "This is a test")
        XCTAssertEqual(secondTextField.value as? String, "This is a test")
    }

    
    func testTableViewDeleteButton() {
        // given
        let app = XCUIApplication()
        app.launch()
        let nextButton = app.staticTexts["Next Page"]
        nextButton.tap()
        
        let tablesQuery = app.tables
        let initialCellCount = tablesQuery.cells.count

        // Then
        XCTAssertEqual(initialCellCount, 3)
        
        // When
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        firstCell.swipeLeft()
        firstCell.buttons["Delete"].tap()
        
        // Then
        let finalCellCount = tablesQuery.cells.count
        XCTAssertEqual(finalCellCount, 2)
    }

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
