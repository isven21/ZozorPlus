//
//  File.swift
//  CountOnMe
//
//  Created by iSven on 17/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

protocol alertVCPopUp {
    func alertVC(title: String, message: String)
}

class CountManager {
    var alertVCPopUpDelegate: alertVCPopUp!
    var operators: [String] = ["+"]
    var stringNumbers: [String] = [String()]

    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    alertVCPopUpDelegate.alertVC(title: "Zéro!", message: "Démarrez un nouveau calcul !")
                } else {
                    alertVCPopUpDelegate.alertVC(title: "Zéro!", message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                alertVCPopUpDelegate.alertVC(title: "Zéro!", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    func updateDisplay() -> String {
        var text = ""
        for (num, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if num > 0 {
                text += operators[num]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    func clear() -> String {
        stringNumbers = [String()]
        operators = ["+"]
            return ""
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
            for (num, stringNumber) in stringNumbers.enumerated() {
                if let number = Int(stringNumber) {
                    if operators[num] == "+" {
                        total += number
                    } else if operators[num] == "-" {
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
