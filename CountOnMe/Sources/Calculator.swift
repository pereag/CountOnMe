//
//  Calculator.swift
//  CountOnMe
//
//  Created by Valc0d3 on 16/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

 final class Calculator {

    // MARK: - Properties

    private var elements: [String] = [] {
        didSet {
            displayedText?(elements.joined())
        }
    }

    private var finish = false

    // MARK: - Outputs

    var displayedText: ((String) -> Void)?

    var displayedAlert: ((AlertContent) -> Void)?

    // var displayedAlert: ((String, String, String) -> Void)?

    // MARK: - Inputs

    func didTap(_ text: String) {

        if let lastElement = elements.last {
            if !["+", "-", "/", "x"].contains(lastElement) {
                let newLast = lastElement + text
                elements.removeLast()
                elements.append(newLast)
            } else {
                elements.append(text)
            }
        } else {
            elements.append(text)
        }
    }

    func addAnAdditionSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("+")
        } else {
            let alertContent = AlertContent(
                title: "Zéro!",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
        }
    }

    func addAnSubstractionSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("-")
        } else {
            let alertContent = AlertContent(
                title: "Zéro!",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
        }
    }

    func addAnDivisionSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("/")
        } else {
            let alertContent = AlertContent(
                title: "Zéro!",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
        }
    }

    func addAnMultiplicationSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("x")
        } else {
            let alertContent = AlertContent(
                title: "Zéro!",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
        }
    }

    func processCalcul() {
        if !expressionIsCorrect {
            let alertContent = AlertContent(
                title: "Zéro!",
                message: "Entrez une expression correcte !",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
        } else if !expressionHaveEnoughElement {
            let alertContent = AlertContent(
                title: "Zéro!",
                message: "Démarrez un nouveau calcul !",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
        }
        var operationsToReduce = elements
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            print(left)
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!

            let result: Double
            switch operand {
                case "+": result = self.sum(Double(left), Double(right))
                case "-": result = self.substraction(Double(left), Double(right))
                case "x": result = self.multiplication(Double(left), Double(right))
                case "/": result = self.division(Double(left), Double(right))
                default: fatalError("Unknown operator !")
            }

            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            formatter.numberStyle = NumberFormatter.Style.decimal

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(formatter.string(from: NSNumber(value: result)) ?? "0")", at: 0)
            self.finish = true
        }
        elements = operationsToReduce
    }

    func deleteAllItemsInElementsIfOperationIsFinish() {
        if finish == true {
            elements.removeAll()
            self.finish = false
        }
    }

    func sum(_ a: Double, _ b: Double) -> Double {
        return a + b
    }

    func division(_ a: Double, _ b: Double) -> Double {
        return a / b

    }

    func substraction(_ a: Double, _ b: Double) -> Double {
        return a - b
    }

    func multiplication(_ a: Double, _ b: Double) -> Double {
        return a * b
    }

    // MARK: - Error check computed variables

    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.count > 0
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.count > 0 && elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
}
