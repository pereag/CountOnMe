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

    func testIfAddAnAdditionSymboleToElements() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 0
        calculator.displayedText = { text in
            if counter == 5 {
                XCTAssertEqual(text, "12")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("1")
        calculator.didTap("1")
        calculator.addAnAdditionSymboleToElements()
        calculator.didTap("1")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testIfProcessCalculIsCalledWhenLessThreeElements() {
        let expectation = self.expectation(description: "Returned  operator alerte")
        let calculator = Calculator()

        calculator.displayedAlert = { alert in
            XCTAssertEqual(alert.title, "Alert")
            XCTAssertEqual(alert.message, "Entrez une expression correcte !")
            XCTAssertEqual(alert.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("1")
        calculator.addAnAdditionSymboleToElements()
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testIfProcessCalculIsCalledWhenLessTwoElements() {
        let expectation = self.expectation(description: "Returned  operator alerte")
        let calculator = Calculator()

        calculator.displayedAlert = { alert in
            XCTAssertEqual(alert.title, "Alert")
            XCTAssertEqual(alert.message, "Démarrez un nouveau calcul !")
            XCTAssertEqual(alert.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("1")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testStartedAnOtherOperationAfterResult() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 0
        calculator.displayedText = { text in
            if counter == 7 {
                XCTAssertEqual(text, "1")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("1")
        calculator.didTap("1")
        calculator.addAnAdditionSymboleToElements()
        calculator.didTap("1")
        calculator.processCalcul()
        calculator.didTap("1")

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenACalculator_WhenPresstwiceAddition_ThenItReturnsAnALert() {
        let expectation = self.expectation(description: "Returned  operator alerte")
        let calculator = Calculator()

        calculator.displayedAlert = { alert in
            XCTAssertEqual(alert.title, "Alert")
            XCTAssertEqual(alert.message, "Un opérateur est déjà mis!")
            XCTAssertEqual(alert.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("1")
        calculator.addAnAdditionSymboleToElements()
        calculator.addAnAdditionSymboleToElements()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenACalculator_WhenDivideByZero_ThemItReturnAnAlert() {
        let expectation = self.expectation(description: "Return Divide by zero alert")
        let calculator = Calculator()

        calculator.displayedAlert = { alerte in
            XCTAssertEqual(alerte.title, "Alert")
            XCTAssertEqual(alerte.message, "Vous ne pouvez pas diviser par 0 !")
            XCTAssertEqual(alerte.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("34")
        calculator.addAnDivisionSymboleToElements()
        calculator.didTap("0")

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenACalculator_WhenAddTwoSubstrationSymbole() {
        let expectation = self.expectation(description: "Return Alert Operatorº ")
        let calculator = Calculator()

        calculator.displayedAlert = { alerte in
            XCTAssertEqual(alerte.title, "Alert")
            XCTAssertEqual(alerte.message, "Un opérateur est déjà mis!")
            XCTAssertEqual(alerte.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("34")
        calculator.addAnSubstractionSymboleToElements()
        calculator.addAnSubstractionSymboleToElements()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenACalculator_WhenAddTwoDivisionSymbole() {
        let expectation = self.expectation(description: "Return Alert Operatorº ")
        let calculator = Calculator()

        calculator.displayedAlert = { alerte in
            XCTAssertEqual(alerte.title, "Alert")
            XCTAssertEqual(alerte.message, "Un opérateur est déjà mis!")
            XCTAssertEqual(alerte.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("34")
        calculator.addAnDivisionSymboleToElements()
        calculator.addAnDivisionSymboleToElements()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenACalculator_WhenAddMultipicationSymboleAfterAnOther() {
        let expectation = self.expectation(description: "Return Alert Operatorº ")
        let calculator = Calculator()

        calculator.displayedAlert = { alerte in
            XCTAssertEqual(alerte.title, "Alert")
            XCTAssertEqual(alerte.message, "Un opérateur est déjà mis!")
            XCTAssertEqual(alerte.cancelTitle, "Ok")
            expectation.fulfill()
        }

        calculator.didTap("34")
        calculator.addAnMultiplicationSymboleToElements()
        calculator.addAnMultiplicationSymboleToElements()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testAddAnSubstractionToElements() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "1")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("3")
        calculator.addAnSubstractionSymboleToElements()
        calculator.didTap("2")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testAddAnDivisionSymboleToElements() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "2")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("4")
        calculator.addAnDivisionSymboleToElements()
        calculator.didTap("2")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testAddAnMultiplicationSymboleToElements() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "32")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("4")
        calculator.addAnMultiplicationSymboleToElements()
        calculator.didTap("8")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func  testIfexpressionHaveEnoughElement() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "2")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("4")
        calculator.addAnDivisionSymboleToElements()
        calculator.didTap("2")
        calculator.processCalcul()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func  testIfexpressionHaveEnoughElement_is_false() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        var counter = 1
        calculator.displayedText = { text in
            if counter == 2 {
                XCTAssertEqual(text, "4/")
                expectation.fulfill()
            }
            counter+=1
        }

        calculator.didTap("4")
        calculator.addAnDivisionSymboleToElements()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

// test canAddOperator

    func  testIfcanAddOperator() {
        let expectation = self.expectation(description: "Returned text")
        let calculator = Calculator()

        calculator.displayedText = { text in
            XCTAssertEqual(text, "4")
            expectation.fulfill()
        }

        calculator.didTap("4")

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
