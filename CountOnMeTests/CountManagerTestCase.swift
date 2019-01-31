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

    var countManager: CountManager!
    override func setUp() {
        super.setUp()
        countManager = CountManager()
    }
}
