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
    
    func testIfElementsHaveResult() {
        let calculator = Calculator()
        calculator.elements.append("=")
        calculator.elements.append("123")
        let sut = calculator.expressionHaveResult
        XCTAssertEqual(sut,true)
    }
    
    func testIfcanAddOperator() {
        let calculator = Calculator()
        calculator.elements.append("12")
        let sut = calculator.canAddOperator
        XCTAssertEqual(sut,true)
    }
    
    func testIfcanAddOperatorIsFalse() {
        let calculator = Calculator()
        let sut = calculator.canAddOperator
        XCTAssertEqual(sut,false)
    }
    
    func testIfElementsHaveEnoughElement() {
        let calculator = Calculator()
        calculator.elements.append("2")
        calculator.elements.append("+")
        calculator.elements.append("2")
        let sut = calculator.expressionHaveEnoughElement
        XCTAssertEqual(sut,true)
    }
    
    func testIfexpressionIsCorrect() {
        let calculator = Calculator()
        calculator.elements.append("=")
        let sut = calculator.expressionIsCorrect
        XCTAssertEqual(sut, true)
    }
    
    func testDidTap_AddStringToDiaplayedContent() {
        let calculator = Calculator()
        calculator.didTap("test")
        let sut = calculator.elements[0]
        XCTAssertEqual(sut, "test")
    }
    
    func testAddAnSubstractionSymboleToElements() {
        let calculator = Calculator()
        calculator.addAnSubstractionSymboleToElements()
        let sut = calculator.elements[0]
        XCTAssertEqual(sut, "-")
    }
    
    func testAddAnAdditionSymboleToElements() {
        let calculator = Calculator()
        calculator.addAnAdditionSymboleToElements()
        let sut = calculator.elements[0]
        XCTAssertEqual(sut, "+")
    }
    
    func testSendProcessCalcul() {
        let calculator = Calculator()
        calculator.elements.append("12")
        calculator.elements.append("+")
        calculator.elements.append("12")
        let valueArray = calculator.sendProcessCalcul()
        let sut = valueArray
        XCTAssertEqual(sut, ["24"])
    }

    func testSendProcessCalculIfIsBeASubstraction() {
        let calculator = Calculator()
        calculator.elements.append("12")
        calculator.elements.append("-")
        calculator.elements.append("3")
        let valueArray = calculator.sendProcessCalcul()
        let sut = valueArray
        XCTAssertEqual(sut, ["9"])
    }
}
