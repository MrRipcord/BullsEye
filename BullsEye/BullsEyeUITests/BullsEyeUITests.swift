//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Bobby McBride on 10/25/18.
//  Copyright © 2018 Bobby McBride. All rights reserved.
//

import XCTest

class BullsEyeUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMainScreen() {
        XCTAssert(app.staticTexts["Place the Bull's Eye as close as you can to:"].exists)
        XCTAssert(app.images["49%"].exists)
        XCTAssert(app.staticTexts["100"].exists)
        XCTAssert(app.staticTexts["1"].exists)
        XCTAssert(app.staticTexts["Score:"].exists)
        XCTAssert(app.staticTexts["0"].exists)
        XCTAssert(app.staticTexts["Stage:"].exists)
        XCTAssert(app.buttons["crossbow512"].exists)
        app.buttons["crossbow512"].tap()
        XCTAssert(app.alerts.buttons["Okay!"].exists)
        app.alerts.buttons["Okay!"].tap()
        XCTAssert(app.buttons["resetButton"].exists)
        XCTAssert(app.buttons["info round button512a"].exists)
    }
    
    func testAboutScreen() {
        app.buttons["info round button512a"].tap()
        XCTAssert(app.buttons["about"].exists)
        XCTAssert(app.buttons["CloseButton512"].exists)
    }
    
    func testAuthorScreen() {
        let closebutton512Button = app.buttons["CloseButton512"]
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        
        app.buttons["info round button512a"].tap()
        app.buttons["about"].tap()
        XCTAssert(closebutton512Button.exists)
        XCTAssert(element.exists)
        closebutton512Button.tap()
        closebutton512Button.tap()
        
    }
    
}
