//
//  Calculator.swift
//  CountOnMe
//
//  Created by Valc0d3 on 16/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

 class Calculator {

    // MARK: - Properties

    var elements: [String] = [] {
        didSet {
            displayedText?(elements.joined())
        }
    }

    func sum(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    func division(_ a: Int, _ b: Int) -> Int{
        return a / b
        
    }
    
    func substraction(_ a: Int, _ b: Int) -> Int{
        return a - b
    }
    
    func multiplication(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    // MARK: - Error check computed variables
    var expressionHaveResult: Bool {
        return elements.contains("=")
    }
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.count > 0 && elements.last != "+" && elements.last != "-"
    }

    // MQRK: - Outputs

    var displayedText: ((String) -> Void)?

    //var displayedAlert: ((String, String, String) -> Void)?
    
    

    // MARK: - Inputs
    
    func didTap(_ text: String) {
        if expressionHaveResult {
            elements = []
        }
        elements.append(text)
    }
    
    func addAnAdditionSymboleToElements() {
        elements.append("+")
    }
    
    func addAnSubstractionSymboleToElements() {
        elements.append("-")
    }
    
    func sendProcessCalcul() -> [String] {
        return processCalcul()
    }

    // MARK: - Private Helpers

    private func processCalcul() -> [String] {
        var operationsToReduce = elements
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce
    }
}
