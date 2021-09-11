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

    // MARK: - Inputs

    func didTap(_ text: String) {
        deleteAllItemsInElementsIfOperationIsFinish()
        if let lastElement = elements.last {
            if lastElement == "/" && text == "0" {
                let alertContent = AlertContent(
                    title: "Alert",
                    message: "Vous ne pouvez pas diviser par 0 !",
                    cancelTitle: "Ok"
                )
                displayedAlert?(alertContent)
                return
            }
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
                title: "Alert",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
            return
        }
    }

    func addAnSubstractionSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("-")
        } else {
            let alertContent = AlertContent(
                title: "Alert",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
            return
        }
    }

    func addAnDivisionSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("/")
        } else {
            let alertContent = AlertContent(
                title: "Alert",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
            return
        }
    }

    func addAnMultiplicationSymboleToElements() {
        deleteAllItemsInElementsIfOperationIsFinish()
        if canAddOperator {
            elements.append("x")
        } else {
            let alertContent = AlertContent(
                title: "Alert",
                message: "Un opérateur est déjà mis!",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
            return
        }
    }

    func processCalcul() {
        if !expressionIsCorrect {
            let alertContent = AlertContent(
                title: "Alert",
                message: "Entrez une expression correcte !",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
            return
        } else if !expressionHaveEnoughElement {
            let alertContent = AlertContent(
                title: "Alert",
                message: "Démarrez un nouveau calcul !",
                cancelTitle: "Ok"
            )
            displayedAlert?(alertContent)
            return
        }
        var operationsToReduce = elements
        var result: Double
        while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
            if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "/" }) {
                let left = Double(operationsToReduce[index-1])!
                let `operator` = operationsToReduce[index]
                let right = Double(operationsToReduce[index+1])!
                switch `operator` {
                case "x":
                    result = multiplication(left, right)
                    operationsToReduce.insert("\(result)", at: index-1)
                    operationsToReduce.remove(at: index)
                    operationsToReduce.remove(at: index)
                    operationsToReduce.remove(at: index)
                case "/":
                    result = division(left, right)
                    operationsToReduce.insert("\(result)", at: index-1)
                    operationsToReduce.remove(at: index)
                    operationsToReduce.remove(at: index)
                    operationsToReduce.remove(at: index)
                default: break
                }
            }
            if operationsToReduce.count <= 1 {
                self.finish = true
                result = Double(operationsToReduce[0])!
                let formatter = self.formatterNumber()
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(formatter.string(for: NSNumber(value: result)) ?? "0")", at: 0)
            }
        }
        // Iterate over operations while an operand still here
        while operationsToReduce.contains("+") || operationsToReduce.contains("-") {
            let left = Double(operationsToReduce[0])!
            let `operator` = operationsToReduce[1]
            let right = Double(operationsToReduce[2])!
            switch `operator` {
            case "+":result = self.sum(left, right)
            case "-":result = self.substraction(left, right)
            default: fatalError("Unknown operator !")
            }
            self.finish = true
            let formatter = self.formatterNumber()
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(formatter.string(for: NSNumber(value: result)) ?? "0")", at: 0)
        }
        elements = operationsToReduce
    }

    // MARK: - Private
    private func formatterNumber() -> Formatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }
    private func deleteAllItemsInElementsIfOperationIsFinish() {
        if finish == true {
            elements.removeAll()
            self.finish = false
        }
    }

    private func sum(_ left: Double, _ right: Double) -> Double {
        return left + right
    }

    private func division(_ left: Double, _ right: Double) -> Double {
        return left / right

    }

    private func substraction(_ left: Double, _ right: Double) -> Double {
        return left - right
    }

    private func multiplication(_ left: Double, _ right: Double) -> Double {
        return left * right
    }

    // MARK: - Error check computed variables

    private var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" &&
            elements.last != "x" && elements.last != "/" && elements.count > 0
    }

    private var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    private var canAddOperator: Bool {
        return elements.count > 0 && elements.last != "+" &&
            elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
}
