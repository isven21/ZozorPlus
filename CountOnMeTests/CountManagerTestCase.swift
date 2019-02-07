//
//  CountManagerTestCase.swift
//  CountOnMeTests
//
//  Created by iSven on 31/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountManagerTestCase: XCTestCase {

    var countManager = CountManager()

    func testAddOperatorPlus() {
        _ = countManager.plus()
        XCTAssertEqual(countManager.operators.last, "+")
    }
    func testAddOperatorMinus() {
        _ = countManager.minus()
        XCTAssertEqual(countManager.operators.last, "-")
    }
    func testAddNewNumber() {
        _ = countManager.addNewNumber(1)
        XCTAssert(countManager.stringNumbers.last == "1")
    }
    func testCalculateTotal() {
        _ = countManager.addNewNumber(2)
        _ = countManager.plus()
        _ = countManager.addNewNumber(5)
        _ = countManager.minus()
        _ = countManager.addNewNumber(1)
        XCTAssert(countManager.calculateTotal() == "2+5-1=6")
    }
    func testCanAddDiscount() {
        _ = countManager.operators.last != "-"
        XCTAssert(countManager.canAddDiscount == false)
    }
    func testDiscount() {
        _ = countManager.addNewNumber(15)
        _ = countManager.minus()
        _ = countManager.addNewNumber(33)
        XCTAssert(countManager.calculateNumberWithDiscount() == "10.05")
    }
}
