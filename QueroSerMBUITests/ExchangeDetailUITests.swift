//
//  ExchangeDetailUITests.swift
//  QueroSerMBUITests
//
//  Created by Wellysson Avelar on 22/05/23.
//

import XCTest

final class ExchangeDetailUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func testExchangeDetailView() throws {
            // Navegar para a tela de detalhes da exchange
            
            // Por exemplo, selecione um elemento da lista na tela inicial
//            let tableView = app.tables["exchangeTableView"]
//            XCTAssertTrue(tableView.exists)
            
//            let firstCell = tableView.cells.element(boundBy: 0)
//            XCTAssertTrue(firstCell.exists)
//            firstCell.tap()
//
//            // Verificar se os elementos da tela de detalhes estão visíveis e contêm os valores corretos
//
            let logoImage = app.images["logoImage"]
            XCTAssertTrue(logoImage.exists)
//
//            let nameLabel = app.staticTexts["nameLabel"]
//            XCTAssertTrue(nameLabel.exists)
//            XCTAssertEqual(nameLabel.label, "Nome da Exchange")
//
//            let startDateLabel = app.staticTexts["startDateLabel"]
//            XCTAssertTrue(startDateLabel.exists)
//            XCTAssertEqual(startDateLabel.label, "Início em: 01/01/2023")
//
//            // Continue verificando os outros elementos da interface
//
//            // Testar a ação do botão do site
//
//            let siteButton = app.buttons["siteButton"]
//            XCTAssertTrue(siteButton.exists)
//
//            siteButton.tap()
            
            // Verificar se o navegador é aberto corretamente
            
            // Aqui você pode adicionar asserções adicionais para verificar se o navegador foi aberto corretamente
        }
}
