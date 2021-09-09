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

//

    func testIfcanAddOperator_and_addAnAdditionSymboleToElements() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "= 2")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("1")
        calculator.addAnAdditionSymboleToElements()
        calculator.didTap("1")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testIfcanAddOperator_and_addAnDivisionSymboleToElements() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "= 1")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("2")
        calculator.addAnSubstractionSymboleToElements()
        calculator.didTap("1")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testIfcanAddOperatorIsFalse() {
        let calculator = Calculator()

        calculator.didTap("2")
        calculator.addAnSubstractionSymboleToElements()
        let sut = calculator.canAddOperator
        XCTAssertEqual(sut, false)

    }

    func testIfElementsHaveEnoughElement() {
        let calculator = Calculator()

        calculator.didTap("2")
        calculator.didTap("+")
        calculator.didTap("2")
        let sut = calculator.expressionHaveEnoughElement
        XCTAssertEqual(sut, true)
    }

    func testIfexpressionIsCorrect() {
        let calculator = Calculator()
        calculator.didTap("=")
        let sut = calculator.expressionIsCorrect
        XCTAssertEqual(sut, true)
    }
//    func testThatDivideByWeroRiseAnError() {
//        let expectation = self.expectation(description: "Returned Alert")
//        let calculator = Calculator()
//
//        calculator.displayedAlert = { alertContent in
//            XCTAssertEqual(alertContent.message, "La division par zero est interdite.")
//            expectation.fulfill()
//        }
//
//        calculator.didTap("1")
//        //calculator.addAnDivisionSymboleToElements()
//        calculator.didTap("0")
//        calculator.processCalcul()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
}
