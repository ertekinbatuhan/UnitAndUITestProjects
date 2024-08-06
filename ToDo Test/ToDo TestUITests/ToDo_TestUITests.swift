//
//  ToDo_TestUITests.swift
//  ToDo TestUITests
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import XCTest

final class ToDo_TestUITests: XCTestCase {

    func testAddButton() throws {
       
        let app = XCUIApplication()
        app.launch()
        
        let addButton =  app.navigationBars["Title"].buttons["Item"]
        let elementsQuery = app.alerts["Add To Do"].scrollViews.otherElements
        let textField =  elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter something"]/*[[".cells.textFields[\"Enter something\"]",".textFields[\"Enter something\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okeyButton =  elementsQuery.buttons["Okey "]
        let addedCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["batuhan"]/*[[".cells.staticTexts[\"batuhan\"]",".staticTexts[\"batuhan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        addButton.tap()
        textField.tap()
        textField.typeText("batuhan")
        okeyButton.tap()
        
        XCTAssertTrue(addedCell.exists)
        
    }
       
    func testDeleteButton() throws {
        
        let app = XCUIApplication()
        app.launch()
            
        let addButton =  app.navigationBars["Title"].buttons["Item"]
        let elementsQuery = app.alerts["Add To Do"].scrollViews.otherElements
        let textField =  elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter something"]/*[[".cells.textFields[\"Enter something\"]",".textFields[\"Enter something\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okeyButton =  elementsQuery.buttons["Okey "]
        let addedCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["batuhan"]/*[[".cells.staticTexts[\"batuhan\"]",".staticTexts[\"batuhan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
            
        addButton.tap()
        textField.tap()
        textField.typeText("batuhan")
        okeyButton.tap()
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
            
    }
}
