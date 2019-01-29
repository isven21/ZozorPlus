//
//  File.swift
//  CountOnMe
//
//  Created by iSven on 17/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

protocol ErrorMessage {
    func alert(title: String, message: String)
}

class CountManager {
    
    var errorMessageDelegate: ErrorMessage?
    
    var operators: [String] = ["+"]
    var stringNumbers: [String] = [String()]

    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    errorMessageDelegate?.alert(title: "Zéro!", message: "Démarrez un nouveau calcul !")
                } else {
                    errorMessageDelegate?.alert(title: "Zéro!", message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                errorMessageDelegate?.alert(title: "Zéro!", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    
    func updateDisplay() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
    func plus() -> String {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func minus() -> String {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
   
        }
        return updateDisplay()
    }

    func calculateTotal() -> String {
        if !isExpressionCorrect {
            return ""
        }
        var total = 0
            for (i, stringNumber) in stringNumbers.enumerated() {
                if let number = Int(stringNumber) {
                    if operators[i] == "+" {
                        total += number
                    } else if operators[i] == "-" {
                        total -= number
                    }
                }
            }
        return "\(updateDisplay())=\(String(total))"
    }
    
    func addNewNumber(_ newNumber: Int) -> String {
            if let stringNumber = stringNumbers.last {
                var stringNumberMutable = stringNumber
                stringNumberMutable += "\(newNumber)"
                stringNumbers[stringNumbers.count-1] = stringNumberMutable
            }
        return updateDisplay()
    }
}
