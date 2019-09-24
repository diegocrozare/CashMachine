//
//  CaixaEletronicoUITests.swift
//  CaixaEletronicoUITests
//
//  Created by Diego William Crozare on 17/07/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import XCTest

class CaixaEletronicoUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
        
    }
    
    func testExample() {
        let text = app.textFields["textValue"]
        text.tap()
        text.typeText("260")
        app.buttons["Sacar"].tap()
    }
    
}
