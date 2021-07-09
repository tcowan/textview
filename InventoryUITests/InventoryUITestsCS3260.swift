//
//  InventoryUITestsCS3260.swift
//  InventoryUITests
//
//  Created by Ted Cowan on 10/13/18.
//  Copyright © 2018 Ted Cowan. All rights reserved.
//

import XCTest

class InventoryUITestsCS3260: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddItems() {
        
        let sampleItems = [("Item one", "This is item one"),
                           ("Item two", "This is item two"),
                           ("Item three", "This is item three"),
        ]

        for i in 0..<sampleItems.count {
            app.navigationBars["Inventory"].buttons["Add"].tap()

            app.textFields["addShortDescription"].tap()
            app.textFields["addShortDescription"].typeText(sampleItems[i].0)
            sleep(3)
            app.textViews.element.tap()
            sleep(3)
            app.textViews.element.typeText(sampleItems[i].1)
            app.navigationBars["Add New Item"].buttons["Save"].tap()
        }
    }
    
}
