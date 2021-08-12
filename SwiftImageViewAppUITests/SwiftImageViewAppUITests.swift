//
//  SwiftImageViewAppUITests.swift
//  SwiftImageViewAppUITests
//
//  Created by HungNV on 4/14/21.
//  Copyright © 2021 NIFTY Corporation. All rights reserved.
//

import XCTest

class SwiftImageViewAppUITests: XCTestCase {
    var app: XCUIApplication!
    var toolbar: XCUIElement!
    var image: XCUIElement!
    let msgSuccess = "OK"
    let msgFail = "NG エラーコード："
    
    // MARK: - Setup for UI Test
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        image = app.images["image"]
        toolbar = app.toolbars["Toolbar"]
    }
    
    func testDownloadImage() throws {
        app.launch()
        XCTAssert(app.staticTexts["SwiftImageViewApp"].exists)
        let btnDownload = toolbar.buttons["Download"]
        XCTAssert(btnDownload.exists)
        btnDownload.tap()
        if app.staticTexts[msgSuccess].waitForExistence(timeout: 20) {
            XCTAssert(app.staticTexts[msgSuccess].exists)
            XCTAssert(image.exists)
        } else {
            let failPredicate = NSPredicate(format: "label BEGINSWITH '\(msgFail)'")
            let lblError = app.staticTexts.element(matching: failPredicate)
            XCTAssert(lblError.exists)
        }
    }
}
