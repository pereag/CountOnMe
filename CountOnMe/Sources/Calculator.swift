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
        return elements.last != "+" && elements.last != "-"
    }

    // MQRK: - Outputs

    var displayedText: ((String) -> Void)?

    //var displayedAlert: ((String, String, St) -> Void)?ring
    
    

    // MARK: - Inputs
    
    func didTap(_ text: String) {
        if expressionHaveResult {
            elements = []
        }
        elements.append(text)
    }
    
    func addAnAdditionSymboleToElements() {
        elements.append(" + ")
    }
    
    func addAnSubstractionSymboleToElements() {
        elements.append(" - ")
    }

    // MQRK: - Private Helpers

    private func processCalcul() {
        
    }
}
