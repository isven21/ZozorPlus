//
//  CountManagerTestCase.swift
//  CountOnMeTests
//
//  Created by iSven on 10/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountManagerTestCase: XCTestCase {
    var countManager = CountManager()
    var viewController = ViewController()
    func testAddNewNumber() {
        _ = countManager.addNewNumber(1)
        XCTAssert(countManager.stringNumbers.last == "1")
    }
    func testCalculateTotal1() {
        _ = countManager.addNewNumber(2)
        _ = countManager.plus()
        _ = countManager.addNewNumber(5)
        _ = countManager.minus()
        _ = countManager.addNewNumber(1)
        XCTAssert(countManager.calculateTotal() == "2+5-1=6")
    }
    func testcalculateTotal2() {
        _ = countManager.isExpressionCorrect == false
        XCTAssert(countManager.calculateTotal() == "")
    }
    func testIsExpressionCorrect1() {
        _ = countManager.addNewNumber(1)
        _ = countManager.plus()
        XCTAssertFalse(countManager.isExpressionCorrect)
    }
    func testCanAddOperator() {
        _ = countManager.operators.last?.isEmpty
        _ = countManager.stringNumbers.count != 1
        XCTAssert(countManager.canAddOperator == false)
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
    func testReset() {
        _ = countManager.reset()
        XCTAssert(countManager.operators == ["+"])
        XCTAssert(countManager.stringNumbers == [""])
    }
}
