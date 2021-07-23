//
//  CalculatorTests.swift
//  CountOnMeTests
//
//  Created by Valc0d3 on 16/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

final class CalculatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }

    func testGivenCalculator_WhenSum_ThenItReturnsResult() {
        let calculator = Calculator()

        let sut = calculator.sum(1, 2)

        XCTAssertEqual(sut, 3)
    }
    
    func testGivenCalculator_WhenDivision_ThenItReturnsResult() {
        let calculator = Calculator()

        let sut = calculator.division(2, 2)

        XCTAssertEqual(sut, 1)
    }
    
    func testGivenCalculator_WhenSubstraction_ThenItReturnsResult() {
        let calculator = Calculator()

        let sut = calculator.substraction(2, 1)

        XCTAssertEqual(sut, 1)
    }
    
    func testGivenCalculator_WhenMultiplication_ThenItReturnsResult() {
        let calculator = Calculator()

        let sut = calculator.multiplication(2, 1)

        XCTAssertEqual(sut, 2)
    }
    
    
}
