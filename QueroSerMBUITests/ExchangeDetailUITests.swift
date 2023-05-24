//
//  ExchangeDetailUITests.swift
//  QueroSerMBUITests
//
//  Created by Wellysson Avelar on 22/05/23.
//

import XCTest

final class ExchangeDetailUITests: XCTestCase {
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

        let tableView = app.tables["exchangeTableView"]
        XCTAssertTrue(tableView.exists)
        
        let firstCell = tableView.cells.element(boundBy: 0)
        firstCell.tap()
        
        let titleDetailLabel = app.staticTexts["Binance"]
        XCTAssertTrue(titleDetailLabel.exists)
        
        let startDateDetailLabel = app.staticTexts["Início em: 14/07/2017"]
        XCTAssertTrue(startDateDetailLabel.exists)
        
        let firstQuoteDetailLabel = app.staticTexts["Primeira Cotação: 18/12/2017 07:50"]
        XCTAssertTrue(firstQuoteDetailLabel.exists)
        
        let siteButton = app.staticTexts["https://www.binance.com/"]
        XCTAssertTrue(siteButton.exists)
    }
}
