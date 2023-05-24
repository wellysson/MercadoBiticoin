//
//  ViewControllerUITests.swift
//  QueroSerMBUITests
//
//  Created by Wellysson Avelar on 23/05/23.
//

import XCTest

final class ViewControllerUITests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let titleLabel = app.staticTexts["Exchanges"]
        XCTAssertTrue(titleLabel.exists)
        
        let tableView = app.tables["exchangeTableView"]
        XCTAssertTrue(tableView.exists)
        
        let firstCell = tableView.cells.element(boundBy: 0)
    }
}
